<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>书籍分类查询</title>
<link rel="stylesheet" type="text/css" href="lq/css/book_cort.css" />
<link rel="stylesheet" type="text/css"href="lq/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"href="lq/css/toastr.css" />
</head>
<body>
	<div class="tools"></div>
	<div id="hd"></div>
	<div id="text_center">
		<div class="book_cort">
			<!--当前位置-->
			<div class="now_position">
				<p>
					当前位置：<a href="findIndexCondition">首页/</a><a href="#">教育</a>
				<p>搜索结果如下：</p>
			</div>
			<!--搜索结果-->
			<div class="book_cort_">
			  <iframe name="nm_iframe" style="display:none;"></iframe>
			  <s:iterator value="pb.list" id="cort">
			  <form action="addOrder" method="post" target="nm_iframe">
			  <input type="text" name="book.bookISBN" value="<s:property value="#cort.bookISBN" />" style="display:none">
			  <input type="text" name="user.userName" value="${session.userName}" style="display:none">
			  <input type="text" name="bookCount" value="1" style="display:none">
			  <div class="book_cort_one">
					<div class="book_cort_img">
						<a href="findBookByBookISBN?bookISBN=<s:property value="#cort.bookISBN" />"><img src="<s:property value="#cort.bookImage" />" height="120px"></a>
					</div>
					<div class="book_cort_text">
						<span>林夕：任你行陈奕迅推荐！华语乐坛金牌词人</span><br> <span><i
							class="fa fa-jpy"><s:property value="#cort.bookUnitPrice" /></i></span>
						<p>★陈奕迅推荐！书名来自林夕作词、陈奕迅演唱的热门金曲《任我行》。
							★华语乐坛金牌词人、畅销经典《原来你非不快乐》作者林夕全新力作！近百篇禅理散文， 剖析现实生活中你我不得不面对的自由与孤独。</p>
					</div>
				</div>
				</form>
				</s:iterator>
				<div class="new_page">
				</div>
			</div>
		</div>
	</div>
	<div id="footer"></div>
	<script type="text/javascript" src="lq/js/jquery.min.js"></script>
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
	<script type="text/javascript" src="lq/js/toastr.js"></script>
</body>
</html>