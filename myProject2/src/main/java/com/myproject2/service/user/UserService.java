package com.myproject2.service.user;


import com.myproject2.domain.User;


public interface UserService{
	
	public int addUser(User user)throws Exception;

	public boolean checkDuplication(String userId) throws Exception;
	
	public User getUser(String userId)throws Exception;
	
	/*	public void updateUser(User user) throws Exception;
	
	
	public Map<String, Object> updatePasswd(User user) throws Exception;
	
	
	public User findUserId(String email)throws Exception;
	
	
	public Map<String, Object> getUserList(Search search)throws Exception;
	
	
	
	*/
	

}