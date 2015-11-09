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
			<h1 class="jobs_cat js_cat"> <span value="1"><a href="#" target="_self">密码修改</a></span></h1>
			<div class="onebox onebox1">
				<dl>
	                <dt><font color="red">* </font>旧密码：</dt>
	                <dd>
	                    <input type ="password" class="leshu_a_input" style=" width:200px" name="oldPsd" id="oldPsd" placeholder="旧密码" />
	                </dd>
	            </dl>
	            <dl>
	                <dt><font color="red">* </font>新密码：</dt>
	                <dd>
	                    <input type ="password" class="leshu_a_input" style=" width:200px" name="newPsd" id="newPsd" placeholder="新密码" />
	                </dd>
	            </dl>
	            <dl>
	                <dt><font color="red">* </font>确认密码：</dt>
	                <dd>
	                    <input type ="password" class="leshu_a_input" style=" width:200px" name="newPsdAgain" id="newPsdAgain" placeholder="确认密码" />
	                </dd>
	            </dl>
	            <div>
			   		<input type="button" value="保存" style="width: 70px;float: left;margin-left: 100px;background: #5599ff;" onclick="updatePsdOk()">
			   		<input type="button" value="重置" style="width: 70px;float: left;margin-left: 10px;background: #5599ff;" onclick="reset()">
		       </div>
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
	<input type="hidden" name="prodWay" value=""/>
	<input type="hidden" name="pricesize"/>
	<input type="hidden" name="orderrule"/>
	<input type="hidden" name="page"/>
	<input type="hidden" name="pageSize" value="12"/>
</form:form>
<%@ include file="/footer.jsp" %>
<script type="text/javascript">
		var myRequest = getXMLHttpObj();
		function updatePsdOk(){
		   var oldPsd = document.getElementById("oldPsd").value;
		   var newPsd = document.getElementById("newPsd").value;
		   var newPsdAgain = document.getElementById("newPsdAgain").value;
		   if(oldPsd == "" || newPsd == "" || newPsdAgain == ""){
		      alert("密码不能为空");
		      return;
		    }
		    if(newPsd != newPsdAgain){
		       alert("新密码2次输入不一致");
		       document.getElementById("newPsd").value = "";
		       document.getElementById("newPsdAgain").value = "";
		       return;
		     } 
		    var url = "<%=path%>/userLoginlist.do?method=pwd";
		     url += "&oldPsd="+oldPsd;
		     url += "&newPsd="+newPsd;
			 //request=getXMLHttpObj();
			 url = encodeURI(url);
			 myRequest.open("POST", url, true);
			 myRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			 myRequest.onreadystatechange =callback_updatePsdOk;
			 myRequest.send(null);
		}
		
		function callback_updatePsdOk(){
			 if (myRequest.readyState == 4) {
				if (myRequest.status == 200) {
	              var tt=myRequest.responseText;
	                if(tt == "1"){
	                   alert("密码修改成功！");
	                }else if(tt == "0"){
	                  alert("旧密码输入出错！");
	                  document.getElementById("oldPsd").value = "";
	                }else{
	                  alert("操作出险异常！");
	                }
	            }
			 }
		}
		
		function getXMLHttpObj() {
			var axO = [ 'Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.4.0',
					'Msxml2.XMLHTTP.3.0', 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP' ], i;
			for (i = 0; i < axO.length; i++)
				try {
					return new ActiveXObject(axO[i]);
				} catch (e) {
				}
			if (typeof (XMLHttpRequest) != 'undefined')
				return new XMLHttpRequest();
			return null;
		}
		
		function reset(){
			document.getElementById("newPsd").value = "";
		    document.getElementById("newPsdAgain").value = "";
		}
</script>
</body>
</html>