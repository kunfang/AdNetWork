<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<c1:if test="${userInfo == null || userInfo.username == null}">
	<c1:redirect url="login.jsp"></c1:redirect>
</c1:if>
<div class="xc_leftbox">
	<ul class="xc_title">
		<c1:forEach items="${menuList}" var="menuList">
			<li id="usermenu${menuList.menuId}"><a href="<%=path %>${menuList.menuUrl}&onid=${menuList.menuId}">${menuList.menuNme}</a></li>
		</c1:forEach>
	</ul>
</div>