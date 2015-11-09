<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.ftc.ad.vo.DictionaryMap" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/include.jsp" %>
</head>
<body>
<%@ include file="/header.jsp" %>
<form:form commandName="roleVO" method="post" action="userLoginlist.do" name="myform">
<div class="container">
	<div class="main_1200 clearfix">
		<%@ include file="/menu.jsp" %>
		<div class="xc_rightbox">
			<ul>
				<b>您当前的位置 - 菜单授权</b>
			</ul>
			<div class="leshu_table">
			   <div class="onebox onebox1">
			        <dl>
		                <dt>用户组：</dt>
		                <dd>
		                    <form:select path="roleId">
		                       <form:option value="" label="-------"></form:option>
		                       <form:options items="${roleList}" itemLabel="roleName" itemValue="roleId"/>
		                    </form:select>
		                </dd>
		            </dl>
			     </div>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tbody>
			    <tr>
				   <div align="center">
						<textarea cols="5" rows="1" style="width: 310px;height: 350px;">123</textarea>
						<input type="button" style="width: 40px;background: #5599ff;" value=">>"/>
						<input type="button" style="width: 40px;background: #5599ff;" value="<<"/>
						<textarea cols="5" rows="1" style="width: 310px;height: 350px;">123</textarea>
				   </div>
			     </tr>
			  </tbody>
			</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
	<input type="hidden" name="method" value="getMenuList"/>
	<input type="hidden" name="platformType" value=""/>
	<input type="hidden" name="channeltype" value=""/>
	<input type="hidden" name="channelsize" value=""/>
	<input type="hidden" name="orderrule"/>
	<input type="hidden" name="page"/>
	<input type="hidden" name="isflag" value="Y"/>
	<input type="hidden" name="status"/>
	<input type="hidden" name="verifystatus"/>
	<input type="hidden" name="ids"/>
	<input type="hidden" name="pageSize" value="12"/>
</form:form>
</body>
</html>