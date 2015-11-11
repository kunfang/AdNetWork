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
<form:form commandName="channelVO" method="post" action="channel.do" name="myform">
<div class="container">
	<div class="main_1200 clearfix">
		<%@ include file="/menu.jsp" %>
		<div class="xc_rightbox">
			<ul>
				<b>您当前的位置 - 所有渠道列表</b>
			</ul>
			<div class="leshu_table">
			   <div class="onebox onebox1">
			        <dl>
		                <dt>终端：</dt>
		                <dd>
		                    <form:select path="platformType">
		                       <form:option value="" label="-------"></form:option>
		                       <form:options items="${platList}" itemLabel="valuename" itemValue="value"/>
		                    </form:select>
		                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		                    <span>量级：</span>
		                    <form:select path="channelsize">
		                       <form:option value="" label="-------"></form:option>
		                       <form:options items="${sizeList}" itemLabel="valuename" itemValue="value"/>
		                    </form:select>
		                </dd>
		            </dl>
					<dl>
		                <dt>类型：</dt>
		                <dd>
		                    <form:select path="channeltype">
		                       <form:option value="" label="-------"></form:option>
		                       <form:options items="${typeList}" itemLabel="valuename" itemValue="value"/>
		                    </form:select>
		                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		                    <span>详情：</span><input type="text" class="leshu_a_input" style=" width:200px" id="comments" name="comments" placeholder="详情" value="${searchInfo.comments}"/>
		                    <span>&nbsp;<input type="button" style="width: 40px;background: #5599ff;" value="查询" onclick="toSearch()">
		                    </span>
		                </dd>
		            </dl>
			     </div>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
				    <td width="3%" nowrap style="text-align: center;"><input type="checkbox" name="fids" onclick="checkAll(this)" /></td>
					<td width="9%">类型</td>
					<td width="16%">发布时间</td>
					<td width="9%">终端</td>
					<td width="9%">量级</td>
					<td width="9%">审核状态</td>
					<td width="9%">上线状态</td>
					<td width="10%">QQ</td>
					<td width="20%">详情</td>
				</tr>
				<c1:forEach items="${channelList}" var="channelList" varStatus="status">
				<%
				ChannelVO channel = (ChannelVO)pageContext.getAttribute("channelList");
				int channeltype= channel.getChanneltype();
				String channeltypeName = DictionaryMap.getDicDesc("channeltype", channeltype);
				int platformType= channel.getPlatformType();
				String platformTypeName = DictionaryMap.getDicDesc("channelplat", platformType);
				int channelsize= channel.getChannelsize();
				String channelsizeName = DictionaryMap.getDicDesc("channelsize", channelsize);
				int verStatus= channel.getVerifystatus();
				String verStatusName = DictionaryMap.getDicDesc("verifystatus", verStatus);
				int status= channel.getStatus();
				String statusName = DictionaryMap.getDicDesc("onlinestatus", status);
				%>
				<tr>
				    <td nowrap style="text-align: center;">
					   <input type="checkbox" name="fid" id="fid${status.index}" value="${channelList.channelID}" onclick="checkThis(this)" />
					   <input type="hidden" name="verifys" id="verifystas${status.index}" value="${channelList.verifystatus}"/><!-- 审批状态 -->
					</td>
					<td>
                        <%=channeltypeName %>
					</td>
					<td><fmt:formatDate value="${channelList.datelastupdated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><%=platformTypeName %></td>
					<td><%=channelsizeName %></td>
					<td><%=verStatusName %></td>
					<td><%=statusName %></td>
					<td>${channelList.qq}</td>
					<td>${channelList.comments}</td>
				</tr>
				</c1:forEach>
			   </tbody>
			</table>
			<%@ include file="/common/pageLocation.jsp" %>
			<div align="center">
				<!--<input type="button" class="divCss"  value="待审核" onclick="toUpdate('10')"/> &nbsp;&nbsp; -->
				<input type="button" class="divCss"  value="审核通过" onclick="toUpdate('20')"/> &nbsp;&nbsp;
				<input type="button" class="divCss"  value="审核拒绝" onclick="toUpdate('50')"/> &nbsp;&nbsp;
				<input type="button" class="divCss"  value="上线" onclick="toUpdate('30')"/> &nbsp;&nbsp;
				<input type="button" class="divCss"  value="下线" onclick="toUpdate('40')"/>
		    </div>
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
	<input type="hidden" name="isflag" value="Y"/>
	<input type="hidden" name="status"/>
	<input type="hidden" name="verifystatus"/>
	<input type="hidden" name="ids"/>
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
		 document.myform.method.value="updateBatchChannel";
		 document.myform.pageStr.value="Y";
		 document.myform.submit();
	 }
	
	 function toSearch(){
		 document.myform.submit();
	 }
</script>
</html>