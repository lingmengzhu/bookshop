<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
  request.setAttribute("path", basePath);  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的地址界面</title>
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/nav_style1.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/lq/css/toastr.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/myorder.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/yourlike.css" />
<link rel="stylesheet" type="text/css"href="<%=basePath%>/mcy/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/lq/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/lq/js/toastr.js"></script>
<script type="text/javascript" src="<%=basePath%>/mcy/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/mcy/js/book_address.js"></script>
</head>
<body onload="init()">
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
					<li><a href="findBalanceOrderByUserName">我的订单</a></li>
					<li><a href="queryuserinfo.action">我的信息</a></li>
					<li><a href="findAdderssByUsername" class="mymuen_list_n1">我的地址</a></li>
					<li><a href="book_myrepass.jsp">修改密码</a></li>
				</ul>
			</div>
		</div>
		<div class="myoder">
			<!-- 我的位置 -->
			<div class="myoder_de">
				<span> >> <a href="#">我的书籍屋</a> >> <a href="#">我的地址</a></span>
			</div>
			<div class="myadress">
				<s:iterator value="list">
				<div class="addr_list">
					<ul style="display: inline-block;">
						<li class="addr active">
							<h4>
								<s:property value="relName"/>
								<span><s:property value="telNumber"/></span>
							</h4>
							<p><s:property value="province"/><s:property value="city"/><s:property value="detailAddress"/></p>
							<p><s:property value="postalCode"/></p>
							<input type="text" name="addressId" value="<s:property value="addressId"/>"style="display:none;">
						</li>
					</ul>
					<div class="address_edit">
						<a class="address_edit_left"  href="javascript::" data-toggle="modal" data-target="#myModal" id="eidtAddress" onclick="eidtAddress(<s:property value="addressId"/>)">编辑</a>
						<a class="address_edit_left" href="#" onclick="del(<s:property value="addressId"/>)">删除</a>  
						<a class="address_edit_left" style="margin-left: 50px" href="#" onclick="setDefalut(<s:property value="addressId"/>);return false;">设为默认地址</a>
					</div>
				</div>
				</s:iterator>
				<div class="address_add">
					<a  href="javascript::" data-toggle="modal" data-target="#myModal" id="addAddress" onclick="addAddress()">新增收货地址</a>				
				</div>
		<!-- 模态框（Modal） -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h4 class="modal-title" id="myModalLabel"></h4>
				            </div>
				            <form action="addAddress" method="post" id="tranform">
				            <div class="modal-body">
				                <div class="modal_div">
				            		<input  id="userName" name="user.userName"type="text"  value="${session.userName}" class="modal_div_" style="display:none;"/>
				            		<input  id="userName" name="defaultAddress" type="text"  value="" class="modal_div_" style="display:none;"/>
				            		<input  id="userName" name="addressId" type="text"  value="" class="modal_div_" style="display:none;"/>
				            	</div>
				            	<div class="modal_div">
				                 	<span>姓名:</span>
				            		<input  id="relName" name="relName" type="text" class="modal_div_" value="" placeholder="请输入真实姓名"/>
				            	</div>
				                <div class="modal_div">
				                    <span>电话:</span>
				            		<input  id="telNumber" name="telNumber" type="text" class="modal_div_" value="" placeholder="请输入手机号"/>
				            	</div>
				            	<div class="modal_div">
				            		<span>省份:</span>
				            		<select class="state pickout" id="province" name="province" autocomplete="off" onchange="provincechange(this.selectedIndex)">
				            		<option>请选择省份</option>
				            		</select>
				            	</div>
				            	<div class="modal_div">
				            		<span>市区:</span>
				            		<select class="state pickout" id="city" name="city" autocomplete="off">
				            		<option>请选择城市</option>
				            		</select>
				            	</div>
				            	<div class="modal_div">
				            		<span>详址:</span>
				            		<input type="text" id="detailAddress" name="detailAddress" value="" placeholder="请输入详细地址"/>
				            	</div>
				            	<div class="modal_div">
				            		<span>邮编:</span>
				            		<input type="text" id="postalCode" name="postalCode" value="" placeholder="请输入邮政编码"/>
				            	</div>
				            </div>
				            <div class="modal-footer" id="newadd" > 
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
	<script type="text/javascript">
	function del(addressId){
		if(window.confirm("您确定要删除吗？"))
		{
		   location.href="delAddress.action?id="+addressId;
		 }
	}
	</script>
</body>

</html>