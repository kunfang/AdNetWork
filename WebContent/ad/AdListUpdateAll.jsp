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
        <style type="text/css">
          .table1{width:70%; border-collapse:collapse;border:none;}
	      .table1 th{ text-align:right; font-weight:lighter;}
        </style>
</head>
<body>
<%@ include file="/header.jsp" %>
<form:form commandName="advertiserVO" method="post" action="advertiser.do" name="myform">
<div class="container">
   
	<div class="main_1200 clearfix" >
		<%@ include file="/menu.jsp" %>
		
		<div class="xc_rightbox" >
			<ul>
				<b>您当前的位置 - 所有产品列表</b>
			</ul>
			<div class="leshu_table" style="overflow-x:auto;overflow-y:hidden;">
			  <table style="width:90%; margin:0px auto; font-size:13px; padding-top:10px;border:solid 0px #add9c0;">
				<tr style="border:solid 0px #add9c0;">
				    <td style="border:solid 0px #add9c0;width: 18%;text-align: right;">产品类别：</td>
                    <td style="border:solid 0px #add9c0;text-align: left;">
                    	<form:select path="columnType">
	                       <form:option value="" label="-------"></form:option>
	                       <form:options items="${columnList}" itemLabel="valuename" itemValue="value"/>
	                    </form:select>
                    </td>
					<td style="border:solid 0px #add9c0;width: 18%;text-align: right;">系统：</td>
                    <td style="border:solid 0px #add9c0;width: 18%;text-align: left;">
                    	<form:select path="platformType">
	                       <form:option value="" label="-------"></form:option>
	                       <form:options items="${platList}" itemLabel="valuename" itemValue="value"/>
	                    </form:select>
                    </td>
                    <td style="border:solid 0px #add9c0;width: 18%;text-align: right;">结算方式：</td>
                    <td style="border:solid 0px #add9c0;text-align: left;">
                    	<form:select path="balanceType">
	                       <form:option value="" label="-------"></form:option>
	                       <form:options items="${balanceList}" itemLabel="valuename" itemValue="value"/>
	                    </form:select>
                    </td>
                    <td style="border:solid 0px #add9c0;width: 18%;text-align: right;">审核状态：</td>
                    <td style="border:solid 0px #add9c0;text-align: left;">
                    	<form:select path="verifystatus">
	                       <form:option value="" label="-------"></form:option>
	                       <form:options items="${verfiStatusList}" itemLabel="valuename" itemValue="value"/>
	                    </form:select>
                    </td>
				</tr >
				<tr style="border:solid 0px #add9c0;">
				    <td style="border:solid 0px #add9c0;width: 18%;text-align: right;">上线状态：</td>
                    <td style="border:solid 0px #add9c0;text-align: left;">
                    	<form:select path="status">
	                       <form:option value="" label="-------"></form:option>
	                       <form:options items="${onlineStatusList}" itemLabel="valuename" itemValue="value"/>
	                    </form:select>
                    </td>
					<td style="border:solid 0px #add9c0;width: 18%;text-align: right;">产品名称：</td>
                    <td style="border:solid 0px #add9c0;width: 18%;text-align: left;">
                    	<input type="text" class="leshu_a_input" style=" width:150px;" id="prodName" name="prodName" placeholder="产品名称" value="${searchInfo.prodName}" />
                    </td>
                    <td style="border:solid 0px #add9c0;width: 18%;text-align: right;">详情：</td>
                    <td style="border:solid 0px #add9c0;text-align: left;">
                    	<input type="text" class="leshu_a_input" style=" width:150px;" id="comments" name="comments" placeholder="详情" value="${searchInfo.comments}" />
                    </td>	
                    <td style="border:solid 0px #add9c0;text-align: left;" colspan="3">
                        &nbsp;&nbsp;
                        <input type="button" class="button pill primary" value="查询" onclick="toSearch()" />
                    </td>
				</tr >
			</table>
			<div style="width:1500px; margin:0px auto;">
			<table width="1500px" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
				    <td width="3%" nowrap style="text-align: center;"><input type="checkbox" name="fids" onclick="checkAll(this)" /></td>
					<td width="10%">产品名称</td>
					<td width="10%">发布时间</td>
					<td width="10%">系统</td>
					<td width="7%">单价（元）</td>
					<td width="10%">结算方式</td>
					<td width="10%">数据查看</td>
					<td width="10%">审核状态</td>
					<td width="10%">上线状态</td>
					<td width="9%">QQ</td>
					<td width="15%">详情</td>
				</tr>
				<c1:forEach items="${advertiserList}" var="advertiserList" varStatus="status">
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
				    <td nowrap style="text-align: center;">
					   <input type="checkbox" name="fid" id="fid${status.index}" value="${advertiserList.advertiserID}" onclick="checkThis(this)" />
					   <input type="hidden" name="verifys" id="verifystas${status.index}" value="${advertiserList.verifystatus}"/><!-- 审批状态 -->
					</td>
					<td>${advertiserList.prodName}</td>
					<td><fmt:formatDate value="${advertiserList.datelastupdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><%=platformTypeName %></td>
					<td>${advertiserList.price}</td>
					<td><%=balanceTypeName %></td>
					<td><%=viewTypeName %></td>
					<td><%=verifystatusName %></td>
					<td><%=statusName %></td>
					<td>${advertiserList.qq}</td>
					<td>${advertiserList.comments}</td>
				</tr>
				</c1:forEach>
			</tbody>
			</table>
			</div>
			   <%@ include file="/common/pageLocation.jsp" %>
					<div align="center" >
						<ul class="button-group">
						    <li><a class="button primary pill" onclick="toUpdate('20')">审核通过</a></li>
						    <li><a class="button primary pill" onclick="toUpdate('30')">上线</a></li>
						    <li><a class="button danger pill" onclick="toUpdate('50')">审核拒绝</a></li>
						    <li><a class="button danger pill" onclick="toUpdate('40')">下线</a></li>
						</ul>
						<!--<input type="button" class="divCss"  value="待审核" onclick="toUpdate('10')"/> &nbsp;&nbsp;  
						<input type="button" class="button primary"  value="审核通过" onclick="toUpdate('20')"/> &nbsp;&nbsp;
						<input type="button" class="button danger"  value="审核拒绝" onclick="toUpdate('50')"/> &nbsp;&nbsp;
						<input type="button" class="button primary"  value="上线" onclick="toUpdate('30')"/> &nbsp;&nbsp;
						<input type="button" class="button danger"  value="下线" onclick="toUpdate('40')"/>-->
				    </div>
			</div>
		</div>
		 
	</div> 
	
