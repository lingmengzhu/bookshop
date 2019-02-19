<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lq/css/nav_style.css" />
<title>导航</title>
</head>
<body>
	<!--页面顶部-->
	<div id="hd">

		<!--logo搜索框-->
		<div class="logo_line_out">
			<!--logo-->
			<div class="logo_line">
				<div class="logo">
					<a href="findIndexCondition"><img src="lq/img/nav/logo.png " height="100" width="300"></a>
				</div>
				<!--搜索框-->
				<div class="search">
					<form action="findBookByKeywords" name="searchform" id="form_search_new"
						 method="get">
						<input class="select_cart" name="keywords">
						<div class="select_">
							<select class="color" name="bookOneTypeId">
								<option class="color" value="0">全部分类</option>
								<option class="color" value="1">教育</option>
								<option class="color" value="2">小说</option>
								<option class="color" value="3">文艺</option>
								<option class="color" value="4">社科</option>
								<option class="color" value="5">生活</option>
								<option class="color" value="6">儿童</option>
								<option class="color" value="7">励志</option>
							</select>
							<button type="button" class="button" onclick="search()"></button>
						</div>
					</form>
				</div>
				<!--购物车-->
				<div class="ddnew_cart">
				<s:if test="#session.userName!=null">
				<a href="findOrderByUserName" name="购物车"><i class="icon_card"></i>
				购物车<b id="cart_items_count"></b></a>
				</s:if>
				<s:else>
				<a href="book_login.jsp" name="购物车"><i class="icon_card"></i>
				购物车<b id="cart_items_count"></b></a>
				</s:else>
				</div>
				<!--个人订单-->
				<div class="ddnew_order">
				<s:if test="#session.userName!=null">
				<a href="findBalanceOrderByUserName" name="我的订单">
				我的订单 <b id="unpaid_num"
			    style="color: #ff2832; font: bold 12px Arial;"></b></a>
			    </s:if>
			    <s:else>
			    <a href="book_login.jsp" name="我的订单">
				我的订单 <b id="unpaid_num"
			    style="color: #ff2832; font: bold 12px Arial;"></b></a>
			    </s:else>
			    </div>
				
			</div>
		</div>
		<!--导航栏-->
		<div class="nav_top" name="一级导航栏">
			<div class="nav_top_img">
				<img src="lq/img/nav/nav_top_img.png">
			</div>
			<div class="nav_top_nav">
				<ul>
					<li><a href="findIndexCondition" name="nav1">首页</a></li>
					<li><a href="book_newbooks.jsp" name="nav2">新书上架</a></li>
					<li><a href="findSellWellByOrder" name="nav3">图书畅销榜</a></li>
					<li><a href="findHotBookByOrder" name="nav4">热门推荐</a></li>
					<li><a href="findHotAuthorByOrder" name="nav5">名人堂</a></li>
				</ul>
			</div>
		</div>
		<!--广告图片-->
		<div class="adv">
			<div class="book_1ad " name="广告"></div>
		</div>
	</div>
</body>
</html>