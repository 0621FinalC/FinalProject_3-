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
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model m, @ModelAttribute UserDTO dto) throws Exception {
		String forward = "";
		
		boolean result = user.join(dto);
		
		if(result) {
			forward = "redirect:/main";
		} else {
			// join failed
			m.addAttribute("data", dto);
			forward = "account/join";
		}
		
		return forward;
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
			session.setAttribute("userid", dto.getUserid());
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
	
	// 회원정보 불러오기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model m) throws Exception {
		// 세션 객체 안에 있는 id 저장
		String userid = (String) session.getAttribute("userid");
		
		// 서비스의 readUser 호출
		UserDTO dto = user.readUser(userid);
		
		// 정보저장 후 페이지 이동
		m.addAttribute("userData", dto);
		return "user/info";
	}
	
	// 회원정보창에서 '회원정보수정'버튼 눌렀을때. 회원정보 수정
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String info(@ModelAttribute UserDTO dto) throws Exception {
		String forward = "";
//		System.out.println("userid " + dto.getUserid());
		boolean result = user.updateUser(dto);
		
		if(result) {
			forward = "/user/logined";
		} else {
			// update failed
			forward = "/user/info";
		}
		return forward;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model m)throws Exception {
		// 세션 객체 안에 있는 id 저장
		String userid = (String) session.getAttribute("userid");
		
		// 서비스의 readUser 호출
		UserDTO dto = user.readUser(userid);
		
		// 정보저장 후 페이지 이동
		m.addAttribute("userData", dto);
		return "user/delete";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model m, @ModelAttribute UserDTO dto, HttpSession session)throws Exception {
		String forward ="";
		boolean result = user.deleteUser(dto);
		
		if(result) {
			session.invalidate();
			forward = "redirect:/main";
		} else {
			// delete failed
			m.addAttribute("userData", dto);
			m.addAttribute("error", "탈퇴 실패 : 비밀번호를 다시 입력하세요.");
			forward = "user/delete";
		}
		return forward;
	}
}