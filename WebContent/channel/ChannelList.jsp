<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.ftc.ad.vo.DictionaryVO" %>
<%@ page import="com.ftc.ad.vo.ChannelVO" %>
<%@ page import="com.ftc.ad.vo.DictionaryMap" %>

<% String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/include.jsp" %>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="container_before">
	<div class="content-wrap">
		<div class="content" style="margin-bottom:30px;">
			<h1 class="jobs_cat js_cat"> <span value="1"><a href="#" target="_self">渠道列表</a></span></h1>
			<div class="chioce">
				<table>
					<tbody>
						<c1:choose>
							<c1:when test="${searchInfo.platformType==null}">
								<tr class="js_job" id="platformType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="platformType" value="${searchInfo.platformType}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">渠道平台</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.platformType==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${platList}" var="platList" >
								<c1:choose>
									<c1:when test="${searchInfo.platformType==platList.value}">
										<span class="on" value="${platList.value}">${platList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${platList.value}">${platList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<c1:choose>
							<c1:when test="${searchInfo.channeltype==null}">
								<tr class="js_job" id="channeltype" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="channeltype" value="${searchInfo.channeltype}">
							</c1:otherwise>
						</c1:choose>
						
							<td class="first">渠道类型</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.channeltype==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${typeList}" var="typeList" >
								<c1:choose>
									<c1:when test="${searchInfo.channeltype==typeList.value}">
										<span class="on" value="${typeList.value}">${typeList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${typeList.value}">${typeList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<c1:choose>
							<c1:when test="${searchInfo.channelsize==null}">
								<tr class="js_job" id="channelsize" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="channelsize" value="${searchInfo.channelsize}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">渠道量级</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.channelsize==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${sizeList}" var="sizeList" >
								<c1:choose>
									<c1:when test="${searchInfo.channelsize==sizeList.value}">
										<span class="on" value="${sizeList.value}">${sizeList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${sizeList.value}">${sizeList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<%
						ChannelVO info = (ChannelVO)request.getAttribute("searchInfo");
						int orderrule = info==null?0:info.getOrderruleValue();
						
						String orderruleStr = "all";
						if (orderrule > 0) {
							orderruleStr = orderrule+"";
						}
						
						%>
						<tr class="js_job" id="orderrule" value="<%=orderruleStr%>">
							<td class="first">排序规则</td>
							<td class="third">
								<% if (orderrule == 0) { %>
								<span class="on" value="all">全部</span>
								<%} else { %>
								<span value="all">全部</span>
								<%} %>
								<c1:forEach items="${orderList}" var="orderList" >
								<% 
									DictionaryVO dic = (DictionaryVO)pageContext.getAttribute("orderList");
									String valueName = dic.getValuename().replace("价格", "量级");
									if (orderrule == dic.getValue()) {
								%>
								<span class="on" value="${orderList.value}"><%=valueName %></span>
								<% } else { %>
								<span value="${orderList.value}"><%=valueName %></span>
								<% } %>
								</c1:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="jobs_info">
				<div class="jobs_info_title">
					<div style="width: 70px;">类型</div>
	          		<div style="width: 270px;">详情</div>
	          		<div style="width: 80px;">发布时间</div>
	          		<div style="width: 170px;">QQ</div>
	          		<div style="width: 120px;">量级</div>
				</div>
				<c1:forEach items="${channelList}" var="channelList" >
	          	<%ChannelVO channel = (ChannelVO)pageContext.getAttribute("channelList"); %>
	          	<div id="jobs_data" style="display: block;">
	          		<%
	          			String channeltypeName = DictionaryMap.getDicDesc("channeltype", channel.getChanneltype());
	          			String platformTypeName = DictionaryMap.getDicDesc("channelplat", channel.getPlatformType());
	          			String channelsizeName = DictionaryMap.getDicDesc("channelsize", channel.getChannelsize());
	          		%>
	          		<div class="el" style="background-color: rgb(255, 255, 255);">
	          			<div class="type">[<%=channeltypeName %>]<br><span><%=platformTypeName %></span></div>
	          			<div class="name"><a href="#" target="_self">${channelList.comments}</a></div>
	          			<div class="detail" style="width:840px;">
	          				<span class="company">${channelList.orgName}</span>
	          				<span class="but" style="width: 260px;">
	          					<span class="time"><fmt:formatDate value="${channelList.datelastupdated}" pattern="yyyy-MM-dd"/></span>
	          					<span class="location">${channelList.qq}</span>
	          				</span>
	          				<div class="money" style="width: 160px; margin-left:0px;"><span style="width: 160px;"><%=channelsizeName %></span></div>
	          			</div>
	          		</div>
	          	</div>
	          	</c1:forEach>
	          	<%@ include file="/common/pageLocation.jsp" %>
			</div>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
<form:form commandName="adVO" method="post" action="channel.do" name="myform">
	<input type="hidden" name="method" value="getChannelList"/>
	<input type="hidden" name="platformType" value=""/>
	<input type="hidden" name="channeltype" value=""/>
	<input type="hidden" name="channelsize" value=""/>
	<input type="hidden" name="orderrule"/>
	<input type="hidden" name="page"/>
	<input type="hidden" name="pageSize" value="12"/>
</form:form>
</body>
<script type="text/javascript">
var page = 1;
$(function(){
	$('.chioce .third span').each(function(index, element) {
        $(this).click(function(){
			$(this).parent().children('span').removeClass('on');
			$(this).parent().parent().attr('value', $(this).attr('value'));
			$(this).addClass('on');
			refreshData();
		});
    });
	
});
function refreshData() {
	$('.js_job').each(function(index, element) {
		var id = $(this).attr('id');
        var value = $(this).attr('value');
		if(value!='all') {
			$("input:hidden[name='"+id+"']").val(value);
		}
    });
	$("input:hidden[name='page']").val(page);
	document.myform.submit();
}
function ChangePage(obj, i){
	page = i;
	$(obj).parent().children('a').each(function(index, element) {
        $(this).removeClass('current');
    });
	$(obj).addClass('current');
	refreshData();
}
$("#navboxchannel").addClass("current");
</script>
</html>