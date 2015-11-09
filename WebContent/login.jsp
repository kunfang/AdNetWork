<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.net.URLDecoder"%>
<% String path = request.getContextPath();
   Cookie[] cookies = request.getCookies();   
   String username33="";   
	if (cookies != null) {   
	    for (Cookie c : cookies) {   
	        if ("loginName".equals(c.getName())) {   
	            username33=URLDecoder.decode(c.getValue(), "utf-8"); 
	        }   
	    }   
	}   
%>


<!DOCTYPE html>
<html lang="cn" xmlns="http://www.w3.org/1999/xhtml"> 
<HEAD>
<%@ include file="/common/include.jsp" %>
</HEAD>
<body>
<%@ include file="/header.jsp" %>
<div class="banner">
	<div class="zl_1200">
		<div class="login_box clearfix">
		<h3>涌玉会员登录</h3>
			<form action="userLoginlist.do" method="POST" name="myform" onsubmit="return login()">
				<input type="hidden" name="method" value="getAssessSysMenubyList" />
				<font color=red id="errorInfo">${loginErrInfo}</font><c1:remove var="loginErrInfo"/>
				<div class="box"><span>用户名</span><div><input type="text" class="txt" id="username" name="username" value="<%=username33%>"></div></div>
				<div class="box"><span>密&nbsp;&nbsp;&nbsp;码</span><div><input type="password" name="password" id="password" class="txt"></div></div>
				<div class="box2"><label class="fuxuan"><input type="checkbox" name="fx" id="fx"><span>记住用户名</span></label><div class="password"><a href="#">忘记密码？</a></div></div>
				<div class="box3"><input type="submit" class="btn" value="登  录"></div>
			</form>
			<div class="box3"><a href="userLoginlist.do?method=registerUser">没有涌玉账号？现在开始创建</a></div>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript" >
	
		function getFocus(){
			document.getElementById("username").focus();
		 }
		function login(){
		    var name = document.getElementById("username").value.replace(/(^\s*)|(\s*$)/g, "");
			if(name == ""){
		     	document.getElementById("errorInfo").innerText="请输入登陆用户名";
		     	document.getElementById("username").focus();
		     	return false;
			}
			
		    var password = document.getElementById("password").value.replace(/(^\s*)|(\s*$)/g, "");
			if(password == ""){
		     	document.getElementById("errorInfo").innerText="请输入密码";
		     	document.getElementById("password").focus();
		     	return false;
		     	
			}
			if(document.myform.fx.checked){
				document.getElementById("fx").value="Y";
			}
			
			return true;
		}
		
        $("#navboxuser").addClass("current");
</script>
</html>
