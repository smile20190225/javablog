package com.smile.service;

import com.smile.bean.Word;
import com.smile.dao.WordDao;

import java.util.List;

public class WordService {
    private WordDao wordDao = new WordDao();

    public int addWord(Word word) {
        return wordDao.addWord(word);
    }

    public List getWordSet(int toid) {
        return wordDao.getWordSet(toid);
    }
}
