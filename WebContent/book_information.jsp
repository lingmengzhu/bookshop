<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍详情</title>
<link rel="stylesheet" type="text/css" href="lq/css/newbooks_style.css" />
<link rel="stylesheet" type="text/css"href="lq/css/book_information.css" />
<link rel="stylesheet" type="text/css"href="lq/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"href="lq/css/toastr.css" />
</head>
<body>
	<div class="tools"></div>
	<div id="hd"></div>
	<div id="text_center">
		<!--当前位置-->
		<div class="now_position">
			<p>
				当前位置：<a href="findIndexCondition">首页</a>/<a
					href="#">${book.bookName}</a>
			</p>
		</div>
		<!--左侧作者图片信息-->
		<div class="author_left">
			<div class="author_img_big">
				<img src="${book.bookImage}" width="250">
			</div>
			<div class="author_small">
				<ul>
					<li><img src="${book.bookImage}"
						width="100"></li>
					<li><img src="${book.bookImage}"
						width="100"></li>
					<li><img src="${book.bookImage}"
						width="100"></li>
				</ul>
			</div>
		</div>
		<!--右侧作者详情-->
		<div class="author_right">
			<div class="author_name">
				<h2>${book.bookName}</h2>
			</div>
			<div class="author_introduce">
				<p>${book.bookIntroduction}</p>
			</div>
			<div class="author_books_money">
				<h1>
					<i class="fa fa-jpy"></i>${book.bookUnitPrice}
				</h1>
				<iframe name="nm_iframe" style="display:none;"></iframe>
				<form action="addOrder" method="post" target="nm_iframe" id="bookPay">
				<input type="text" id="bookOneTypeId" value="${book.bookOneType.bookOneTypeId}" style="display:none">
				<input type="text" name="book.bookISBN" value="${book.bookISBN}" style="display:none">
				<input type="text" name="author.authorId" value="${book.author.authorId}" style="display:none">
				<input type="text" name="publishHouse.publishHouseId" value="${book.publishHouse.publishHouseId}" style="display:none">
				<input type="text" name="user.userName" value="${session.userName}" style="display:none">
					<span> 数量: <input type="text" class="num" name="bookCount" id="num" value="1">
					</span> <a class="btn btn-lg btn-primary num_add" onclick="add()">+</a> <a
						class="btn btn-lg btn-danger num_del num_disable" onclick="reduce()">-</a> <br>
					<s:if test="#session.userName!=null"><input type="submit" class="btn btn-a btn-lg btn-danger num_cart"
						value="加入购物车" onclick="toastr.success('添加成功')">
					<input type="button" class="btn btn-a btn-lg btn-danger num_buy"
						value="立即购买" onclick="transformAction()">
					</s:if>
					<s:else><input type="button" class="btn btn-a btn-lg btn-danger num_cart"
						value="加入购物车" onclick="location.href='book_login.jsp';">
					<input type="button" class="btn btn-a btn-lg btn-danger num_buy"
						value="立即购买">
					</s:else>
				</form>
			</div>
			<div class="author_books_like">
				<div class="author_like_other">
					<span>喜欢该图书的人还喜欢：</span> <a href="#">林夕</a> <a href="#">林夕</a> <a
						href="#">林夕</a> <a href="#">林夕</a>
				</div>
				<div class="author_book_other">
					<span>喜欢该图书的人浏览过：</span> <a href="#">斗罗大陆</a> <a href="#">斗罗大陆</a> <a
						href="#">斗罗大陆</a>
				</div>
				<div class="author_introduce_other">
					<span>图书的作者推荐的图书：</span> <a href="#">斗罗大陆</a> <a href="#">斗罗大陆</a> <a
						href="#">斗罗大陆</a>
				</div>
			</div>

		</div>
		<!--下方推荐作者-->
		<div class="author_buttom">
			<div class="other_icon">
				<img src="lq/img/wellsell_books/author_icon_bottom.png">
			</div>
			<div class="other_img">
				<ul id="showbook">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
    <script type="text/javascript" src="lq/js/toastr.js"></script>
    <script type="text/javascript" src="lq/js/book_information.js"></script>
</body>
</html>