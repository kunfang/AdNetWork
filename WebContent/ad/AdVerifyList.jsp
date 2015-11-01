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
				<b>您当前的位置 - 产品审核列表</b>
			</ul>
			<div class="leshu_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
					<td width="10%">产品名称</td>
					<td width="10%">发布时间</td>
					<td width="10%">系统</td>
					<td width="10%">单价（元）</td>
					<td width="10%">结算方式</td>
					<td width="10%">数据查看</td>
					<td width="10%">QQ</td>
					<td>详情</td>
					<td width="10%">操作</td>
				</tr>
				<c1:forEach items="${advertiserList}" var="advertiserList" >
				<%
				AdvertiserVO ad = (AdvertiserVO)pageContext.getAttribute("advertiserList");
				int verifystatus= ad.getVerifystatus();
				String verifystatusName = DictionaryMap.getDicDesc("verifystatus", verifystatus);
				int status= ad.getStatus();
				String statusName = DictionaryMap.getDicDesc("onlinestatus", status);
				
				int viewType= ad.getViewType();
				String viewTypeName = DictionaryMap.getDicDesc("viewtype", viewType);
				int platformType= ad.getPlatformType();
				String platformTypeName = DictionaryMap.getDicDesc("channelplat", platformType);
				int balanceType= ad.getBalanceType();
				String balanceTypeName = DictionaryMap.getDicDesc("balancetype", balanceType);
				%>
				<tr>
					<td>
                        <a onclick="getAdInfo(${advertiserList.advertiserID})">${advertiserList.prodName}</a>
					</td>
					<td><fmt:formatDate value="${advertiserList.datelastupdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><%=platformTypeName %></td>
					<td>${advertiserList.price}</td>
					<td><%=balanceTypeName %></td>
					<td><%=viewTypeName %></td>
					<td>${advertiserList.qq}</td>
					<td>${advertiserList.comments}</td>
					<td>
						<input type="button" class="leshu_a_w2" value="审核通过" onclick="verifyAd(${advertiserList.advertiserID},20)">
						<input type="button" class="leshu_a_w2" value="审核拒绝" onclick="verifyAd(${advertiserList.advertiserID},99)">
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
		<input type="hidden" name="advertiserID"/>
		<input type="hidden" name="verifystatus"/>
	</form:form>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	function verifyAd(id,status) {
		document.myform.method.value="updateAd";
		document.myform.advertiserID.value=id;
		document.myform.verifystatus.value=status;
		document.myform.submit();
	}
	$("#navboxuser").addClass("current");
</script>
</html>