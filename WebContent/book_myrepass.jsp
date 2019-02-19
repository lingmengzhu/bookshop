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
<title>我的密码界面</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/myorder.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/yourlike.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/lq/css/toastr.css" />
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
					<li><a href="findBalanceOrderByUserName">我的订单</a>
					</li>
					<li><a href="queryuserinfo.action">我的信息</a></li>
					<li><a href="findAdderssByUsername.action">我的地址</a></li>
					<li><a href="book_myrepass.jsp" class="mymuen_list_n1">修改密码</a></li>
				</ul>
			</div>
		</div>
		<div class="myoder">
			<!-- 我的位置 -->
			<div class="myoder_de">
				<span> >> <a href="#">我的书籍屋</a> >> <a href="#">我的信息</a></span>
			</div>
			<div class="mypassword">
				<form action="repassword" method="post" name="form"  class="form">
					<table>
							<tr>
								<td>用户名:</td>
								<td><input type="text" name="" id="" value="${session.userName}" disabled="disabled"></td>
							</tr>
							<tr>
								<td>旧密码:</td>
								<td><input type="password" name="password" id="password" value=""></td>
								<td><input type="password" name="password1" id="password1" value="${session.password1}" style="display:none;" ></td>
							</tr>
							<tr>
								<td>新密码:</td>
								<td><input type="password" name="newpassword" id="newpassword" value=""></td>
							</tr>
							<tr>
								<td>确认密码:</td>
								<td><input type="password" name="REnewpassword" id="REnewpassword" value=""></td>
							</tr>
							<tr>
								<td></td>	
								<td><input type="button" value="修改密码" onclick="repass()"></td>
							</tr>
					
					</table>
				</form>
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
	<script type="text/javascript" src="lq/js/toastr.js"></script>
	<script type="text/javascript" src="mcy/js/book_myrepass.js"></script>
</body>

</html>