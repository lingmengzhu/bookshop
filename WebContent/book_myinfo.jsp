<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/myorder.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/yourlike.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/lq/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/mcy/js/bootstrap.min.js"></script>
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
					<li><a href="queryuserinfo.action" class="mymuen_list_n1">我的信息</a></li>
					<li><a href="findAdderssByUsername.action">我的地址</a></li>
					<li><a href="book_myrepass.jsp">修改密码</a></li>
				</ul>
			</div>
		</div>
		<div class="myoder">
			<!-- 我的位置 -->
			<div class="myoder_de">
				<span> >> <a href="">我的书籍屋</a> >> <a href="">我的信息</a></span>
			</div>
			<div class="myinfo">
		
					<table>
						<tr>
							<td>用户名:</td>
							<td><input type="text" value="${session.userName}" disabled="disabled"></td>
						</tr>
						<tr>
							<td>昵称:</td>
							<td><input type="text" value="${user.nickName}" disabled="disabled"></td>
						</tr>
						<tr>
							<td>性别:</td>
							<c:if test="${user.sex==1}">
                            <td><input type="text" value="男" disabled="disabled"></td>
                            </c:if>
                            <c:if test="${user.sex==2}">
                           <td><input type="text" value="女" disabled="disabled"></td>
                            </c:if>	
						</tr>
						<tr>
							<td>出生日期:</td>
							<td><input type="text" name="birthday" value="${user.birthday}" disabled="disabled"></td>
						</tr>		
						<tr>
							<td><a class="edit"  data-toggle="modal" data-target="#myModal">编辑信息</a></td>
						</tr>
					</table>
					<!-- 模态框（Modal） -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header">
						              
						                <h4 class="modal-title" id="myModalLabel">个人信息修改</h4>
						            </div>
						            <form action="updateuserinfo" method="post">
						            <div class="modal-body">
						            	<table>
						            	       <tr>
								                   <td>昵称:</td>
								                   <td><input type="text" name="nickName" value="${user.nickName}"></td>
							                   </tr>
							                   <tr>
								                   <td>性别:</td>
								                   <c:if test="${user.sex==1}">
                                                   <td>
                                                   <select name="sex">
                                                   <option value ="1" selected="selected">男</option>
                                                   <option value ="2">女</option>
                                                   </select>
								                   </td>  
                                                   </c:if>
                                                    <c:if test="${user.sex==2}">
                                                   <td>
                                                    <select name="sex">
                                                   <option value ="1" >男</option>
                                                   <option value ="2" selected="selected">女</option>
                                                   </select>
								                   </td>
                                                   </c:if>
								                   
							                   </tr>
							                   <tr>
								                   <td>出生日期:</td>
								                   <td><input type="text" name="birthday" value="${user.birthday}"></td>
								                   <input type="text" name="email" value="${user.email}" style="display:none">
								                   <input type="text" name="password" value="${user.password}" style="display:none">
								                   <input type="text" name="phoneNumber" value="${user.phoneNumber}" style="display:none">
								                   <input type="text" name="userName" value="${user.userName}" style="display:none">
							                   </tr>
						            	</table>
						            </div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						                <button type="submit" class="btn btn-primary">提交更改</button>
						            </div>
						            </form>
						        </div><!-- /.modal-content -->
						    </div><!-- /.modal -->
						</div>		
					
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
	<script type="text/javascript" src="lq/js/nav.js"></script>
	<script type="text/javascript" src="lq/js/book_tools.js"></script>
</body>

</html>