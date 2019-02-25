package com.smile.dao;

import com.smile.bean.Word;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WordDao {
    private QueryRunner runner = null;
    public WordDao() {
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public List getWordSet(int toid) {
        String sql = "SELECT * \n" +
                "FROM message m\n" +
                "JOIN USER u\n" +
                "ON m.userid = u.userid\n" +
                "WHERE m.toid = ?\n" +
                "ORDER BY m.messagetime DESC";
        List wordSet =  null;
        wordSet = new ArrayList<>();
        try {
            wordSet = runner.query(sql,new MapListHandler(),toid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wordSet;
    }

    public int addWord(Word word) {
        String sql = "insert into message(userid,toid,messagetime,messagecontent) values(?,?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,word.getUserid(),word.getToid(),word.getMessagetime(),word.getMessagecontent());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }
}
