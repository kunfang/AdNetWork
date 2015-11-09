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
<form:form commandName="adVO" method="post" action="advertiser.do" name="myform">
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
						<c1:choose>
							<c1:when test="${searchInfo.prodWay==null}">
								<tr class="js_job" id="prodWay" value="all">
							</c1:when>
							<c1:otherwise>
								<tr class="js_job" id="prodWay" value="${searchInfo.prodWay}">
							</c1:otherwise>
						</c1:choose>
						<td class="first">投放形式</td>
						<td class="third">
							<c1:choose>
								<c1:when test="${searchInfo.prodWay==null}">
									<span class="on" value="all">全部</span>
								</c1:when>
								<c1:otherwise>
									<span value="all">全部</span>
								</c1:otherwise>
							</c1:choose>
							<c1:forEach items="${wayList}" var="wayList" >
							<c1:choose>
								<c1:when test="${searchInfo.prodWay==wayList.value}">
									<span class="on" value="${wayList.value}">${wayList.valuename}</span>
								</c1:when>
								<c1:otherwise>
									<span value="${wayList.value}">${wayList.valuename}</span>
								</c1:otherwise>
							</c1:choose>
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
			    <table class="zebra">
				    <thead>
				    <tr>
				        <th width="10%">类型</th>        
				        <th width="12%">名称</th>
				        <th width="9%">发布时间</th>
				        <th width="11%">结算</th>
				        <th width="7%">投放形式</th>
				        <th width="11%">单价</th>
				        <th width="10%">QQ</th>
				        <th width="30%">详情</th>
				    </tr>
				    </thead>
				    <tfoot>
				    <tr>
				        <td>&nbsp;</td>        
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				    </tr>
				    </tfoot>  
				    <c1:forEach items="${advertiserList}" var="advertiserList" >  
				       <%
				          AdvertiserVO ad = (AdvertiserVO)pageContext.getAttribute("advertiserList"); 
				          String columnTypeName = DictionaryMap.getDicDesc("channeltype", ad.getColumnType());
	          			  String platformTypeName = DictionaryMap.getDicDesc("channelplat", ad.getPlatformType());
	          			  String balanceTypeName = DictionaryMap.getDicDesc("balancetype", ad.getBalanceType());
	          			  String viewTypeName = DictionaryMap.getDicDesc("viewtype", ad.getViewType());
	          			  String wayName = DictionaryMap.getDicDesc("verifyWay", ad.getProdWay()); //投放形式
				       %>
					    <tr>
					        <td align="left"><font style="font-size: 18px;color: #959595;">[<%=columnTypeName %>]<%=platformTypeName %></font></td>        
					        <td align="left"><a href="#" target="_self"><font style="font-size: 16px;color: #000;"><span>${advertiserList.prodName}</span></font></a></td>
					        <td align="left"><font style="color: #959595;"><fmt:formatDate value="${advertiserList.datelastupdated}" pattern="yyyy-MM-dd"/></font></td>
					        <td align="left"><font style="color: #959595;"><%=balanceTypeName %>（<%=viewTypeName %>）</font></td>
					        <td align="left"><font style="color: #959595;"><%=wayName %></font></td>
					        <td align="left" class="money"><font style="color: #f90;font-weight: bold;font-size: 20px;">${advertiserList.price}</font></td>
					        <td align="left"><font style="color: #959595;">${advertiserList.qq}</font></td>
					        <td align="left"><font style="color: #959595;">${advertiserList.comments}</font></td>
					    </tr> 
				    </c1:forEach>
				    
				</table>
				<%@ include file="/common/pageLocation.jsp" %>   
			</div>
		</div>
	</div>
</div>
	<input type="hidden" name="method" value="getAdvertiserList"/>
	<input type="hidden" name="columnType" value=""/>
	<input type="hidden" name="platformType" value=""/>
	<input type="hidden" name="balanceType" value=""/>
	<input type="hidden" name="viewType" value=""/>
	<input type="hidden" name="cooperationType" value=""/>
	<input type="hidden" name="prodWay" value=""/>
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
$("#navboxad").addClass("current");
</script>
</html>