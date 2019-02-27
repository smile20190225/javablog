package com.smile.servlet;

import com.alibaba.fastjson.JSONObject;
import com.smile.bean.*;
import com.smile.service.*;
import com.smile.utils.BaseServlet;
import com.smile.utils.ToolUtils;
import com.smile.utils.ValidateCode;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/servlet/HomeServlet")
public class HomeServlet extends BaseServlet {

    public void register(HttpServletRequest request, HttpServletResponse response){
        Message message = new Message();
        Map<String, Object> map = new HashMap<>();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String registertime = sdf.format(new Date());
        User user = new User(username, password, email, registertime);
        UserSevice userSevice = new UserSevice();
        int insert = userSevice.register(user);
        switch (insert){
            case 0:
                message.setMessage("用户已存在");
                message.setCode(0);
                break;
            case 1:
                message.setMessage("注册成功");
                message.setCode(1);
                break;
            case -1:
                message.setMessage("服务器出现一丢丢问题~");
                message.setCode(-1);
                break;
            default:
                    break;
        }
        UserServlet.responseMessage(request,response,message);
        /*try{
            response.getWriter().println(JSONObject.toJSONString(message));
        }catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    public void checkCode(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("lalalalala");
        String submitCode = request.getParameter("captcha");
        String code = (String)request.getSession().getAttribute("code");
        try {
            if(submitCode.equalsIgnoreCase(code))response.getWriter().println(true);
            else response.getWriter().println(false);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void sendCode(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        response.setContentType("image/png");// 设置响应的类型格式为图片格式
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
 //System.out.println("哈哈哈哈哈哈哈哈哈");
        ValidateCode vCode = new ValidateCode();
        vCode.createValidateCode();
        session.setAttribute("code", vCode.getCode());
        try {
            vCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Message message = new Message();
        UserSevice userSevice = new UserSevice();
        int code = userSevice.login(username,password);
        System.out.println("dhagha");
        switch (code){
            case 0:
                message.setMessage("用户不存在！");
                break;
            case -1:
                message.setMessage("密码输入错误！");
                break;
            case 1:
                message.setMessage("登录成功");
                User user = userSevice.findUserByName(username);
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
        }
        try {
            response.setContentType("text/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(JSONObject.toJSONString(message));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void isLogin(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int isLogin = 0;
        User user = (User)session.getAttribute("user");
        Message message = new Message();
        Map<String, Object> map = new HashMap<>();
        message.setMessage("无用户登录");
        if(user!=null){
            isLogin = 1;
            map.put("user",user);
            message.setMessage("用户已登录");
        }
        map.put("isLogin",isLogin);

        //获取所有文章
        ArticleService articleService = new ArticleService();
        List<Article> articleList = articleService.showAllArticle();
        map.put("articleList", articleList);

        List<Article> newSet = null;  //深度复制articleList
        List<Article> hotSet = null;
        try {
            newSet = this.deepCopy(articleList);
            hotSet = this.deepCopy(articleList);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //按日期排序
        Collections.sort(articleList, new Comparator<Article>() {
            public int compare(Article a1, Article a2) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                try{
                    Date d1 = sdf.parse(a1.getPublictime());
                    Date d2 = sdf.parse(a2.getPublictime());
                    if (d1.getTime() > d2.getTime()) {
                        return 1;
                    } else if (d1.getTime() < d2.getTime()) {
                        return -1;
                    } else {
                        return 0;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    return 0;
                }

            }
        });

        //按评论数排序
        Collections.sort(articleList, new Comparator<Article>() {
            public int compare(Article a1, Article a2) {
                if(a1.getCommentcount()>a2.getCommentcount())return 1;
                else if(a1.getCommentcount() < a2.getCommentcount())return -1;
                else return 0;
            }
        });
        map.put("newSet",newSet);
        map.put("hotSet",hotSet);
        message.setDetail(map);
        try {
            response.getWriter().println(JSONObject.toJSONString(message));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static <T> List<T> deepCopy(List<T> src) throws IOException, ClassNotFoundException {
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        ObjectOutputStream out = new ObjectOutputStream(byteOut);
        out.writeObject(src);

        ByteArrayInputStream byteIn = new ByteArrayInputStream(byteOut.toByteArray());
        ObjectInputStream in = new ObjectInputStream(byteIn);
        @SuppressWarnings("unchecked")
        List<T> dest = (List<T>) in.readObject();
        return dest;
    }

    public void goSingle(HttpServletRequest request, HttpServletResponse response){
        String aid = request.getParameter("articleid");
        HttpSession session = request.getSession();
        int articleid = Integer.parseInt(aid);
        ArticleService articleService = new ArticleService();
        User articleUser = new User();//文章作者信息
        Article article = new Article();//文章信息
        List ucSet = new ArrayList();
        article = articleService.findArticleById(articleid);
        articleUser = articleService.findUserById(article.getUserid());
        ucSet = articleService.getUCSet(articleid);
        Message message = new Message();
        Map<String, Object> map = new HashMap<>();
        map.put("ucSet", ucSet);//评论与用户的信息集合
        map.put("articleUser",articleUser);
        map.put("article",article);
        User loginUser = (User)session.getAttribute("user");
        int isLogin = 0;
        if(loginUser!=null){
            map.put("loginUser",loginUser);
            isLogin = 1;
        }
        map.put("isLogin",isLogin);

        //获取所有文章
        List<Article> articleList = articleService.showAllArticle();
        List<Article> newSet = null;  //深度复制articleList
        List<Article> hotSet = null;
        try {
            newSet = this.deepCopy(articleList);
            hotSet = this.deepCopy(articleList);
        } catch (Exception e){
            e.printStackTrace();
        }
        map.put("newSet",newSet);
        map.put("hotSet",hotSet);
        message.setDetail(map);
        UserServlet.responseMessage(request,response,message);
    }

    public void publicArticle(HttpServletRequest request, HttpServletResponse response){

        int flag = 0;//0-单文件上传（发表文章） 1-多文件上传（发表微语）
        int count = 0;
        Article article = new Article();
        Photo photo = new Photo();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String publictime = sdf.format(new Date());
        User user = (User)request.getSession().getAttribute("user");
        int userid = user.getUserid();

        Whisper whisper = new Whisper();
        String picturepath = "";
        int index;
        String imagePath ;
        String contentimage;

        Map<String,Integer> map=new HashMap<String, Integer>();
        map.put("title", 1);
        map.put("type", 2);
        map.put("content", 3);
        map.put("whispercontent",4);
        map.put("mood",5);
        map.put("position",6);


        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = this.getServletContext().getRealPath("/static/upload");
        //上传时生成的临时文件保存目录
        String tempPath = this.getServletContext().getRealPath("/static/temp");

        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        //消息提示
        //String message = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
            factory.setSizeThreshold(1024*10000);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
            //设置上传时生成的临时文件的保存目录
            factory.setRepository(tmpFile);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //监听文件上传进度
            upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
                    /**
                     * 文件大小为：14608,当前已处理：4096
                     文件大小为：14608,当前已处理：7367
                     文件大小为：14608,当前已处理：11419
                     文件大小为：14608,当前已处理：14608
                     */
                }
            });
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return;
            }
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024*10);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*20);
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    switch(map.get(name)){
                        case 1:
                            flag = 0;
                            article.setTitle(value);
                            break;
                        case 2:
                            article.setType(value);
                            break;
                        case 3:
                            article.setContent(value);
                            break;
                        case 4:
                            flag = 1;
                            whisper.setWhispercontent(value);
                            break;
                        case 5:
                            flag = 2;
                            photo.setMood(value);
                            break;
                        case 6:
                            flag = 2;
                            photo.setPosition(value);
                            break;
                        default:
                            break;
                    }
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
                    System.out.println(filename);
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    //得到上传文件的扩展名
                    String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                    System.out.println("上传的文件的扩展名是："+fileExtName);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //得到文件保存的名称
                    String saveFilename = makeFileName(filename);
                    //得到文件的保存目录
                    String realSavePath = makePath(saveFilename, savePath);

                    imagePath = realSavePath+"\\"+saveFilename;
                    index = imagePath.indexOf("static");
                    contentimage = imagePath.substring(index);
                    if(count == 0){
                        picturepath += contentimage;
                        count++;
                    }else{
                        picturepath += "*" + contentimage;
                    }

                    //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024*100];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;

                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }

                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    //item.delete();
                    //message = "文件上传成功！";
                    if(flag == 0){
                        ArticleService articleService = new ArticleService();
                        article.setUserid(userid);
                        article.setPublictime(publictime);
                        //图片完整路径
                        article.setContentimage(contentimage);
                        int isPublic = articleService.publicArticle(article);
                        response.sendRedirect("/blog/home/message.html");
                    }
                }
            }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "单个文件超出最大值！！！");
            //request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
            //request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }catch (Exception e) {
            //message= "文件上传失败！";
            e.printStackTrace();
        }
        System.out.println(picturepath);
        if(flag == 1){
            WhisperService whisperService = new WhisperService();
            whisper.setPicturepath(picturepath);
            whisper.setUserid(userid);
            whisper.setWhispertime(publictime);
            whisperService.addWhisper(whisper);
            //String preUrl = request.getHeader("Referer");
        }else{
            PhotoService photoService = new PhotoService();
            photo.setPhotopath(picturepath);
            photo.setPhototime(publictime);
            photo.setUserid(userid);
            photoService.uploadPhoto(photo);
        }
        try {
            if(flag==1)response.sendRedirect("/blog/home/message2.html");
            response.sendRedirect("/blog/user/album.html?bloggerid="+userid);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String makeFileName(String filename){  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        long t = System.currentTimeMillis();
        String str = String.valueOf(t);
        //return UUID.randomUUID().toString() + "_" + filename;
        return str + filename;
    }

    /**
     * 为防止一个目录下面出现太多文件，要使用hash算法打散存储
     *
     * @param filename 文件名，要根据文件名生成存储目录
     * @param savePath 文件存储路径
     * @return 新的存储目录
     */
    public String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        //int hashcode = filename.hashCode();
        //int dir1 = hashcode&0xf;  //0--15
        //int dir2 = (hashcode&0xf0)>>4;  //0-15

        Calendar cale = Calendar.getInstance();
        int dir1 = cale.get(Calendar.MONTH) + 1;
        int dir2 = cale.get(Calendar.DATE);

        //构造新的保存目录
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir;
    }

    public void addComment(HttpServletRequest request, HttpServletResponse response){
        Comment comment = new Comment();
        CommentService commentService = new CommentService();
        String uid = request.getParameter("userid");
        String aid = request.getParameter("articleid");
        String where = request.getParameter("where");
        String commentcontent = request.getParameter("commentcontent");
        int userid = Integer.parseInt(uid);
        int articleid = Integer.parseInt(aid);
        String commenttime = ToolUtils.getFormatTime();
        comment.setUserid(userid);
        comment.setArticleid(articleid);
        comment.setCommenttime(commenttime);
        comment.setCommentcontent(commentcontent);
        commentService.addComment(comment);
        try {
            if(where.equals("0"))response.sendRedirect("/blog/home/single.html?articleid="+articleid);
            else response.sendRedirect("/blog/user/details.html?articleid="+articleid);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
