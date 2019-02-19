<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单管理</title>
<link rel="stylesheet" href="${path }bookshop_admin/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${path }bookshop_admin/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${path }bookshop_admin/css/app.css">
<link rel="stylesheet"
	href="${path }bookshop_admin/css/bootstrap.min.css" />
<script src="${path }bookshop_admin/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${path }bookshop_admin/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${path }bookshop_admin/js/jquery.min.js"></script>
<link rel="icon" type="image/png"
	href="${path }bookshop_admin/img/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${path }bookshop_admin/img/app-icon72x72@2x.png">
</head>
<body data-type="index">
	<script src="${path }bookshop_admin/js/theme.js"></script>
	<!-- 内容区域 -->
	<div class="tpl-content-wrapper">

		<div class="tpl-content-wrapper">
			<div class="row-content am-cf">
				<div class="row">
					<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<!-- 显示所处界面 -->
							<div class="widget-head am-cf">
								<div class="widget-title  am-cf">订单管理</div>

							</div>
							<div class="widget-body  am-fr">
								<!-- 查询相应显示位置 -->
								<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
									<div class="am-form-group">
										<div class="am-btn-toolbar">
											<div class="am-btn-group am-btn-group-xs">
												<button type="button" onclick="yfh(1)"
													class="am-btn am-btn-default am-btn-success">
													查询已发货订单</button>
												<button type="button" onclick="wfh(2)"
													class="am-btn am-btn-default am-btn-warning">
													查询未发货订单</button>
												<button type="button" onclick="fh()"
													class="am-btn am-btn-default am-btn-danger">一键发货</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 该页面主要内容区域 -->
								<div class="am-u-sm-12">
									<table width="100%" id="order"
										class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>订单编号</th>
												<th>用户名</th>
												<th>图书名</th>
												<th>作者</th>
												<th>出版社</th>
												<th>支付时间</th>
												<th>发货时间</th>
												<th>图书数量</th>
											</tr>
										</thead>
										<tbody>

											<s:iterator value="pb.list" id="info">
												<tr class="gradeX">
													<td id="change1" style="display: none;" class="am-text-middle"><input type="checkbox"/></td>
													<td class="am-text-middle"><s:property
															value="#info.orderNumber" /></td>
													<td class="am-text-middle"><s:property
															value="#info.user.userName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.book.bookName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.Author.authorName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.book.publishHouse.publishHouseName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.payTime" /></td>
													<td class="am-text-middle"><s:property
															value="#info.deliveTime" /></td>
													<td class="am-text-middle"><s:property
															value="#info.bookCount" /></td>
												</tr>
											</s:iterator>
											<tr>
												<td colspan="9" align="center">
													<div class="pagination">
														第
														<s:property value="#request.pb.currentPage" />
														页 &nbsp;&nbsp; 共
														<s:property value="#request.pb.totalPage" />
														页 &nbsp;&nbsp; 共
														<s:property value="#request.pb.count" />
														条信息
														<div style="height: 10px;"></div>
														<s:if test="#request.pb.currentPage == 1"> 首页&nbsp;&nbsp;上一页 </s:if>
														<s:else>
															<a href='#' onclick="fy(1)">首页</a>
															<a href='#'
																onclick="fy(<s:property value="#request.pb.currentPage - 1"/>)">上一页</a>
														</s:else>
														<s:if
															test="#request.pb.currentPage != #request.pb.totalPage">
															<a href='#'
																onclick="fy(<s:property value="#request.pb.currentPage + 1"/>)">下一页</a>
															<a href='#'
																onclick="fy(<s:property value="#request.pb.totalPage"/>)">尾页</a>
														</s:if>
														<s:else>下一页&nbsp;&nbsp;尾页</s:else>
														&nbsp;&nbsp; 跳转至 <input type="text"
															style="color: #282d2f; height: 22px; border: 1px solid #888; width: 30px; border-radius: 0.2rem;"
															name="page" id="page" /> 页 <a href='#'
															onclick="validate()">跳转</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
	function yfh(deliverStatus){
		window.location.href = "${path}admin/findOrder.action?deliverStatus=" + deliverStatus;
	}
	function wfh(deliverStatus){
		window.location.href = "${path}admin/findOrder.action?deliverStatus=" + deliverStatus;
	}
	function fh(){
		window.location.href = "${path}admin/deliver.action"
	}
	function fy(page) {
		window.location.href= "${path}admin/findOrder.action?currentPage=" + page;
		
	}
	function validate() {
		var page = document.getElementById("page").value;
		if (page > <s:property value="#request.pb.totalPage"/> || page <= 0)//
		{
			alert("你输入的页数大于最大页数或小于最小页面，页面将跳转到首页！");
			fy(1)
		} else {
			fy(page)
		}
	}
</script>
	<script type="text/javascript">
	
	</script>
	<script src="${path }bookshop_admin/js/amazeui.min.js"></script>
	<script src="${path }bookshop_admin/js/app.js"></script>

</body>
</html>