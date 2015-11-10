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
				<b>您当前的位置 - 发布产品</b>
			</ul>
			<div class="leshu_table">
				<form:form commandName="adVO" method="post" action="advertiser.do" id="adform">
					<input type="hidden" name="method" value="saveAd" />
					<input type="hidden" name="userID" value="${userInfo.userid}" />
					<input type="hidden" name="advertiserID" value="${adInfo.advertiserID}" />
					<input type="hidden" name="verifystatus" value="10" />
					<input type="hidden" name="status" value="10" />
					<div class="onebox onebox1">
						<dl>
			                <dt>* 栏目：</dt>
			                <dd>
			                    <c1:forEach items="${columnList}" var="columnList">
									<label class="radio-inline">
										<c1:choose>
											<c1:when test="${columnList.value==adInfo.columnType}">
												<input type="radio" name="columnType" value="${columnList.value}" checked> ${columnList.valuename}
											</c1:when>
											<c1:otherwise>
												<input type="radio" name="columnType" value="${columnList.value}"> ${columnList.valuename}
											</c1:otherwise>
										</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 产品名称：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="prodName" name="prodName" placeholder="产品名称" value="${adInfo.prodName}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 产品平台：</dt>
			                <dd>
			                    <c1:forEach items="${platList}" var="platList">
									<label class="radio-inline">
										<c1:choose>
											<c1:when test="${platList.value==adInfo.platformType}">
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
			                <dt>* 结算方式：</dt>
			                <dd>
			                    <c1:forEach items="${balanceList}" var="balanceList">
									<label class="radio-inline">
											<c1:choose>
												<c1:when test="${balanceList.value==adInfo.balanceType}">
													<input type="radio" name="balanceType" value="${balanceList.value}" checked> ${balanceList.valuename}
												</c1:when>
												<c1:otherwise>
													<input type="radio" name="balanceType" value="${balanceList.value}"> ${balanceList.valuename}
												</c1:otherwise>
											</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 数据查看：</dt>
			                <dd>
			                    <c1:forEach items="${viewList}" var="viewList">
									<label class="radio-inline">
											<c1:choose>
												<c1:when test="${viewList.value==adInfo.viewType}">
													<input type="radio" name="viewType" value="${viewList.value}" checked> ${viewList.valuename}
												</c1:when>
												<c1:otherwise>
													<input type="radio" name="viewType" value="${viewList.value}"> ${viewList.valuename}
												</c1:otherwise>
											</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 投放形式：</dt>
			                <dd>
			                    <c1:forEach items="${prodWayList}" var="prodWayList">
									<label class="radio-inline">
											<c1:choose>
												<c1:when test="${prodWayList.value==adInfo.prodWay}">
													<input type="radio" name="prodWay" value="${prodWayList.value}" checked> ${prodWayList.valuename}
												</c1:when>
												<c1:otherwise>
													<input type="radio" name="prodWay" value="${prodWayList.value}"> ${prodWayList.valuename}
												</c1:otherwise>
											</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* QQ：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="qq" name="qq" placeholder="QQ" value="${adInfo.qq}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>手机：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="mobilePhone" name="mobilePhone" placeholder="手机" value="${adInfo.mobilePhone}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>微信：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="wechat" name="wechat" placeholder="微信" value="${adInfo.wechat}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 合作方式：</dt>
			                <dd>
			                    <c1:forEach items="${cooperList}" var="cooperList">
									<label class="radio-inline">
											<c1:choose>
												<c1:when test="${cooperList.value==adInfo.cooperationType}">
													<input type="radio" name="cooperationType" value="${cooperList.value}" checked> ${cooperList.valuename}
												</c1:when>
												<c1:otherwise>
													<input type="radio" name="cooperationType" value="${cooperList.value}"> ${cooperList.valuename}
												</c1:otherwise>
											</c1:choose>
									</label>
								</c1:forEach>
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 价格 /元：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="price" name="price" placeholder="价格 /元" value="${adInfo.price}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>公司名称：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="orgName" name="orgName" placeholder="公司名称" value="${adInfo.orgName}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>网址 ：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="website" name="website" placeholder="网址 " value="${adInfo.website}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>座机：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:200px" id="telephone" name="telephone" placeholder="座机" value="${adInfo.telephone}">
			                </dd>
			            </dl>
			            <dl>
			                <dt>* 详情：</dt>
			                <dd>
			                    <input type="text" class="leshu_a_input" style=" width:400px" id="comments" name="comments" placeholder="详情" value="${adInfo.comments}">
			                </dd>
			            </dl>
			            <div class="tijiao">
					   		<input type="submit" value="保存产品信息" style="float: left;">
					   		<input type="button" value="重置" style="width: 70px;float: left;margin-left: 10px;background: #e95c15;" onclick="reset()">
				       </div>
					</div>
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
		$("#adform")[0].reset();
	}
	
	$().ready(function() {
		$("#adform").validate({
			rules : {
				columnType :{
					required : true
				},
				prodName : {
					required : true
				},
				platformType : {
					required : true
				},
				balanceType : {
					required : true
				},
				viewType : {
					required : true
				},
				prodWay : {
					required : true
				},
				qq : {
					required : true
				},
				cooperationType : {
					required : true
				},
				price : {
					required : true,
					number:true
				},
				comments : {
					required : true
				},
				website : {
					url:true
				}
			},
			messages:{
				columnType : {
					required :"请选择栏目"
				},
				prodName : {
					required : "请输入产品名称"
				},
				platformType : {
					required : "请选择产品平台"
				},
				balanceType : {
					required : "请选择结算方式"
				},
				viewType : {
					required : "请选择数据查看方式"
				},
				prodWay : {
					required : "请选择投放形式"
				},
				qq : {
					required : "请输入QQ号"
				},
				cooperationType : {
					required : "请选择合作方式"
				},
				price : {
					required : "请输入价格",
					number : "请输入正确的数字格式"
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