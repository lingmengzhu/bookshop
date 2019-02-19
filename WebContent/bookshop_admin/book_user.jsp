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
<title>用户管理</title>
<link rel="stylesheet" href="${path }bookshop_admin/css/amazeui.min.css" />
<link rel="stylesheet" href="${path }bookshop_admin/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${path }bookshop_admin/css/app.css">
<link rel="stylesheet" href="${path }bookshop_admin/css/bootstrap.min.css" />
<script src="${path }bookshop_admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${path }bookshop_admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }bookshop_admin/js/jquery.min.js"></script>
<link rel="icon" type="image/png" href="${path }bookshop_admin/img/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${path }bookshop_admin/img/app-icon72x72@2x.png">
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
							<div class="widget-head am-cf">
								<div class="widget-title  am-cf">用户管理</div>

							</div>
							<div class="widget-body  am-fr">
							<!-- 用户信息显示 -->
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
								<form action="${path }admin/findUser" method="post"
										id="infoListForm">
									<div 
										class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
										<input name="userName" value="${userName }" type="text"
										type="text" class="am-form-field "> <span
											class="am-input-group-btn">
											<button
												class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
												type="submit"></button>
										</span>
									</div>
								</form>
								</div>
								<!-- 用户信息显示 -->
								<div class="am-u-sm-12">
									<table width="100%"
										class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>用户名</th>
												<th>密码</th>
												<th>电子邮箱</th>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="pb.list" id="info">
												<tr class="gradeX">
													<td class="am-text-middle"><s:property
															value="#info.userName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.password" /></td>
													<td class="am-text-middle"><s:property
															value="#info.email" /></td>
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
										
										
										
										
											<!-- <tr class="gradeX">
												<td class="am-text-middle">Tom</td>
												<td class="am-text-middle">1234566</td>
												<td class="am-text-middle">163@qq.com</td>																						
												</td>
											</tr>
											<tr class="gradeX">
												<td class="am-text-middle">Tom</td>
												<td class="am-text-middle">1234566</td>
												<td class="am-text-middle">163@qq.com</td>												
											</tr>
											<tr class="gradeX">
												<td class="am-text-middle">Tom</td>
												<td class="am-text-middle">1234566</td>
												<td class="am-text-middle">163@qq.com</td>												
											</tr>
											<tr class="gradeX">
												<td class="am-text-middle">Tom</td>
												<td class="am-text-middle">1234566</td>
												<td class="am-text-middle">163@qq.com</td>
											</tr>
											more data
										</tbody> -->
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
		function fy(page) {
			var form = document.getElementById("infoListForm");
			form.action = "${path}admin/findUser.action?currentPage=" + page;
			form.submit();
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
	</Script>
	<script src="${path }bookshop_admin/js/amazeui.min.js"></script>
	<script src="${path }bookshop_admin/js/amazeui.datatables.min.js"></script>
	<script src="${path }bookshop_admin/js/dataTables.responsive.min.js"></script>
	<script src="${path }bookshop_admin/js/app.js"></script>

</body>
</html>