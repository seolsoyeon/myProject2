package com.myproject2.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject2.domain.User;
import com.myproject2.service.user.UserService;



@Controller
public class UserController {
	

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {

		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping("/addUser.do")
	public @ResponseBody String addUser(@ModelAttribute("user") User user) throws Exception {
		System.out.println("addUser 들어옴");
		
		System.out.println("11111"+user);
		
		int confirm = userService.addUser(user);

		if(confirm == 1){
			return "true";
		}else
			return "false";
	}

	@RequestMapping("/checkDuplication.do")
	public @ResponseBody String checkDuplication(@RequestParam("userId") String userId) throws Exception {
		System.out.println("checkDuplication start");
		System.out.println("/checkDuplication.do");
		System.out.println("검사할 userId : "+userId);

		boolean result = userService.checkDuplication(userId);
		String temp = String.valueOf(result);
		System.out.println("temp: "+temp);
		return temp;
	}
	
	@RequestMapping("/login.do") 
	public @ResponseBody String login(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("/login.do 들어감");
		System.out.println(user);

		User dbUser = userService.getUser(user.getUserId());



		if(dbUser !=null ){
			if (user.getPassword().equals(dbUser.getPassword()) && user.getUserId().equals(dbUser.getUserId())) {
				session.setAttribute("user", dbUser); 
				System.out.println("/login.do DB Ok");
				return "true"; 
			}
			else{
				return "false";
			}
		}else{
			System.out.println("/login.do DB 실패");
			return "false";
		}
	}
	  
	@RequestMapping("/logindo.do") 
	public String logintt(@ModelAttribute("user") User user) throws Exception {
		System.out.println("/logindo.do 들어감");
		return "redirect:/jsp/index.jsp"; 
	}
	  
	 
	@RequestMapping("/logout.do") public String logout(HttpSession session)
			throws Exception {

		System.out.println("/logout.do");

		session.invalidate();

		return "redirect:/jsp/index.jsp"; 
	}
	
}