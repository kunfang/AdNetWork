package com.ftc.ad.service;

import java.util.List;

import com.ftc.ad.vo.RoleVO;
import com.ftc.ad.vo.SysMenuVO;
import com.ftc.ad.vo.User;



public interface SysMenuService {
	
	public List<SysMenuVO> selectAssessSysMenu(String userCde) throws Exception;
    
    public List<User> checkLogin(User user) throws Exception; 
	
	public User toView(String empCde) throws Exception;
	
	public int doUpdate(User vo) throws Exception;
	
	public List<RoleVO> getRoleList(RoleVO role) throws Exception;
}
