package com.smile.utils;


import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import java.util.List;
import java.util.Map;

public class POIUtils {

    public static HSSFWorkbook getHSSFWorkbook(String sheetName, String []title, List<Object[]> contentList){
        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建工作簿的表格
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //创建一行
        HSSFRow row = sheet.createRow(0);
        //创建单元格的样式
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        //创建单元格对象
        HSSFCell cell = null;
        //设置居中样式
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        //创建标题
        for(int i = 0; i < title.length; i ++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(cellStyle);
        }
        //创建内容

        int i = 0;
        for( Object[] objs  : contentList){
            row = sheet.createRow(i++);
            int j = 0;
            for(Object obj : objs){
                cell = row.createCell(j++);
                cell.setCellValue(obj+"");
                }
            System.out.println();
            }

        return workbook;

    }

}
