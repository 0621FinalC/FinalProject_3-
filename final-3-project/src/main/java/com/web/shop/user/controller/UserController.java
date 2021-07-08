package com.web.shop.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.user.dto.UserDTO;
import com.web.shop.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	UserService user;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model m, @ModelAttribute UserDTO dto, HttpServletRequest req) throws Exception {
		String forward = "";
		user.login(dto);
		
		if(!(dto.getUserid().equals(""))) {
			// dto.getUserid() 값이 ""이 아니면 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user", dto);
			session.setAttribute("logined", true);
			forward = "/user/logined";
		} else {
			// dto.getUserid() 값이 ""이면 로그인 실패
			m.addAttribute("data", dto);
			m.addAttribute("error", "로그인 실패");
			forward = "user/login";
		}
		return forward;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/main");
		return mv;
	}
	
}
