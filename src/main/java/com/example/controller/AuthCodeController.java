package com.example.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.util.FormatAuthCode;

@Controller
@RequestMapping("/common")
public class AuthCodeController {
   @RequestMapping("/authCode")
   public void authCode(HttpServletResponse response,HttpSession session)throws IOException{
   BufferedImage image=FormatAuthCode.getAuthCode(4,85,30,session);
   ImageIO.write(image,"jpg",response.getOutputStream());

   }
}
