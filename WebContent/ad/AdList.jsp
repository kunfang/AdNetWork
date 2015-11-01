<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="com.ftc.ad.vo.AdvertiserVO" %>
<%@ page import="com.ftc.ad.vo.DictionaryVO" %>
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
			<h1 class="jobs_cat js_cat"> <span value="1"><a href="#" target="_self">产品列表</a></span></h1>
			<div class="chioce">
				<table>
					<tbody>
						<c1:choose>
							<c1:when test="${searchInfo.columnType==null}">
								<tr class="js_job" id="columnType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="columnType" value="${searchInfo.columnType}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">产品类别</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.columnType==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${columnList}" var="columnList" >
								<c1:choose>
									<c1:when test="${searchInfo.columnType==columnList.value}">
										<span class="on" value="${columnList.value}">${columnList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${columnList.value}">${columnList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<c1:choose>
							<c1:when test="${searchInfo.platformType==null}">
								<tr class="js_job" id="platformType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="platformType" value="${searchInfo.platformType}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">产品平台</td>
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
							<c1:when test="${searchInfo.balanceType==null}">
								<tr class="js_job" id="balanceType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="balanceType" value="${searchInfo.balanceType}">
							</c1:otherwise>
						</c1:choose>
						
							<td class="first">结算方式</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.balanceType==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${balanceList}" var="balanceList" >
								<c1:choose>
									<c1:when test="${searchInfo.balanceType==balanceList.value}">
										<span class="on" value="${balanceList.value}">${balanceList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${balanceList.value}">${balanceList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<c1:choose>
							<c1:when test="${searchInfo.viewType==null}">
								<tr class="js_job" id="viewType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="viewType" value="${searchInfo.viewType}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">数据查看</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.viewType==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${viewList}" var="viewList" >
								<c1:choose>
									<c1:when test="${searchInfo.viewType==viewList.value}">
										<span class="on" value="${viewList.value}">${viewList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${viewList.value}">${viewList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<c1:choose>
							<c1:when test="${searchInfo.cooperationType==null}">
								<tr class="js_job" id="cooperationType" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="cooperationType" value="${searchInfo.cooperationType}">
							</c1:otherwise>
						</c1:choose>
							<td class="first">合作方式</td>
							<td class="third">
								<c1:choose>
									<c1:when test="${searchInfo.cooperationType==null}">
										<span class="on" value="all">全部</span>
									</c1:when>
									<c1:otherwise>
										<span value="all">全部</span>
									</c1:otherwise>
								</c1:choose>
								<c1:forEach items="${cooperList}" var="cooperList" >
								<c1:choose>
									<c1:when test="${searchInfo.cooperationType==cooperList.value}">
										<span class="on" value="${cooperList.value}">${cooperList.valuename}</span>
									</c1:when>
									<c1:otherwise>
										<span value="${cooperList.value}">${cooperList.valuename}</span>
									</c1:otherwise>
								</c1:choose>
								</c1:forEach>
							</td>
						</tr>
						<%
						AdvertiserVO info = (AdvertiserVO)request.getAttribute("searchInfo");
						int pricesize = info==null?0:info.getPricesizeValue();
						int orderrule = info==null?0:info.getOrderruleValue();
						
						String pricesizeStr = "all";
						if (pricesize > 0) {
							pricesizeStr = pricesize+"";
						}
						
						String orderruleStr = "all";
						if (orderrule > 0) {
							orderruleStr = orderrule+"";
						}
						
						%>
						<tr class="js_job" id="pricesize" value="<%=pricesizeStr %>">
							<td class="first">价格区间</td>
							<td class="third">
								<% if (pricesize == 0) { %>
								<span class="on" value="all">全部</span>
								<%} else { %>
								<span value="all">全部</span>
								<%} %>
								<c1:forEach items="${priceList}" var="priceList" >
								<% 
									DictionaryVO dic = (DictionaryVO)pageContext.getAttribute("priceList"); 
									if (pricesize == dic.getValue()) {
								%>
								<span class="on" value="${priceList.value}">${priceList.valuename}</span>	
								<% } else { %>
								<span value="${priceList.value}">${priceList.valuename}</span>
								<% } %>
								</c1:forEach>
							</td>
						</tr>
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
									if (orderrule == dic.getValue()) {
								%>
								<span class="on" value="${orderList.value}">${orderList.valuename}</span>
								<% } else { %>
								<span value="${orderList.value}">${orderList.valuename}</span>
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
	          		<div style="width: 270px;">名称</div>
	          		<div style="width: 80px;">发布时间</div>
	          		<div style="width: 170px;">结算</div>
	          		<div style="width: 120px;">单价</div>
	          		<div style="width: 80px;">QQ</div>
	          		<div style="width: 280px;">详情</div>
				</div>
				<c1:forEach items="${advertiserList}" var="advertiserList" >
	          	<%AdvertiserVO ad = (AdvertiserVO)pageContext.getAttribute("advertiserList"); %>
	          	<div id="jobs_data" style="display: block;">
	          		<% 
	          			String columnTypeName = DictionaryMap.getDicDesc("channeltype", ad.getColumnType());
	          			String platformTypeName = DictionaryMap.getDicDesc("channelplat", ad.getPlatformType());
	          			String balanceTypeName = DictionaryMap.getDicDesc("balancetype", ad.getBalanceType());
	          			String viewTypeName = DictionaryMap.getDicDesc("viewtype", ad.getViewType());
	          		%>
	          		<div class="el" style="background-color: rgb(255, 255, 255);">
	          			<div class="type">[<%=columnTypeName %>]<br><span><%=platformTypeName %></span></div>
	          			<div class="name"><a href="#" target="_self">${advertiserList.prodName}</a><span style="display: none;" class="show_detail">查看详情</span></div>
	          			<div class="detail" style="width:840px;">
	          				<span class="company">${advertiserList.orgName}</span>
	          				<span class="but" style="width: 260px;">
	          					<span class="time"><fmt:formatDate value="${advertiserList.datelastupdated}" pattern="yyyy-MM-dd"/></span>
	          					<span class="location"><%=balanceTypeName %>（<%=viewTypeName %>）</span>
	          				</span>
	          				<div class="money" style="width: 100px; margin-left:0px;"><span style="width: 100px;">${advertiserList.price}</span></div>
	          				<span style="width: 80px;float: left;">${advertiserList.qq}</span>
	          				<span>${advertiserList.comments}</span>
	          			</div>
	          		</div>
	          	</div>
	          	</c1:forEach>
	          	<%@ include file="/common/pageLocation.jsp" %>
			</div>
		</div>
	</div>
</div>
<form:form commandName="adVO" method="post" action="advertiser.do" name="myform">
	<input type="hidden" name="method" value="getAdvertiserList"/>
	<input type="hidden" name="columnType" value=""/>
	<input type="hidden" name="platformType" value=""/>
	<input type="hidden" name="balanceType" value=""/>
	<input type="hidden" name="viewType" value=""/>
	<input type="hidden" name="cooperationType" value=""/>
	<input type="hidden" name="pricesize"/>
	<input type="hidden" name="orderrule"/>
	<input type="hidden" name="page"/>
	<input type="hidden" name="pageSize" value="12"/>
</form:form>
<%@ include file="/footer.jsp" %>
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
$("#navboxad").addClass("current");
</script>
</html>