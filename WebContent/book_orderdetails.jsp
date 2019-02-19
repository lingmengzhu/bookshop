<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单界面</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/order.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/yourlike.css" />
</head>
<body>
	<!--页面顶部-->
	<div class="tools"></div>
	<div id="hd"></div>
	<!-- 我的 -->
	<div class="mymuen">
		<div class="mymuen_list">
			<div class="mymuen_title">
				<span>我的书籍屋</span>
			</div>
			<div class="mymuen_list_n">
				<ul>
					<li><a href="findBalanceOrderByUserName" class="mymuen_list_n1">我的订单</a>
					</li>
					<li><a href="queryuserinfo.action">我的信息</a></li>
					<li><a href="findAdderssByUsername">我的地址</a></li>
					<li><a href="book_myrepass.jsp">忘记密码</a></li>
				</ul>
			</div>
		</div>
		<div class="myoder">
				<!-- 我的位置 -->
			<div class="myoder_de">
				<span> >> <a href="#">我的书籍屋</a> >> <a href="findBalanceOrderByUserName">我的订单</a>  >> <a href="#">订单详情</a></span>
			</div>
			<div class="myinfo">
				<h3>订单编号:<span>${order.orderNumber}</span></h3>					
				<table>		
					<h4>收货人信息</h4>
					<tr>
					    <th>姓名</th>
					    <th>地址</th>
						<th>号码</th>
						<th>邮编</th>
					</tr>
					<tr>
					    <td>${address.relName}</td>
						<td>${address.province}${address.city}${address.detailAddress}</td>
						<td>${address.telNumber}</td>
						<td>${address.postalCode}</td>
					</tr>							
				</table>					
				<table>		
					<h4>订单信息</h4>
					<tr>								
					    <th>订单状态</th>
						<th>发货时间</th>
						<th>成交时间</th>				
					</tr>
					<tr>
						<td>${order.payStatus}</td>
						<td>${order.deliveTime}</td>
						<td>${order.payTime}</td>
					</tr>							
				</table>					
				<table >		
					<h4>书籍信息</h4>
					<tr>
						<th style="visibility: hidden;">图片</th>
						<th>书籍名字</th>
						<th>数量</th>
						<th>单价</th>
						<th>总价</th>											
					</tr>
					<tr>
						<td ><a href="#"><img src="${order.book.bookImage}" alt="" width="70px" height="70px"></a></td>
						<td>${order.book.bookName}</td>
						<td>${order.bookCount}</td>
						<td>${order.book.bookUnitPrice}</td>
						<td>${order.book.bookUnitPrice*order.bookCount*10/10}</td>							
					</tr>							
				</table>					
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
	<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
</body>

</html>