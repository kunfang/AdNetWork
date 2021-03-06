package com.ftc.ad.service;

import java.util.List;

import com.ftc.ad.vo.User;

public interface UserService {
	
	public List<User> checkLogin(User user) throws Exception; 
	
	public User toView(String empCde) throws Exception;
		
	public int doUpdate(User vo) throws Exception;
	
	public void doInsert(User vo) throws Exception;
	
	public int getUserByUsername(String userName) throws Exception;
}
