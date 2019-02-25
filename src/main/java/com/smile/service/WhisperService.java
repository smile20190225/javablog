package com.smile.service;

import com.smile.bean.Comment;
import com.smile.bean.Whisper;
import com.smile.dao.WhisperDao;

import java.util.List;

public class WhisperService {
    private WhisperDao whisperDao = new WhisperDao();


    public List<Whisper> getWhisperSet() {
        return whisperDao.getWhisperSet();
    }

    public int addWhisper(Whisper whisper) {
        return whisperDao.addWhisper(whisper);
    }

    public int addWhisperComment(Comment comment) {
        return whisperDao.addWhisperComment(comment);
    }

    public int addLove(int whisperid, int love) {
        return whisperDao.addLove(whisperid,love);
    }
}
