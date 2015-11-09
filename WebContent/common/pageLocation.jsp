<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<input type="hidden" name="curPage" id="curPage" value="${pageList.curPage}">
<input type="hidden" id="totalPage" value="${pageList.totalPage}">
<div class="pagenav">
</div>
<script type="text/javascript">
$(function(){
	var tempNavHtml="";
	var className = "";
	var topClass="";
	var endClass="";
	var curPage = $("#curPage").val();
	var totalPage = $("#totalPage").val();
	if (parseInt(curPage) > 1 && parseInt(totalPage) > 0) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, 1)\">首页</a>";
	}
	else if(parseInt(curPage) == 1 && parseInt(totalPage) > 0){
		tempNavHtml = tempNavHtml + "<a class=\"current\" onclick=\"ChangePage(this, 1)\">首页</a>";
	}
	for (var i=2;i<=totalPage-1;i++) {
		if (i==curPage) { 
			className="current";
		} else {
			className="";
		}
		tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
	}
	
	if (parseInt(curPage) < parseInt(totalPage)) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, "+totalPage+")\">尾页</a>";
	}
	else if(parseInt(curPage) == parseInt(totalPage)){
		tempNavHtml = tempNavHtml + "<a class=\"current\" onclick=\"ChangePage(this, "+totalPage+")\">尾页</a>";
	}
	$(".pagenav").html(tempNavHtml);
});
</script>