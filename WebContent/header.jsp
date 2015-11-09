<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="mini_area">
	<div class="minibox">
        <div class="leftbox">您好,欢迎来到涌玉广告联盟！</div>    
        <div class="rightbox">
        <c1:choose>
        <c1:when test="${user==null || user.userid < 1}">
			<a href="login.jsp" class="dl">登录</a>
			<a href="userLoginlist.do?method=registerUser" class="zc">注册</a>
		</c1:when>
		<c1:otherwise>
			<a href="channel.do?method=getUserChannelList" class="dl" style="padding-right: 10px"><i class="fa fa-user"></i>${user.username}</a>
			<a href="userLoginlist.do?method=pwd&isnew=Y" class="zc" title="密码修改">&nbsp;&nbsp;<i class="fa fa-sign-out"></i>密码修改</a>
			<a href="userLoginlist.do?method=logout" class="zc" title="退出"><i class="fa fa-sign-out"></i>退出</a>
		</c1:otherwise>
		</c1:choose>
        </div>
    </div>
</div>
<!--顶部-->
<div class="top_area">
    <div class="topbox">
        <a href="advertiser.do?method=getAdvertiserList" class="xc_logo"></a>
        <div class="xc_tail"></div>
        <ul class="navbox">
            <li><a href="advertiser.do?method=getAdvertiserList" id="navboxad">产品</a></li>
            <li><a href="channel.do?method=getChannelList" id="navboxchannel">渠道</a></li>
            <li><a href="channel.do?method=getUserChannelList" id="navboxuser">账号中心</a></li>
            <li><a href="http://bbs.ft-tech.cn">论坛</a></li>
        </ul>
    </div>
</div>