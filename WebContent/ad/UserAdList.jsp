<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.ftc.ad.vo.AdvertiserVO" %>
<%@ page import="com.ftc.ad.vo.DictionaryMap" %>
<% 
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/include.jsp" %>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container">
	<div class="main_1200 clearfix">
		<%@ include file="/menu.jsp" %>
		<div class="xc_rightbox">
			<ul>
				<b>您当前的位置 - 产品列表</b>
			</ul>
			<div class="leshu_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
					<td width="*">产品名称</td>
					<td width="10%">审核状态</td>
					<td width="10%">上线状态</td>
					<td width="15%">操作</td>
				</tr>
				<c1:forEach items="${advertiserList}" var="advertiserList" >
				<%
				AdvertiserVO ad = (AdvertiserVO)pageContext.getAttribute("advertiserList");
				int verifystatus= ad.getVerifystatus();
				String verifystatusName = DictionaryMap.getDicDesc("verifystatus", verifystatus);
				int status= ad.getStatus();
				String statusName = DictionaryMap.getDicDesc("onlinestatus", status);
				%>
				<tr>
					<td>
                        <a onclick="getAdInfo(${advertiserList.advertiserID})">${advertiserList.prodName}</a>
					</td>
					<td><%=verifystatusName %></td>
					<td><%=statusName %></td>
					<td>
						<input type="button" class="leshu_a_w2" value="删除" onclick="deleteAd(${advertiserList.advertiserID})">
						<c1:if test="${advertiserList.verifystatus==20}">
							<c1:choose>
								<c1:when test="${advertiserList.status==10}">
									<input type="button" class="leshu_a_w2" value="上线" onclick="updateAd(${advertiserList.advertiserID},20)">
								</c1:when>
								<c1:otherwise>
									<input type="button" class="leshu_a_w2" value="下线" onclick="updateAd(${advertiserList.advertiserID},10)">
								</c1:otherwise>
							</c1:choose>
						</c1:if>
					</td>
				</tr>
				</c1:forEach>
			</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
	<form:form commandName="adVO" method="post" action="advertiser.do" name="myform">
		<input type="hidden" name="method" value="" />
		<input type="hidden" name="advertiserID" value=""/>
		<input type="hidden" name="status" value="" />
	</form:form>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	function deleteAd(id) {
		document.myform.method.value="deleteAd";
		document.myform.advertiserID.value=id;
		document.myform.submit();
	}
	
	function updateAd(id,status) {
		document.myform.method.value="updateAd";
		document.myform.advertiserID.value=id;
		document.myform.status.value=status;
		document.myform.submit();
	}
	
	function getAdInfo(id) {
		document.myform.method.value="getAdInfo";
		document.myform.advertiserID.value=id;
		document.myform.submit();
	}
	$("#navboxuser").addClass("current");
</script>
</html>