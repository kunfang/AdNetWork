<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<input type="hidden" id="curPage" value="${pageList.curPage}">
<input type="hidden" id="totalPage" value="${pageList.totalPage}">
<div class="pagenav">
</div>
<script type="text/javascript">
$(function(){
	var tempNavHtml="";
	var className = "";
	var curPage = $("#curPage").val();
	var totalPage = $("#totalPage").val();
	if (curPage >= 1 && totalPage > 0) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, 1)\">首页</a>";
	}
	for (var i=1;i<=totalPage;i++) {
		if (i==curPage) { 
			className="current";
		} else {
			className="";
		}
		tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
	}
	if (curPage <= totalPage) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, "+totalPage+")\">尾页</a>";
	}
	$(".pagenav").html(tempNavHtml);
});
</script>