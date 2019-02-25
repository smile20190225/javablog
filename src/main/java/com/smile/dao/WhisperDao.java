package com.smile.dao;

import com.smile.bean.Comment;
import com.smile.bean.Whisper;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WhisperDao {

    private QueryRunner runner = null;

    public WhisperDao() {
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public List<Whisper> getWhisperSet() {
        String sql = "select * from whisper";
        List<Whisper> whisperSet = null;
        try{
            whisperSet = new ArrayList<Whisper>();
            whisperSet = runner.query(sql,new BeanListHandler<Whisper>(Whisper.class));
        }catch (SQLException e){
            System.out.println("查询微语集失败");
            e.printStackTrace();
        }
        return whisperSet;
    }

    public int addWhisper(Whisper whisper) {
        String sql = "insert into whisper(userid,whispercontent,picturepath,whispertime) values(?,?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,whisper.getUserid(),whisper.getWhispercontent(),whisper.getPicturepath(),whisper.getWhispertime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }

    public int addWhisperComment(Comment comment) {
        String sql = "insert into comment(userid,whisperid,commentcontent,commenttime) values(?,?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,comment.getUserid(),comment.getWhisperid(),comment.getCommentcontent(),comment.getCommenttime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }

    public int addLove(int whisperid, int love) {
        String sql = "update whisper set love = ? where whisperid = ?";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,love,whisperid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }
}
