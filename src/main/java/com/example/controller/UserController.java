package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.UserModel;
import com.example.service.IUserService;

@Controller
@RequestMapping("user")
//@RestController=@Controller+@ResponseBody
public class UserController {
	// http://127.0.0.1:8080/demo/user/toLogin
//	http://127.0.0.1:8080/demo/loginServlet

	@Autowired
	private IUserService userService;//@Autowired 实例化IUserService类，用userService可直接调用方法

	@RequestMapping("toLogin")
//	@RequestMapping(value = "/toLogin", method = RequestMethod.GET)
//	@GetMapping("toLogin")
	public String toLogin() {
		return "login";
	}

	@RequestMapping("login")
	public String login(UserModel userModel,String authCode,Model model,HttpSession session) {
		System.out.println(userModel);
		model.addAttribute("AA",userModel.getCode());
		if(authCode.equals(session.getAttribute("authCode")))
		{
			System.out.print("----ture----");
			
		}
		return "result";
	}

	@RequestMapping("login2")
	@ResponseBody
	public String login2(UserModel model) {
		return userService.login(model);
	}
	@RequestMapping("login3")
	@ResponseBody
	public UserModel login3(UserModel userModel)
	{
		
		System.out.print(userModel);
		return userModel;
	}
	

}