</div>
	<input type="hidden" name="method" value="getAdvertiserList"/>
	<input type="hidden" name="columnType" value=""/>
	<input type="hidden" name="pricesize"/>
	<input type="hidden" name="orderrule"/>
	<input type="hidden" name="page"/>
	<input type="hidden" name="pageSize" value="12"/>
	<input type="hidden" name="isflag" value="Y"/>
	<input type="hidden" name="ids" /><input type="hidden" name="verifystatus" />
	<input type="hidden" name="status" />
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
$("#navboxuser").addClass("current");

function checkThis(obj) {
	if (!obj.checked) {
		document.getElementsByName("fids")[0].checked = false;
	}
}

function checkAll(obj) {

	var v = obj.checked;
	var sel = document.getElementsByName("fid");
	for ( var i = 0; i < sel.length; i++) {
		sel[i].checked = v;
	}
}

 function toUpdate(ins){
	 var sel = document.getElementsByName("fid");
	 var ids='';
	 var status;
	 for ( var i = 0; i < sel.length; i++) {
		 var vsta=document.getElementById("verifystas"+i).value; //审批状态
		 if(sel[i].checked && vsta=='10' && ins =='30'){
			 alert("待审批状态的产品不能直接变为上线状态");
			 return ;
		 }
		 else if(sel[i].checked){
			 ids+=document.getElementById("fid"+i).value+",";
		 }
	 }
	 if(ids==''){
		 alert("请至少选择一条记录!");
		 return ;
	 }
	 if(ids.length>1){
		 //if(ins=="10"){
		 //   document.myform.verifystatus.value="10";
		 //}
		 if(ins=="20"){
			 document.myform.verifystatus.value="20"; 
		 }
		 else if(ins=="50"){
			 document.myform.verifystatus.value="99"; 
		 }
		 else if(ins=="30"){
			 document.myform.status.value="20";
		 }
		 else if(ins=="40"){
			 document.myform.status.value="10"; 
		 }
	 }
	 
	 document.myform.ids.value=ids.substring(0,ids.length-1);
	 document.myform.method.value="toUpdateStatus";
	 document.myform.submit();
 }
function toSearch(){
	document.myform.submit();
}
</script>
</html>