<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<input type="hidden" name="curPage" id="curPage" value="${pageList.curPage}">
<input type="hidden" id="totalPage" value="${pageList.totalPage}">
<div class="pagenav">
</div>
<script type="text/javascript">

$(function(){
	var showNums = 11;
	
	var tempNavHtml="";
	var className = "";
	var topClass="";
	var endClass="";
	var curPage = parseInt($("#curPage").val());
	var totalPage = parseInt($("#totalPage").val());
	if (curPage > 1 && totalPage > 0) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, 1)\">首页</a>";
	}
	/* else if(parseInt(curPage) == 1 && parseInt(totalPage) > 0){
		tempNavHtml = tempNavHtml + "<a class=\"current\" onclick=\"ChangePage(this, 1)\">首页</a>";
	} */
	var beforeNum = curPage - (showNums-1)/2;
	var endNum = curPage + (showNums-1)/2;

	if (beforeNum > 0 && endNum < totalPage) {
		for (var i=beforeNum;i<=endNum;i++) {
			if (i==curPage) {
				className="current";
			} else {
				className="";
			}
			tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
		}
	} else if (beforeNum <= 0 && endNum >= totalPage) {
		for (var i=1;i<=totalPage;i++) {
			if (i==curPage) {
				className="current";
			} else {
				className="";
			}
			tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
		}
	} else if (beforeNum <= 0 && endNum < totalPage) {
		for (var i=1;i<=showNums && i <= totalPage;i++) {
			if (i==curPage) {
				className="current";
			} else {
				className="";
			}
			tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
		}
	} else if (beforeNum > 0 && endNum >= totalPage) {
		var i = 1;
		if (totalPage - showNums+1 > 0) {
			i = totalPage - showNums+1;
		}
		for (i;i<=totalPage;i++) {
			if (i==curPage) {
				className="current";
			} else {
				className="";
			}
			tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
		}
	}
	
	/* for (var j=curPage-(showNums-1)/2; j < curPage && j > 0; j++ ) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, "+j+")\">"+j+"</a>";
	}
	
	tempNavHtml = tempNavHtml + "<a class= \"current\" onclick=\"ChangePage(this, "+curPage+")\">"+curPage+"</a>";
	
	for (var i=1;i<=totalPage;i++) {
		if (i==curPage) {
			className="current";
		} else {
			className="";
		}
		tempNavHtml = tempNavHtml + "<a class=\""+className+"\" onclick=\"ChangePage(this, "+i+")\">"+i+"</a>";
	} */
	
	if (curPage < totalPage) {
		tempNavHtml = tempNavHtml + "<a onclick=\"ChangePage(this, "+totalPage+")\">尾页</a>";
	}
	/* else if(parseInt(curPage) == parseInt(totalPage)){
		tempNavHtml = tempNavHtml + "<a class=\"current\" onclick=\"ChangePage(this, "+totalPage+")\">尾页</a>";
	} */
	$(".pagenav").html(tempNavHtml);
});
</script>