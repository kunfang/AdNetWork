<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.ftc.ad.vo.ChannelVO" %>
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
				<b>您当前的位置 - 渠道审核列表</b>
			</ul>
			<div class="leshu_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
					<td width="10%">类型</td>
					<td width="10%">发布时间</td>
					<td width="10%">终端</td>
					<td width="10%">量级</td>
					<td width="10%">QQ</td>
					<td>详情</td>
					<td width="10%">操作</td>
				</tr>
				<c1:forEach items="${channelList}" var="channelList" >
				<%
				ChannelVO channel = (ChannelVO)pageContext.getAttribute("channelList");
				int channeltype= channel.getChanneltype();
				String channeltypeName = DictionaryMap.getDicDesc("channeltype", channeltype);
				int platformType= channel.getPlatformType();
				String platformTypeName = DictionaryMap.getDicDesc("channelplat", platformType);
				int channelsize= channel.getChannelsize();
				String channelsizeName = DictionaryMap.getDicDesc("channelsize", channelsize);
				%>
				<tr>
					<td>
                        <%=channeltypeName %>
					</td>
					<td><fmt:formatDate value="${channelList.datelastupdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><%=platformTypeName %></td>
					<td><%=channelsizeName %></td>
					<td>${channelList.qq}</td>
					<td>${channelList.comments}</td>
					<td>
						<input type="button" class="leshu_a_w2" value="审核通过" onclick="verifyChannel(${channelList.channelID},20)">
						<input type="button" class="leshu_a_w2" value="审核拒绝" onclick="verifyChannel(${channelList.channelID},99)">
					</td>
				</tr>
				</c1:forEach>
			</tbody>
			</table>
			</div>
		</div>
	</div>
</div>
	<form:form commandName="channelVO" method="post" action="channel.do" name="myform">
		<input type="hidden" name="method" value="getChannelList" />
		<input type="hidden" name="channelID" value="" />
		<input type="hidden" name="verifystatus" value="" />
	</form:form>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	function verifyChannel(channelid,status) {
		document.myform.method.value="updateChannel";
		document.myform.channelID.value=channelid;
		document.myform.verifystatus.value=status;
		document.myform.submit();
	}
	$("#navboxuser").addClass("current");
</script>
</html>