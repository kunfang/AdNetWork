<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><% String path = request.getContextPath();%><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><HEAD><%@ include file="/common/include.jsp" %></HEAD><body><%@ include file="/header.jsp" %>	<div class="zcbox">	<div class="mainbox">		<form action="userLoginlist.do" method="post" id="registerForm">		<input type="hidden" name="method" id="method" value="registerUser"/>		<input type="hidden" name="isClient" value="1">		<div class="onebox onebox1">			<p>设置用户名（不能使用中文）</p>			<dl>                <dt>* 用户名：</dt>                <dd>                    <input name="username" id="username" type="text" class="leshu_a_input" value="" style=" width:200px" placeholder="请输入用户名,3-20位"/>                </dd>            </dl>            <dl>                <dt>* Email：</dt>                <dd>				<input name="email" id="email" type="text" value="" class="leshu_a_input" style=" width:200px" placeholder="请输入邮箱">                </dd>           </dl>            <dl>                <dt>* 密码：</dt>                <dd>                    <input name="password" id="password" type="password" value="" class="leshu_a_input" style=" width:200px" placeholder="请输入密码,6-18位">                </dd>            </dl>            <dl>                <dt>* 密码确认：</dt>                <dd>                    <input name="comfpassword" id="comfpassword" type="password" value="" class="leshu_a_input" style=" width:200px" placeholder="请再次输入密码确认">                </dd>            </dl>		</div>		<div class="tijiao">			<input type="submit" value="提交注册信息">        </div>		</form>	</div></div><%@ include file="/footer.jsp" %></body><script type="text/javascript"> $("#navboxuser").addClass("current");$.validator.addMethod("checkuser", function(value) {	var result = 0;	$.ajax({		type: "POST",		url: "<%=path%>/userLoginlist.do?method=checkUserName&username="+value,		async: false,		success: function(data){			result = data;		}	});		return result == "1"?true:false;}, '用户名已经注册');$().ready(function() {	$("#registerForm").validate({		rules : {			username :{				required : true,				minlength : 3,				maxlength : 20,				checkuser : true,				numberAndLettersVal:true			},			password: {                required: true,                minlength : 6,				maxlength : 18            },            comfpassword: {                required: true,                minlength : 6,				maxlength : 18,                equalTo: "#password"            },            email: {                required: true,                email: true            }		},		messages:{			username : {				required :"请输入你的用户名",				minlength :"用户名长度3-20位",				maxlength :"用户名长度3-20位",				checkuser : "用户名已经注册"			},			password : {				required : "请输入密码",				minlength :"密码长度6-18位",				maxlength :"密码长度6-18位"			},			comfpassword : {				required : "请确认密码",				minlength :"密码长度6-18位",				maxlength :"密码长度6-18位",				equalTo : "需要和密码一致"			},			email: {                required: "请输入邮箱",                email: "请输入正确格式的邮箱"            }		}		});});	jQuery.validator.addMethod("numberAndLettersVal",function(value,element){  		  return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);  	   },$.validator.format("用户名必须为字母或数字")  	 );  </script></html>