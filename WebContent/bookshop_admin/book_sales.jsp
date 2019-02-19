<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>出版社销售查询</title>
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="css/app.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="icon" type="image/png" href="img/favicon.png">
<link rel="apple-touch-icon-precomposed" href="img/app-icon72x72@2x.png">
<script src="js/book_sales.js"></script>
</head>
<body data-type="index">
	<script src="js/theme.js"></script>
	<!-- 内容区域 -->
	<div class="tpl-content-wrapper">

		<div class="tpl-content-wrapper">
			<div class="row-content am-cf">
				<div class="row">
					<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<div class="widget-head am-cf">
								<div class="widget-title  am-cf">出版社销售查询</div>
							</div>
							<!-- 进行信息查询 -->
							<div class="widget-body  am-fr">
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3"
									style="width: 100%; margin-bottom: 30px;">
									<div class="am-form-group tpl-table-list-select"
										style="width: 30%; float: left;">
										<span>出版社名称：</span> <select id="publishHouseId" name="publishHouseId" style="width:150px" data-am-selected="{btnSize: 'sm'}">
										</select>
									</div>
									<div style="position:absolute;left:350px;"><button style="height:32.4px;background-color:white" onclick="orderselect()">搜索</button></div>
									<div class="am-form-group tpl-table-list-select"
										style="float: left; margin-left: 300px;">
										<div class="am-form-group">
											<label for="user-email" class="am-u-sm-3 am-form-label">时间
												：</label>
											<div class="am-u-sm-9" style="width: 25%; float: left;">
												<input type="text" class="am-form-field tpl-form-no-bg"
													placeholder="时间节点" data-am-datepicker="" id="dayago1" readonly>
											</div>
											<label for="user-email" class="am-u-sm-3 am-form-label"
												style="padding-left: 0px;">至：</label>
											<div class="am-u-sm-9" style="width: 25%; float: left;">
												<input type="text" class="am-form-field tpl-form-no-bg"
													placeholder="时间节点" data-am-datepicker="" id="dayago2" readonly>
											</div>
										</div>
									</div>
								</div>
                               <div class="am-u-sm-12">
									<table width="100%" id="order"
										class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>图书名</th>
												<th>销售量</th>
												<th>售价</th>
												<th>销售金额</th>
											</tr>
										</thead>
										<tbody id="publishOrder">
                                            
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
														<s:if test="#request.pb.currentPage != #request.pb.totalPage">
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
	<script src="js/amazeui.min.js"></script>
	<script src="js/amazeui.datatables.min.js"></script>
	<script src="js/dataTables.responsive.min.js"></script>
</body>
</html>