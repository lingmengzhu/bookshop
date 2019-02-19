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
		<title>购物车界面</title>
	    <link rel="stylesheet" type="text/css" href="<%=basePath%>/lq/css/bottom_style.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/mcy/css/nav_style1.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/mcy/css/shopcart.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/mcy/css/yourlike.css"  /> 		
	</head>
	<body>
		<!--页面顶部-->
		<div class="tools"></div>

		<!--我的购物车流程-->
		<div class="logo_line1" title="我的购物车流程">
			<div class="w960">
				<div class="shopping_prcedure" style="background: url(mcy/img/procedure_bg.png) 0 0 no-repeat;">
					<span class="current">我的购物车</span>
					<span>填写订单</span>
					<span>完成订单</span>
				</div>
				<div class="logo1">
					<a href="findIndexCondition"><img src="mcy/img/logo.jpg" alt=""></a>
				</div>
			</div>
		</div>

		<!--购买的书籍-->
		<div id="" class="w960">
			<!--书籍详细信息-->
		<div class="catbox">
		<form id="orderItemForm" action="" method="post">
			<table id="cartTable">
				<thead>
					<tr>
						<th><label>
                            <input class="check-all check" type="checkbox">&nbsp;全选</label>
                        </th>
						<th>商品</th>
						<th>单价</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<s:iterator value="list">
					<tr class="on">
						<td class="checkbox"><input class="check-one check" type="checkbox" name="bookselesct"></td>
						<td class="goods">
							<img src="<s:property value="book.bookImage" />" alt="">
							<span><s:property value="book.bookName" /></span>
						</td>
						<td class="price"><s:property value="book.bookUnitPrice" /></td>
						<td class="count"><span class="reduce"></span>
							<input class="count-input" type="text" value="<s:property value="bookCount" />" name="bookCount" >
							<input class="count-input" type="text" value="<s:property value="orderNumber" />" name="orderNumber" style="display:none">
							<span class="add">+</span></td>
						<td class="subtotal"><s:property value="bookCount*book.bookUnitPrice*10/10" /></td>
						<td class="operation"><span class="delete" onclick="del(<s:property value="orderNumber" />)">删除</span>
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
				</form>
			<div class="foot" id="foot">
				<label class="fl select-all"><input type="checkbox" class="check-all check">&nbsp;&nbsp;全选</label>
				<a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
				<div class="fr closing" id="getAll" onclick="getTotal();">结 算</div>
				<input type="hidden" id="cartTotalPrice">
				<div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
				<div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件</div>
			</div>
		</div>
		</div>
		
		
        <!--为您推荐-->
       <div class="yourlike_title">
			<h3>猜你喜欢</h3>
			<h4><a href="">换一批</a></h4>
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
<script type="text/javascript" src="lq/js/book_tools.js"></script>
<script type="text/javascript" src="mcy/js/shopcart.js"></script>

</body>

</html>