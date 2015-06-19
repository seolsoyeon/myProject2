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
	public @ResponseBody String addUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("addUser 들어옴");
		
		System.out.println("11111"+user);
		
		
		int confirm = userService.addUser(user);
			
		if(session.getAttribute("user") == null){
			session.setAttribute("user", user);
		}

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
	
/*	  @RequestMapping("/login.do") 
	  public @ResponseBody String login(@RequestParam("userId") String userId,
			  							@RequestParam("password") String password, HttpSession session) throws Exception {
	  
		  System.out.println("/login.do 들어감");
		  System.out.println(userId);
		  
		  User dbUser = userService.getUser(userId);
		  Owner dbOwner = ownerService.getOwner(userId);
		  Musician dbMusician = musicianService.getMusician(userId);
		  
	  
		  if(dbUser !=null ){
			  if (password.equals(dbUser.getPassword()) && userId.equals(dbUser.getUserId())) {
						  	session.setAttribute("user", dbUser); 
					  		session.setAttribute("owner", dbOwner); 
					  		session.setAttribute("musician", dbMusician); 
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
	  public String logintt(@ModelAttribute("user") User user, 
			  @ModelAttribute("owner") Owner owner,
			  @ModelAttribute("musician") Musician musician, HttpSession session) throws Exception {
		  System.out.println("/logindo.do 들어감");
	  		return "redirect:/jsp/logon_main.jsp"; 
	  }
	  
	 
	  @RequestMapping("/logout.do") public String logout(HttpSession session)
		  throws Exception {
		  
		  System.out.println("/logout.do");
		  
		  session.invalidate();
		  
		  return "redirect:/jsp/main.jsp"; 
	  }*/
	
}