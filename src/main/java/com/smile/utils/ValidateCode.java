package com.smile.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;

import java.io.*;

//验证码类
public class ValidateCode {
    private int width; //验证码图片的宽
    private int height;	//图片的高
    private int codeCount; //验证码字数
    private int lineCount; //验证码干扰线
    private BufferedImage buffImg = null; //验证码图片
    private String code = null ;//验证码
    public static Random random = new Random(); //随机数变量
    private char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W','X', 'Y', 'Z',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
            '1', '2', '3', '4', '5', '6', '7', '8', '9'};		// 验证码范围,去掉0(数字)和O(拼音)容易混淆的(小写的1和L也可以去掉,大写不用了)

    public ValidateCode() {
        width = 250; //验证码图片的宽
        height = 60;	//图片的高
        codeCount = 4; //验证码字数
        lineCount = 6; //验证码干扰线
    }

    public ValidateCode(int width, int height, int codeCount, int lineCount) {
        this.width = width;
        this.height = height;
        this.codeCount = codeCount;
        this.lineCount = lineCount;
    }

    //画图像
    public void drawImage() {
        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
        Graphics2D g = buffImg.createGraphics();
    }

    //画干扰线的方法
    public void drawLine(BufferedImage buffImg) {
        Graphics2D g = buffImg.createGraphics();//获得图像画笔
        Color c = g.getColor();
        int red, green, blue; //线条颜色
        for(int i = 0; i < lineCount; i++) {
            int xb = random.nextInt(width/2);//线头x坐标
            int yb = random.nextInt(height/2);
            int xe = xb+random.nextInt(width/2);//线尾y坐标
            int ye = yb+random.nextInt(height/2);
            red = random.nextInt(255);
            green = random.nextInt(255);
            blue = random.nextInt(255);
            g.setColor(new Color(red, green, blue));
            g.drawLine(xb, yb, xe, ye);
        }
        g.setColor(c);
    }

    //画验证码
    public void drawCode(BufferedImage buffImg) {
        Graphics2D g = buffImg.createGraphics();
        Color c = g.getColor();
        g.setFont(new Font("微软雅黑", Font.BOLD, 35));
        StringBuffer sb = new StringBuffer();
        int red, green, blue; //线条颜色
        int x = 50 ;
        for(int i = 0; i < codeCount; i++) {
            String str = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
            red = random.nextInt(255);
            green = random.nextInt(255);
            blue = random.nextInt(255);
            g.setColor(new Color(red, green, blue));

            double d = new Random().nextInt() % 30;// 设置字体弧度
            g.rotate(d * Math.PI / 180, x, 40);// 字体是写在矩形里面 需要考虑字体空间以及字体的坐标，y标是不变的的
            g.drawString(str, x, 40);// 将字体弧度回调，不然下一个字体会旋转出去
            g.rotate(-d * Math.PI / 180, x, 40);
            // 字体大小是 20，每间隔10 在写入一个
            x += 50;
            sb.append(str);
        }
        code = sb.toString();
        g.setColor(c);
    }

    public void createValidateCode() {
        drawImage();
        drawCode(buffImg);
        drawLine(buffImg);
        System.out.println(code);
    }

    public String getCode() {
        return code;
    }


    public void write(String path) throws IOException {
        OutputStream sos = new FileOutputStream(path);
        this.write(sos);
    }

    public void write(OutputStream sos) throws IOException {
        ImageIO.write(buffImg, "png", sos);
        sos.close();
    }

    //main方法
    /*public static void main(String[] args) {
        ValidateCode vCode = new ValidateCode();
        try {
            vCode.createValidateCode();
            String path="D:/"+new Date().getTime()+".png";
            System.out.println(vCode.getCode()+" >"+path);
            vCode.write(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }*/
}


