package com.example.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.servlet.http.HttpSession;

/**
 * - 生成验证码
 */
public class FormatAuthCode {
    private static char[] chs = "0123456789QWERTYUIOPASDFGHJKLZXCVBNM".toCharArray();
    
    /**
     * - 生成验证码，并将其保存到session中，name="authCode"
     * 
     * @param count 验证码字数
     * @param width 宽
     * @param height 高
     * @param session
     * @return image 或 null
     */
    public static BufferedImage getAuthCode(int count, int width, int height, HttpSession session) {
        if (count < 1 || width < 1 || height < 1 || session == null) {
            return null;
        }
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);// 创建一张图片
        Graphics2D g = image.createGraphics();// 转为2D
        g.setColor(new Color(238, 238, 238));
        g.fillRect(0, 0, width, height);// 边框
        g.setFont(new Font("Times New Roman", Font.BOLD, 25));
        
        StringBuffer code = new StringBuffer();// 保存验证码字符串
        Random random = new Random();
        for (int i = 0; i < count; i++) {
            int index = random.nextInt(chs.length);
            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));// 随机字符颜色
            g.drawString(String.valueOf(chs[index]), 20 * i + 5, 23);// 画出字符
            code.append(chs[index]);// 验证码字符串
        }
        session.setAttribute("authCode", code.toString());
        return image;
    }

    private FormatAuthCode() {}
}
