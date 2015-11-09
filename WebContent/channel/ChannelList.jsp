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
    <style type="text/css">
          body {
		    width: 100%;
		    margin: 40px auto;
		    font-family: 'trebuchet MS', 'Lucida sans', Arial;
		    font-size: 14px;
		    color: #444;
	      }

		  table {
		    *border-collapse: collapse; /* IE7 and lower */
		    border-spacing: 0;
		    width: 100%;    
		  }
		  
		  span:hover{color:#e95c15;}
     </style>
<%@ include file="/common/include.jsp" %>
</head>
<body>
<%@ include file="/header.jsp" %>
<form:form commandName="channelVO" method="post" action="channel.do" name="myform">
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
			     <table class="zebra">
				    <thead>
				    <tr>
				        <th width="8%" align="center">类型</th>
				        <th width="40%">详情</th> 
				        <th width="8%">发布时间</th> 
				        <th width="34%">QQ</th>      
				        <th width="10%">量级</th>
				    </tr>
				    </thead>
				    <tfoot>
				    <tr>
				        <td>&nbsp;</td>        
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				    </tr>
				    </tfoot>
				
				<c1:forEach items="${channelList}" var="channelList" >
	          	<%ChannelVO channel = (ChannelVO)pageContext.getAttribute("channelList"); 
	          			String channeltypeName = DictionaryMap.getDicDesc("channeltype", channel.getChanneltype());
	          			String platformTypeName = DictionaryMap.getDicDesc("channelplat", channel.getPlatformType());
	          			String channelsizeName = DictionaryMap.getDicDesc("channelsize", channel.getChannelsize());
	          		%>
	          		<tr>
					        <td align="left"><font style="font-size: 18px;color: #959595;">[<%=channeltypeName %>]<%=platformTypeName %></font></td>        
					        <td align="left"><a href="#" target="_self"><font style="font-size: 16px;color: #000;"><span>${channelList.comments}</span></font></a></td>
					        <td align="left"><font style="color: #959595;"><fmt:formatDate value="${channelList.datelastupdated}" pattern="yyyy-MM-dd"/></font></td>
					        <td align="left"><font style="color: #959595;">${channelList.qq}</font></td>
					        <td align="left"><font style="color: #f90;font-weight: bold;font-size: 20px;"><%=channelsizeName %></font></td>
					 </tr> 
	          	</c1:forEach>
	          	</table>
	          	<%@ include file="/common/pageLocation.jsp" %>
			</div>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
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
	document.getElementById("curPage").value=page;
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