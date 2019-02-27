package com.smile.servlet;

import com.alibaba.fastjson.JSONObject;
import com.smile.bean.*;
import com.smile.service.*;
import com.smile.utils.BaseServlet;
import com.smile.utils.ToolUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/servlet/UserServlet")
public class UserServlet extends BaseServlet {

    private UserSevice userSevice = new UserSevice();

    public void goUserSpace(HttpServletRequest request, HttpServletResponse response){
        Message message = new Message();
        Map<String,Object> map = new HashMap<String,Object>();
        String uid = request.getParameter("bloggerid");
        int userid = Integer.parseInt(uid);
        User user = new User();
        User blogger = userSevice.findUserById(userid);
        List<Article> userArticleList = new ArrayList<Article>();
        userArticleList = userSevice.getUserArticleList(userid);
        message.setMessage("进入博主空间成功！");
        message.setCode(1);
        map.put("userArticleList",userArticleList);
        map.put("blogger",blogger);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public static void responseMessage(HttpServletRequest request, HttpServletResponse response,Message message){
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().println(JSONObject.toJSONString(message));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void goDetails(HttpServletRequest request, HttpServletResponse response){
        Message message = new Message();
        Map<String, Object> map = new HashMap<>();
        ArticleService articleService = new ArticleService();
        User articleUser = new User();//文章作者信息
        Article article = new Article();//文章信息
        String aid = request.getParameter("articleid");
        int articleid = Integer.parseInt(aid);
        HttpSession session = request.getSession();

        List ucSet = new ArrayList();
        article = articleService.findArticleById(articleid);
        articleUser = articleService.findUserById(article.getUserid());
        ucSet = articleService.getUCSet(articleid);

        map.put("articleUser",articleUser);
        map.put("article",article);
        map.put("ucSet", ucSet);//评论与用户的信息集合
        User loginUser = (User)session.getAttribute("user");
        int isLogin = 0;
        if(loginUser!=null){
            isLogin = 1;
            map.put("loginUser",loginUser);
        }
        map.put("isLogin",isLogin);

        //获取所有文章
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void goWhisper(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Message message = new Message();
        Map<String,Object> map = new HashMap<>();
        WhisperService whisperService = new WhisperService();
        List<Whisper> whisperSet = whisperService.getWhisperSet();
        int isLogin = 0;
        User loginUser = (User)session.getAttribute("user");
        if(loginUser!=null){
            isLogin = 1;
            map.put("loginUser",loginUser);
        }
        map.put("isLogin",isLogin);
        map.put("whisperSet",whisperSet);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void getWhisperComment(HttpServletRequest request, HttpServletResponse response){

        Message message = new Message();
        Map<String,Object> map = new HashMap<>();
        CommentService commentService = new CommentService();
        String wid = request.getParameter("whisperid");
        int whisperid = Integer.parseInt(wid);
        List whisperCommentSet = commentService.getWhisperComment(whisperid);
        map.put("whisperCommentSet",whisperCommentSet);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void addWhisperComment(HttpServletRequest request, HttpServletResponse response){
        Comment comment = new Comment();
        WhisperService whisperService = new WhisperService();
        String wid = request.getParameter("whisperid");
        int whisperid = Integer.parseInt(wid);
        User loginUser = (User)request.getSession().getAttribute("user");
        int userid = loginUser.getUserid();
        String commentcontent = request.getParameter("whispercomment");
        String commmenttime = ToolUtils.getFormatTime();
        comment.setUserid(userid);
        comment.setWhisperid(whisperid);
        comment.setCommentcontent(commentcontent);
        comment.setCommenttime(commmenttime);
        whisperService.addWhisperComment(comment);
        try {
            response.sendRedirect("/blog/user/whisper.html");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void goLeacots(HttpServletRequest request, HttpServletResponse response){
        Message message = new Message();
        HttpSession session = request.getSession();
        String bloggerid = request.getParameter("bloggerid");
        int toid = Integer.parseInt(bloggerid);
        Map<String,Object> map = new HashMap<>();
        int isLogin = 0;
        User loginUser = (User)session.getAttribute("user");
        Word word = new Word();
        WordService wordService = new WordService();
        List wordSet = wordService.getWordSet(toid);
        if(loginUser!=null){
            map.put("loginUser",loginUser);
            isLogin = 1;
        }
        map.put("isLogin",isLogin);
        map.put("wordSet",wordSet);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void addWord(HttpServletRequest request, HttpServletResponse response){
        Word word = new Word();
        WordService wordService = new WordService();
        String bloggerid = request.getParameter("bloggerid");
        int toid = Integer.parseInt(bloggerid);
        User loginUser = (User)request.getSession().getAttribute("user");
        int userid = loginUser.getUserid();

        String messagecontent = request.getParameter("messagecontent");
        String messagetime = ToolUtils.getFormatTime();

        word.setMessagecontent(messagecontent);
        word.setMessagetime(messagetime);
        word.setToid(toid);
        word.setUserid(userid);
        wordService.addWord(word);
        try {
            response.sendRedirect("/blog/user/leacots.html?bloggerid="+bloggerid);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void goAlbum(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        String bid = request.getParameter("bloggerid");
        Message message = new Message();
        Map<String,Object> map = new HashMap<>();
        int bloggerid = Integer.parseInt(bid);
        User loginUser = (User)session.getAttribute("user");
        int isLogin = 0;

        PhotoService photoService = new PhotoService();
        List photoSet = photoService.getPhotoSet(bloggerid);
        if(loginUser!=null){
            isLogin = 1;
            map.put("loginUser",loginUser);
        }
        map.put("isLogin",isLogin);
        map.put("photoSet",photoSet);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void addLove(HttpServletRequest request, HttpServletResponse response){
        String wid = request.getParameter("whisperid");
        String lv = request.getParameter("love");
        int whisperid = Integer.parseInt(wid);
        int love = Integer.parseInt(lv);
        WhisperService whisperService = new WhisperService();
        whisperService.addLove(whisperid,love);
    }

}
