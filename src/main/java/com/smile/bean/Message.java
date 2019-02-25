package com.smile.bean;

import java.util.Map;

public class Message {
    private int code; //0 成功  1 失败
    private String message;
    private Map<String, Object> detail;

    public Message() {
    }

    public Message(int code, String message, Map<String, Object> detail) {
        this.code = code;
        this.message = message;
        this.detail = detail;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getDetail() {
        return detail;
    }

    public void setDetail(Map<String, Object> detail) {
        this.detail = detail;
    }
}
