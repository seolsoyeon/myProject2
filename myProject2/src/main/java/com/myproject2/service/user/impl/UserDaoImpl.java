package com.myproject2.service.user.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.myproject2.domain.User;
import com.myproject2.service.user.UserDao;



@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public UserDaoImpl() {
		
	}

/*	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
*/
	@Override
	public int insertUser(User user) throws Exception {
		return sqlSession.insert("UserMapper.addUser", user);
		
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	
	/*
	@Override
	public void updateUser(User userVO) throws Exception {
		sqlSession.selectOne("UserMapper.updateUser", userVO);
	}
	
	@Override
	public List<User> updatePasswd(User user) throws Exception {
		return sqlSession.selectList("UserMapper.updatePasswd",user);
		//return sqlSession.selectMap(arg0, arg1, arg2)
		//sqlSession.se
	}

	
	@Override
	public User findUserId(String email) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.findUserId", email);

	}*/
		/*
	@Override
	public  List<User> getUserList(Search search) throws Exception {
		

		
		return sqlSession.selectList("UserMapper.getUserList", search);
		
	
	}

		
	}*/


}
