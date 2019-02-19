<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单界面</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/myorder.css" />
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
				<span> >> <a href="#">我的书籍屋</a> >> <a href="#">我的订单</a></span>
			</div>
			<!-- 是否发货 -->
			<div class="myoder_title">
				<ul>
					<li><a class="" href="findBalanceOrderByUserName">我的订单</a></li>
					<li><a class="" href="findNoOrderByUserName">未发货</a></li>
					<li><a class="" href="findYesOrderByUserName">已发货</a></li>
				</ul>
			</div>
			<div class="myoder_form">
					<table style="width:100%;">
						<thead>
							<tr>
								<th style="visibility: hidden;">图片</th>
								<th>书籍信息</th>
								<th>订单编号</th>
								<th>时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
					    <s:iterator value="list">
							<tr>
								<td>
									<a href="findOrderByOrderNumber?orderNumber=<s:property value="orderNumber" />"><img src="<s:property value="book.bookImage" />" alt="" width="70px" height="70px"></a>
								</td>
								<td><s:property value="book.bookName" /></td>
								<td><s:property value="orderNumber" /></td>
								<td><s:property value="payTime" /></td>
								<td><a href="#" onclick="del(<s:property value="orderNumber" />)">删除</a></td>
							</tr>
						</s:iterator>
						</tbody>
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
	<script type="text/javascript">
	function del(orderNumber){
			if(window.confirm("您确定要删除吗？"))
			{
			   location.href="UserDelectOrder.action?orderNumber="+orderNumber;
			 }
		}
		
	
	</script>
</body>

</html>