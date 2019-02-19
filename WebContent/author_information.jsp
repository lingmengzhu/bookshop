<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者详情</title>
<link rel="stylesheet" type="text/css" href="lq/css/newbooks_style.css" />
<link rel="stylesheet" type="text/css"
	href="lq/css/author_information.css" />
<link rel="stylesheet" type="text/css"
	href="lq/font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
	<div class="tools"></div>
	<div id="hd"></div>
	<div id="text_center">
		<!--当前位置-->
		<div class="now_position">
			<p>
				当前位置：<a href="findIndexCondition">首页</a>/<a href="book_index.jsp">名人堂</a>/<a
					href="book_index.jsp">唐家三少</a>
			</p>
		</div>
		<!--左侧作者图片信息-->
		<div class="author_left">
			<div class="author_img_big">
				<img src="${author.authorImage}" width="250">
			</div>
			<div class="author_small">
				<ul>
					<li><img src="${author.authorImage}"
						width="100"></li>
					<li><img src="${author.authorImage}"
						width="100"></li>
					<li><img src="${author.authorImage}"
						width="100"></li>
				</ul>
			</div>
		</div>
		<!--右侧作者详情-->
		<div class="author_right">
			<div class="author_name">
				<h2>${author.authorName}</h2>
			</div>
			<div class="author_introduce">
				<p>${author.authorInfo}</p>
			</div>
			<div class="author_books_img">
				<ul>
					<li><img src="lq/img/author/snashao/25229365-1_l_2.jpg">
						<a href="#"> 惟我独仙 </a>
						<p>
							<i class="fa fa-jpy"></i>100.00
						</p></li>
					<li><img src="lq/img/author/snashao/25248178-1_l_6.jpg">
						<a href="#"> 斗罗大陆1 </a>
						<p>
							<i class="fa fa-jpy"></i>100.00
						</p></li>
					<li><img src="lq/img/author/snashao/25228704-1_l_6.jpg">
						<a href="#"> 神印王座 </a>
						<p>
							<i class="fa fa-jpy"></i>100.00
						</p></li>
					<li><img src="lq/img/author/snashao/25228702-1_l_7.jpg">
						<a href="#"> 斗罗大陆3 </a>
						<p>
							<i class="fa fa-jpy"></i>100.00
						</p></li>

				</ul>
			</div>
			<div class="author_books_like">
				<div class="author_like_other">
					<span>喜欢该作者的人还喜欢：</span> <a href="#">林夕</a> <a href="#">林夕</a> <a
						href="#">林夕</a> <a href="#">林夕</a>
				</div>
				<div class="author_book_other">
					<span>喜欢该他的人浏览过：</span> <a href="#">斗罗大陆</a> <a href="#">斗罗大陆</a> <a
						href="#">斗罗大陆</a>
				</div>
				<div class="author_introduce_other">
					<span>该作者推荐的图书：</span> <a href="#">斗罗大陆</a> <a href="#">斗罗大陆</a> <a
						href="#">斗罗大陆</a>
				</div>
			</div>

		</div>
		<!--下方推荐作者-->
		<div class="author_buttom">
			<div class="other_icon">
				<img src="lq/img/author/author_icon_bottom.png">
			</div>
			<div class="other_img">
				<ul>
					<li><img src="lq/img/author/snashao/author_sanshao.png">
						<a>唐家三少</a></li>
					<li><img src="lq/img/author/snashao/author_sanshao.png">
						<a>唐家三少</a></li>
					<li><img src="lq/img/author/snashao/author_sanshao.png">
						<a>唐家三少</a></li>
					<li><img src="lq/img/author/snashao/author_sanshao.png">
						<a>唐家三少</a></li>
					<li><img src="lq/img/author/snashao/author_sanshao.png">
						<a>唐家三少</a></li>
				</ul>
			</div>
		</div>
		<div class=""></div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
</body>
</html>