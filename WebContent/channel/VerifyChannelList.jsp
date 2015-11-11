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
				<b>您当前的位置 - 渠道审核列表</b>
			</ul>
			<div class="leshu_table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="title">
				    <td width="2%" nowrap style="text-align: center;"><input type="checkbox" name="fids" onclick="checkAll(this)" /></td>
					<td width="6%">类型</td>
					<td width="13%">发布时间</td>
					<td width="6%">终端</td>
					<td width="7%">量级</td>
					<td width="10%">QQ</td>
					<td width="20%">详情</td>
					<td width="10%">操作</td>
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
				%>
				<tr>
				    <td nowrap style="text-align: center;">
					   <input type="checkbox" name="fid" id="fid${status.index}" value="${channelList.channelID}" onclick="checkThis(this)" />
					</td>
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
			<%@ include file="/common/pageLocation.jsp" %>
			<div align="center">
				<!--<input type="button" class="divCss"  value="待审核" onclick="toUpdate('10')"/> &nbsp;&nbsp;  -->
				<input type="button" class="divCss"  value="审核通过" onclick="toUpdate('20')"/> &nbsp;&nbsp;
				<input type="button" class="divCss"  value="审核拒绝" onclick="toUpdate('50')"/> &nbsp;&nbsp;
		    </div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="columnType" value=""/>
<input type="hidden" name="pricesize"/>
<input type="hidden" name="orderrule"/>
<input type="hidden" name="page"/>
<input type="hidden" name="pageSize" value="12"/>
<input type="hidden" name="method" value="getVerifyChannelList" />
<input type="hidden" name="channelID" value="" />
<input type="hidden" name="verifystatus" value="" />
<input type="hidden" name="ids" />
<input type="hidden" name="pageStr" />
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
	function verifyChannel(channelid,status) {
		document.myform.method.value="updateChannel";
		document.myform.channelID.value=channelid;
		document.myform.verifystatus.value=status;
		document.myform.submit();
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
		 for ( var i = 0; i < sel.length; i++) {
			 if(sel[i].checked){
				 ids+=document.getElementById("fid"+i).value+",";
			 }
		 }
		 if(ids==''){
			 alert("请至少选择一条记录!");
			 return ;
		 }
		 if(ids.length>1){
			 if(ins=="20"){
				 document.myform.verifystatus.value="20"; 
			 }
			 else if(ins=="50"){
				 document.myform.verifystatus.value="99"; 
			 }
		 }
		 document.myform.ids.value=ids.substring(0,ids.length-1);
		 document.myform.method.value="updateBatchChannel";
		 document.myform.pageStr.value="Y";
		 document.myform.submit();
	 }
</script>
</html>