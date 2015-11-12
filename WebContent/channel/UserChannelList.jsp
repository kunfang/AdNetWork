<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.ftc.ad.vo.DictionaryVO" %>
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
					<b>您当前的位置 - 渠道列表</b>
				</ul>
				<div class="leshu_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
            		<tbody>
            			<tr class="title">
			  				<td width="*">详情</td>
			            	<td width="10%">审核状态</td>
			            	<td width="10%">上线状态</td>
			            	<td width="15%">操作</td>
            			</tr>
                        <c1:forEach items="${channelList}" var="channelList" >
                        <%
                        ChannelVO channel = (ChannelVO)pageContext.getAttribute("channelList");
                        int verifystatus= channel.getVerifystatus();
						String verifystatusName = DictionaryMap.getDicDesc("verifystatus", verifystatus);
						int status= channel.getStatus();
						String statusName = DictionaryMap.getDicDesc("onlinestatus", status);
                        %>
                        <tr>
                        	<td>
                        		<a onclick="getChannelInfo(${channelList.channelID})">&nbsp;${channelList.comments}</a>
							</td>
							<td><%=verifystatusName %></td>
							<td><%=statusName %></td>
							<td>
								<input type="button" class="button danger" value="删除" onclick="deleteChannel(${channelList.channelID})">
								<c1:if test="${channelList.verifystatus==20}">
									<c1:choose>
										<c1:when test="${channelList.status==10}">
											<input type="button" class="button primary" value="上线" onclick="updateChannel(${channelList.channelID},20)">
										</c1:when>
										<c1:otherwise>
											<input type="button" class="button danger" value="下线" onclick="updateChannel(${channelList.channelID},10)">
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
	<form:form commandName="channelVO" method="post" action="channel.do" name="myform">
		<input type="hidden" name="method" value="getChannelList" />
		<input type="hidden" name="channelID" value="" />
		<input type="hidden" name="status" value="" />
	</form:form>
</div>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	function deleteChannel(channelid) {
		document.myform.method.value="deleteChannel";
		document.myform.channelID.value=channelid;
		document.myform.submit();
	}
	
	function updateChannel(channelid,status) {
		document.myform.method.value="updateChannel";
		document.myform.channelID.value=channelid;
		document.myform.status.value=status;
		document.myform.submit();
	}
	
	function getChannelInfo(channelid) {
		document.myform.method.value="getChannelInfo";
		document.myform.channelID.value=channelid;
		document.myform.submit();
	}
	$("#navboxuser").addClass("current");
</script>
</html>