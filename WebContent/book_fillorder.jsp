<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结算账单界面</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/mcy/css/fillorder.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/mcy/css/yourlike.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/lq/css/toastr.css" />
<script type="text/javascript" src="lq/js/jquery.min.js"></script>
</head>
<body>
	<!--页面顶部-->
	<div class="tools"></div>

	<!--我的购物车流程-->
	<div class="logo_line1" name="我的购物车流程">
		<div class="w960">
			<div class="shopping_prcedure"
				style="background: url(mcy/img/procedure_bg2.png) 0 0 no-repeat;">
				<span class="current">我的购物车</span> <span>填写订单</span> <span>完成订单</span>
			</div>
			<div class="logo1">
				<a href="findIndexCondition"><img src="mcy/img/logo.jpg" alt=""></a>
			</div>
		</div>
	</div>


	<!--我的购物地址-->
	<div class="address">
		<!--标题-->
		<h3 class="title">
			默认收货信息
			</h3>
			<!--地址-->
			<div class="addr_list">
				<ul>
					<li class="addr active">
						<h4 style="line-height: 50px;font-size: 25px" >
							${address.relName}<span>${address.telNumber}</span>
						</h4>
						<p style="font-size: 20px">省：${address.province}</p>
						<p style="font-size: 20px">市：${address.city}</p>
						<p style="font-size: 20px">详细地址：${address.detailAddress}</p>
						<p style="font-size: 20px">邮编：${address.postalCode}</p>
					</li>
				</ul>
			</div>
			<!--地址-->
	</div>


	<!--  结算   -->
	<div id="" class="w960">
		<!--信息-->
		<h3>结算单</h3>
		<div class="shopping_title"></div>
		<form id="orderItemForm" action="" method="post">
		<table id="payTable" width="100%" >
			<thead >
			<tr>
			  <th style="visibility: hidden;">图书</th>
			  <th>商品信息</th>
			  <th>单价（元）</th>
			  <th>数量</th>
			  <th>金额</th>
			</tr>
			</thead>
			<tbody>
			<s:iterator value="list" >
			<tr class="on">
			<td><img src="<s:property value="book.bookImage" />"
						alt="" width="80px" height="80px"></td>
			<td><s:property value="book.bookName" />
			<input class="count-input" type="text" value="<s:property value="orderNumber" />" name="orderNumber" style="display:none"></td>
			<td><s:property value="book.bookUnitPrice" /></td>
			<td><s:property value="bookCount" /></td>
			<td><s:property value="book.bookUnitPrice*10/10*bookCount" /></td>
			</tr>
			</s:iterator>
			</tbody>
		</table>
		</form>

		<div class="shopping_sett">
			<div class="shopping_sett_left">
				<span>配送到：</span>
				<p>${address.province}&nbsp;&nbsp;${address.city}&nbsp;&nbsp;${address.detailAddress}</p>
			</div>
			<div class="shopping_sett_right">
				<div class="shopping_sett_right_f1">
					<span>商品金额：</span><span id="priceTotal"  class="sett_right_f2"></span>
				</div>
				<div class="shopping_sett_right_f2">
					<span>应付款：</span><span id="priceTotalx"  class="sett_right_f2"></span>
				</div>
			</div>
		</div>
		<div class="sett">
			<div class="sett_buttom">
			<c:if test="${address.telNumber!=null}">
				<button onclick="pay()">支付</button>
			</c:if>
			<c:if test="${address.telNumber==null}">
				<button onclick="toastr.warning('您还没有默认收货地址');">支付</button>
			</c:if>
			</div>
			<div class="settup_buttom">
				<button onclick="location.href='findIndexCondition'">放弃支付</button>
			</div>
		</div>
	</div>

	<!--为您推荐-->
	<div class="yourlike_title">
		<h3>猜你喜欢</h3>
		<h4>
			<a href="">换一批</a>
		</h4>
	</div>
	<div class="yourlike_info">
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
		<div class="yourlike_book">
			<div class="book_photo">
				<a href=""><img src="mcy/img/shu1.jpg"></a>
			</div>
			<div class="book_name">
				<a href="">书名书名书名书名</a>
				<p>价格</p>
			</div>
		</div>
	</div>

	<!--页面尾部-->
	<div id="footer"></div>
	<script type="text/javascript" src="<%=basePath%>/lq/js/toastr.js"></script>
	<script type="text/javascript" src="mcy/js/paying.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
</body>

</html>