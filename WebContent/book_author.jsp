<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名人堂</title>
<link rel="stylesheet" type="text/css" href="lq/css/newbooks_style.css" />
</head>
<body>
	<div class="tools"></div>
	<div id="hd"></div>
	<div id="text_center">
		<!--左侧图书畅销-->
		<div class="book_right">
			<div class="book_right_">
				<img src="lq/img/hot_books/sprite.png">
			</div>
			<div class="book_right_text">
				<a>图书畅销榜</a>
				<ul id="hotbook">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--作者上架-->
		<div class="book_center_new">
			<div class="book_center_nav">
				<img src="lq/img/author/author_book_icon.png" width="800">
			</div>
			<div class="book_center_new_">
				<ul>
				<s:iterator value="list">
					<li class="book_center_new_img" name="img1"><a
						href="findAuthorByAuthorId?authorId=<s:property value="authorId" />"><img
							src="<s:property value="authorImage"/>" height="150"
							width="120"> <b><s:property value="authorName"/></b> </a>
					</li>
				</s:iterator>
				</ul>
			</div>

		</div>
		<!--热门书籍推荐-->
		<div class="book_hot">
			<div class="book_hot_icon">
				<img src="lq/img/hot_books/hot_book_icon.png" width="100%">
			</div>
			<div class="book_hot_sug">
				<div class="book_sug_img">
					<a href="#"> <img src="lq/img/hot_books/hot_book04.jpg">
						<p style="font-size: 20px; margin-left: 30px;">鬼吹灯</a>
				</div>
				<div class="book_sug_text">
					<p>同名网剧腾讯视频全网独播，《老炮儿》导演管虎、费振翔联合执导，金马影帝阮经天领衔主演正宗《鬼吹灯》
						！天下霸唱原著，盗墓小说开山之作，摸金校尉寻宝历险记，引领南派三叔《盗墓笔记》热销！新版腰封随.机赠送</p>
					<a href="#"> 单价35.5 </a>
				</div>
			</div>
			<div class="book_hot_sug">
				<div class="book_sug_img">
					<a href="#"> <img src="lq/img/hot_books/hot_book04.jpg">
						<p style="font-size: 20px; margin-left: 30px;">鬼吹灯</a>
				</div>
				<div class="book_sug_text">
					<p>同名网剧腾讯视频全网独播，《老炮儿》导演管虎、费振翔联合执导，金马影帝阮经天领衔主演正宗《鬼吹灯》
						！天下霸唱原著，盗墓小说开山之作，摸金校尉寻宝历险记，引领南派三叔《盗墓笔记》热销！新版腰封随.机赠送</p>
					<a href="#"> 单价35.5 </a>
				</div>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
	<script type="text/javascript" src="lq/js/book_author.js"></script>
</body>
</html>