package com.myproject2.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.myproject2.domain.User;
import com.myproject2.service.user.UserDao;
import com.myproject2.service.user.UserService;




@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao){
		this.userDao=userDao;
	}
	public UserServiceImpl() {
	
	}

	public int addUser(User user) throws Exception {
		return userDao.insertUser(user);
	}

	
	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
	
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	
/*  public User loginUser(User user) throws Exception {
			User dbUser=userDao.getUser(user.getUserId());

			if(! dbUser.getPassword().equals(user.getPassword()))
				throw new Exception("비밀번호불일치.");
			
			return dbUser;
	}

	
	
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	public Map<String, Object> updatePasswd(User user) throws Exception {
		
		List<User> list = userDao.updatePasswd(user);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("list", list);
		
		return map1;
	}

	
	
	public User findUserId(String email)throws Exception{
		
		return userDao.findUserId(email);
		
	}
	*/
/*
	public Map<String,Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	//	return userDAO.getUserList(search);
	}

	*/

	
}