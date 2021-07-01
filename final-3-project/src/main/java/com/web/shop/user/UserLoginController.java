package com.web.shop.user;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	
	private final UserService userService;
	
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}
	
	//로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET) 
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) { return "/user/login"; 
	}
	
	//로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST) 
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception { 
		
		UserVO userVO = userService.login(loginDTO); 
		
		if (userVO == null || !BCrypt.checkpw(loginDTO.getPassword(), userVO.getPassword())) {
			return; 
			}
		
		model.addAttribute("user", userVO);
		
		// 로그인 유지를 선택할 경우
		if (loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7; //7일
			//로그인 유지 기간 설정
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			userService.keepLogin(userVO.getUserid(), httpSession.getId(), sessionLimit);
		}
	}

}
