package com.myproject2.service.user;


import com.myproject2.domain.User;




public interface UserDao{
	
	
	// INSERT
	public int insertUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	
	/*	
	// UPDATE 
	public void updateUser(User user) throws Exception ;
	
	public List<User> updatePasswd(User user) throws Exception ;
	
	public User findUserId(String email) throws Exception ;
	
	
	
	// SELECT LIST 
	public List<User> getUserList(Search search) throws Exception ;

	
	
	public int getTotalCount(Search search) throws Exception ;
	*/
	
	
}