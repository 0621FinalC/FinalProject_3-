package com.web.shop.user.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.shop.user.service.UserService;

@Controller
@RequestMapping("/ajax")
public class AjaxUserController {
	
	@Autowired
	UserService user;
	
	@RequestMapping(value = "/userid", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String checkUserid(@RequestParam String userid) throws Exception {
		// 결과가 false 일 때 사용중인 닉네임이 없다.
		boolean res = user.checkUserid(userid);
		
		// response.setContentType("application/json; charset=utf-8");
		JSONObject json = new JSONObject();
		if(res) {
			// 입력한 아이디는 존재
			json.put("result", true);
		} else {
			// 사용하지 않는 아이디
			json.put("result", false);
		}
		return json.toJSONString();
		
	}
	
}
