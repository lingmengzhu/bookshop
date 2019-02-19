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
<title>出版社管理界面</title>
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
<link rel="icon" type="image/png" href="img/favicon.png">
<link rel="apple-touch-icon-precomposed" href="img/app-icon72x72@2x.png">
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
								<div class="widget-title  am-cf">出版社管理</div>

							</div>
							<!-- 主要内容区域 -->
							<div class="widget-body  am-fr">
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
									<form action="${path }admin/findPublishHouseBy" method="post"
										id="infoListForm">
										<div
											class="am-input-group am-input-group-sm tpl-form-border-form cl-p">

											<input name="keywords" value="${keywords }" type="text"
												class="am-form-field "> <span
												class="am-input-group-btn">
												<button
													class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
													type="submit"></button>
											</span>
										</div>
									</form>
								</div>
								<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
									<a href="javascript:;" onclick="addPublishHouseName()"
										class="am-form-group tpl-table-list-select"
										data-toggle="modal" data-target="#myModal">  添加出版社
									</a>

									<!-- 模态框（Modal） -->
									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel"
														style="color: black; font: 20px; text-align: center;">
														添加出版社</h4>
												</div>
												<form action="${path }admin/addPublishHouse.action" method="post"
													id="form">
													<div class="modal-body"
														style="color: black; text-align: center; margin-bottom: 50px; height: 150px;">
														<ul>
															<li><span>出版社名字：</span><input type="text"
																name="publishHouseName" id="publishHouseName" />
																<input type="text" name="publishHouseId" style="display: none" id="publishHouseId" /></li>
															<li><span>&emsp;&emsp;负责人：</span><input type="text"
																name="publishHousePerson" id="publishHousePerson"  /></li>
															<li><span>负责人号码：</span><input type="text"
																name="publishHousePhone" id="publishHousePhone"  /></li>
														</ul>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
														<button type="submit" class="btn btn-primary">
															确认提交</button>
													</div>
												</form>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
								</div>
								<div class="am-u-sm-12">
									<table width="100%"
										class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>出版社名字</th>
												<th>负责人</th>
												<th>负责人号码</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="pb.list" id="info">
												<tr class="gradeX">
													<td class="am-text-middle"><s:property
															value="#info.publishHouseName" /></td>
													<td class="am-text-middle"><s:property
															value="#info.publishHousePerson" /></td>
													<td class="am-text-middle"><s:property
															value="#info.publishHousePhone" /></td>
													<td class="am-text-middle">
														<div class="tpl-table-black-operation">
															<a href='#' data-toggle="modal"
																onclick="editPublishHouse(<s:property value="#info.publishHouseId"/>)"
																data-target="#myModal"> 编辑 </a>
														</div>
													</td>
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
		function fy(page) {
			var form = document.getElementById("infoListForm");
			form.action = "${path}admin/findPublishHouseBy.action?currentPage=" + page;
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
	</script>
	<script type="text/javascript">
		function addPublishHouseName() {
			document.getElementById("myModalLabel").innerHTML = "添加出版社";
			$("#publishHouseName").val("");
			  $("#publishHousePerson").val("");
			  $("#publishHousePhone").val("");
			  $("#publishHouseId").val("");
		}
	</script>
	<script type="text/javascript">
		function editPublishHouse(publishHouseId) {
			document.getElementById("myModalLabel").innerHTML = "编辑出版社";
			document.getElementById("form").action = "${path}admin/updatePublishHouse.action";
		
			var url = "${path}admin/findPublishHouseById.action?publishHouseId="+publishHouseId;
			var param = {};
				$.post(url,param,function(data){
					  $("#publishHouseName").val(data[0].publishHouseName);
					  $("#publishHousePerson").val(data[0].publishHousePerson);
					  $("#publishHousePhone").val(data[0].publishHousePhone);
					  $("#publishHouseId").val(data[0].publishHouseId);
				},"json")
		}
	</script>
	<script type="text/javascript">
		function del(publishHouseId) {
			if (window.confirm("您确定要删除吗？")) {
				location.href = "${path}admin/delPublishHouse.action?publishHouseId=" + publishHouseId;
			}
		}
	</script>
	<script src="${path }bookshop_admin/js/amazeui.min.js"></script>
	<script src="${path }bookshop_admin/js/amazeui.datatables.min.js"></script>
	<script src="${path }bookshop_admin/js/dataTables.responsive.min.js"></script>
	<script src="${path }bookshop_admin/js/app.js"></script>

</body>
</html>