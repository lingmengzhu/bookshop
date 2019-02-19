<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lq/css/index_style.css" />
<link rel="stylesheet" type="text/css"
	href="lq/font-awesome-4.7.0/css/font-awesome.min.css" />
<title>首页</title>
</head>
<body>
	<div class="tools"></div>
	<div id="hd"></div>
	<div id="text_center">
		<div class="book_center">
			<!--左侧商品分类-->
			<div class="book_left">
				<div class="book_left_class">
					<h3>全部书籍分类</h3>
				</div>
				<div id="oneType" class="book_left_cort">
					<div class="book_left_cort_">
						<p>教育</p>
						<div id="jy"></div>
					</div>
					<div class="book_left_cort_">
						<p>小说</p>
						<div id="xs"></div>
					</div>
					<div class="book_left_cort_">
						<p>文艺</p>
						<div id="wy"></div>
					</div>
					<div class="book_left_cort_">
						<p>社科</p>
						<div id="sk"></div>
					</div>
					<div class="book_left_cort_">
						<p>生活</p>
						<div id="sh"></div>
					</div>
					<div class="book_left_cort_">
						<p>儿童</p>
						<div id="et"></div>
					</div>
					<div class="book_left_cort_">
						<p>励志</p>
						<div id="lz"></div>
					</div>
				</div>
			</div>
			<div class="book_center_">
				<!--中间轮播图-->
				<div class="content">
					<ul>
						<li><a href="#"><img src="lq/img/lunbo/lunbo01.png"
								width="100%" /></a></li>
						<li><a href="#"><img src="lq/img/lunbo/lunbo02.jpg"
								width="100%" /></a></li>
						<li><a href="#"><img src="lq/img/lunbo/lunbo03.jpg"
								width="100%" /></a></li>
						<li><a href="#"><img src="lq/img/lunbo/lunbo04.jpg"
								width="100%" /></a></li>
					</ul>
					<div class="showNav">
						<span class="active">1</span> <span>2</span> <span>3</span> <span>4</span>
					</div>
				</div>
				<!--新品上架-->

				<div class="book_center_new">
					<div class="book_center_nav">
						<img src="lq/img/new_books/new_book.png" width="550"> <a
							href="book_newbooks.jsp">更多</a>
					</div>
					<div class="book_center_new_">
					<s:iterator value="pb.list" id="book">
						<div class="book_center_new_img">
							<a href="findBookByBookISBN?bookISBN=<s:property value="#book.bookISBN" />"><img
								src="<s:property value="#book.bookImage" />"
								title="<h3><font color='red'><s:property value="#book.bookName" /></font></h3>">
								<p> 
								<i class="fa fa-jpy"></i><s:property value="#book.bookUnitPrice" />
								</p></a>
						</div>
					</s:iterator> 
					</div>
				</div>
			</div>
			<!--右侧热门推荐-->
			<div class="book_right">
				<div class="book_right_">
					<img src="lq/img/hot_books/sprite.png">
				</div>
				<div class="book_right_text">
					<a>热门书籍推荐</a>
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
					</ul>
				</div>
			</div>
		</div>
		<div class="book_buttom">
			<!--下方左侧名人堂-->
			<div class="book_buttom_author">
				<div class="book_author_icon"></div>
				<div class="book_author_more">
					<a href="findHotAuthorByOrder">更多</a>
				</div>
			</div>
			<!--下方右侧图书畅销榜-->
			<div class="book_buttom_hot">
				<div class="book_hot_icon">
					<img src="lq/img/hot_books/sprite.png">
				</div>
				<div class="book_hot_text">
					<a>图书畅销榜</a>
				</div>
				<div class="book_hot_cort" style="overflow:hidden;">
					<ul id="wellsell">
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
		</div>
	</div>
	<div id="footer"></div>
 

<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(function() {		
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+1 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#jy").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+2 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#xs").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+3 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#wy").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+4 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#sk").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+5 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#sh").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+6 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#et").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
		$(function() {
			var url = "${pageContext.request.contextPath}/findTwoType.action?bookOneTypeId="+7 ;
			var param = "";
			$.post(url, param, function(data) {
				$(data).each(function(i, n) {
					$("#lz").append("<a href='findBookByTwoType.action?bookTwoTypeId="+n.bookTwoTypeId+"'>" + n.name + "</a><span>|</span>");
				});
			}, "json");
		});
	</script>
	<script type="text/javascript" src="lq/js/index.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/jquery.sliphover.min.js"></script>
</body>
</html>