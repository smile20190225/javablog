package com.smile.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ToolUtils {
    public static String getFormatTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return sdf.format(new Date());
    }
}
