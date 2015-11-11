<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
				<b>您当前的位置 - 发布渠道</b>
			</ul>
			<div class="leshu_table">
				<form:form commandName="channelVO" method="post" action="channel.do" id="channelform">
					<input type="hidden" name="method" value="saveChannel" />
					<input type="hidden" name="userID" value="${userInfo.userid}" />
					<input type="hidden" name="channelID" value="${channelInfo.channelID}" />
					<input type="hidden" name="verifystatus" value="10" />
					<input type="hidden" name="status" value="10" />
					<div class="onebox onebox1">
						<dl>
			                <dt>* 渠道平台：</dt>
			                <dd>
			                    <c1:forEach items="${platList}" var="platList">
									<label class="radio-inline">
										<c1:choose>
											<c1:when test="${platList.value==channelInfo.platformType}">
												<input type="radio" name="platformType" value="${platList.value}" checked> ${platList.valuename}
											</c1:when>
											<c1:otherwise>
												<input type="radio" name="platformType" value="${platList.value}"> ${platList.valuename}
											</c1:otherwise>
										</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 渠道类型：</dt>
			                <dd>
			                    <c1:forEach items="${typeList}" var="typeList">
									<label class="radio-inline">
										<c1:choose>
											<c1:when test="${typeList.value==channelInfo.channeltype}">
												<input type="radio" name="channeltype" value="${typeList.value}" checked> ${typeList.valuename}
											</c1:when>
											<c1:otherwise>
												<input type="radio" name="channeltype" value="${typeList.value}"> ${typeList.valuename}
											</c1:otherwise>
										</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 渠道量级：</dt>
			                <dd>
			                    <c1:forEach items="${sizeList}" var="sizeList">
									<label class="radio-inline">
										<c1:choose>
											<c1:when test="${sizeList.value==channelInfo.channelsize}">
												<input type="radio" name="channelsize" value="${sizeList.value}" checked> ${sizeList.valuename}
											</c1:when>
											<c1:otherwise>
												<input type="radio" name="channelsize" value="${sizeList.value}"> ${sizeList.valuename}
											</c1:otherwise>
										</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>手机：</dt>
			                <dd>
								<input name="mobilePhone" maxlength="20" id="mobilePhone" type="text" value="${channelInfo.mobilePhone}" class="leshu_a_input" style=" width:200px" placeholder="手机">
			                </dd>
			           </dl>
			           <dl>
			                <dt>微信：</dt>
			                <dd>
								<input name="wechat"  maxlength="30" id="wechat" type="text" value="${channelInfo.wechat}" class="leshu_a_input" style=" width:200px" placeholder="微信">
			                </dd>
			           </dl>
			           <dl>
			                <dt>* QQ：</dt>
			                <dd>
								<input name="qq" maxlength="30" id="qq" type="text" value="${channelInfo.qq}" class="leshu_a_input" style=" width:200px" placeholder="QQ">
			                </dd>
			           </dl>
			           <dl>
			                <dt>网站地址：</dt>
			                <dd>
								<input name="website" maxlength="200" id="website" type="text" value="${channelInfo.website}" class="leshu_a_input" style=" width:200px" placeholder="网站地址">
			                </dd>
			           </dl>
			           <dl>
			                <dt>公司名称：</dt>
			                <dd>
								<input name="orgName" maxlength="30" id="orgName" type="text" value="${channelInfo.orgName}" class="leshu_a_input" style=" width:200px" placeholder="公司名称">
			                </dd>
			           </dl>
			           <dl>
			                <dt>座机：</dt>
			                <dd>
								<input name="telephone" maxlength="20" id="telephone" type="text" value="${channelInfo.telephone}" class="leshu_a_input" style=" width:200px" placeholder="座机">
			                </dd>
			           </dl>
			           <dl>
			                <dt>* 详情：</dt>
			                <dd>
								<input name="comments" maxlength="150" id="comments" type="text" value="${channelInfo.comments}" class="leshu_a_input" style=" width:400px" placeholder="详情">
			                </dd>
			           </dl>
			           <div class="tijiao">
					   		<input type="submit" value="保存渠道信息" style="float: left;">
					   		<input type="button" value="重置" style="width: 70px;float: left;margin-left: 10px;background: #e95c15;" onclick="reset()">
				       </div>
					</div><!--/.row-->	
				</form:form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
<script type="text/javascript">
	$("#navboxuser").addClass("current");
	
	function reset () {
		$("#channelform")[0].reset();
	}
	
	$().ready(function() {
		$("#channelform").validate({
			rules : {
				platformType : {
					required : true
				},
				channeltype : {
					required : true
				},
				channelsize : {
					required : true
				},
				qq : {
					required : true
				},
				comments : {
					required : true
				},
				website : {
					url:true
				}
			},
			messages:{
				platformType : {
					required : "请选择产品平台"
				},
				channeltype : {
					required : "请选择渠道类型"
				},
				channelsize : {
					required : "请选择渠道量级"
				},
				qq : {
					required : "请输入QQ号"
				},
				comments : {
					required : "请输入产品详情"
				},
				website : {
					url : "请输入正确的URL"
				}
			},
			errorPlacement: function(error, element) {
				if ( element.is(":radio") )
				error.appendTo( element.parent().parent().last());
				else
				error.appendTo( element.parent());
			}
		});
	});
</script>
</html>