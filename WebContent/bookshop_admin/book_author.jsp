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
<title>作者管理</title>
<link rel="stylesheet" href="${path }bookshop_admin/css/amazeui.min.css" />
<link rel="stylesheet" href="${path }bookshop_admin/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${path }bookshop_admin/css/app.css">
<link rel="stylesheet" href="${path }bookshop_admin/css/bootstrap.min.css" />
<script src="${path }bookshop_admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${path }bookshop_admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }bookshop_admin/js/jquery.min.js"></script>
<link rel="icon" type="image/png" href="img/favicon.png">
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
								<div class="widget-title  am-cf">作者管理</div>

							</div>
							<div class="widget-body  am-fr">
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										 <form action="${path }admin/findAuByAuthorId" method="post" 	id="infoListForm"> 
									<div
										class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
								
										<input  name="keywords" value="${keywords }"
										type="text" class="am-form-field "/> <span
											class="am-input-group-btn">
											<button
												class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
												type="submit"></button>
										</span>
										
									</div>
									</form>
								</div>
								<!-- 添加作者信息 -->
								<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
									<a href="javascript:;"
										class="am-form-group tpl-table-list-select"
										data-toggle="modal" data-target="#myModal"> <i
										class="am-icon-pencil"></i> 添加作者
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
														添加作者</h4>
												</div>
												<form id="form" action="${path }admin/addAuthor.action"
													enctype="multipart/form-data" method="post">
													<div class="modal-body"
														style="color: black; text-align: center; margin-bottom: 50px; height: 200px">
														<ul>
														<li><span>作者名字：</span><input type="text"
															name="authorName" id="authorName" />
															<input type="text" name="authorId" style="display: none" id="authorId" /></li>
														<li><span>作者简介：</span><input type="text"
															name="authorInfo"  id="authorInfo"/></li>
														<li><span>作者照片：</span> <input id="file1" name="file"
																type="file" onchange="fileUpload();" /></li>
															<input id="authorImage" name="authorImage" type="hidden" />
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
								<!-- 作者信息显示 -->
								<div class="am-u-sm-12">
									<table width="100%"
										class="am-table am-table-compact am-table-striped tpl-table-black ">
										<thead>
											<tr>
												<th>作者名字</th>
												<th>作者简介</th>
												<th>作者头像</th>
												<th>操作</th>

											</tr>
										</thead>
										<tbody>
											<s:iterator value="pb.list" id="author">
												<tr class="gradeX">
													<td class="am-text-middle"><s:property
															value="#author.authorName" /></td>
													<td class="am-text-middle"><s:property
															value="#author.authorInfo" /></td>
													<td class="am-text-middle"><img
														src="${path } <s:property value="#author.authorImage"/>
											"
														style="height: 50px" /></td>
														<td class="am-text-middle">
														<div class="tpl-table-black-operation">
															<a href='#' data-toggle="modal"
																onclick="editAuthor(<s:property value="#author.authorId"/>)"
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
											<!-- more data -->
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
							function fileUpload() {
								var files = ['file1'];  //将上传三个文件 ID 分别为file2,file2,file3
								$.ajaxFileUpload( {
									url : 'fileUploadAction',     //用于文件上传的服务器端请求地址  
									secureuri : false,            //一般设置为false  
									fileElementId : files,        //文件上传空间的id属性  <input type="file" id="file" name="file" />  
									dataType : 'json',            //返回值类型 一般设置为json  
									success : function(data, status) {
										var fileNames = data.fileFileName; //返回的文件名 
										var filePaths = data.filePath;     //返回的文件地址 
										for(var i=0;i<data.fileFileName.length;i++){
											//将上传后的文件 添加到页面中 以进行下载		
											$("#pic").attr("src","${path }attached/"+filePaths[i]);	
											$("#authorImage").val("attached/"+filePaths[i]);	
										}
									}
								})
							}
						</script>
		<script type="text/javascript">
		 function fy(page)
        { 
			 var form=document.getElementById("infoListForm");
			 form.action="${path}admin/findAuByAuthorId.action?currentPage=" + page; 
			 form.submit();
        }
		function validate()
        {
            var page = document.getElementById("page").value;
            if(page > <s:property value="#request.pb.totalPage"/>  || page <= 0 )//
            {
                alert("你输入的页数大于最大页数或小于最小页面，页面将跳转到首页！");
                fy(1)
             }else{
            	fy(page)
           }
        }
	</script>
	<script type="text/javascript">
		function addAuthor() {
			document.getElementById("myModalLabel").innerHTML = "添加作者";
			$("#authorName").val("");
			  $("#authorInfo").val("");
			  $("#authorImage").val("");
			  $("#authorId").val("");
		}
	</script>
	<script type="text/javascript">
		function editAuthor(authorId) {
			document.getElementById("myModalLabel").innerHTML = "编辑作者";
			document.getElementById("form").action = "${path}admin/updateAuthor.action";
		
			var url = "${path}admin/findAuthorById.action?authorId="+authorId;
			var param = {};
				$.post(url,param,function(data){
					  $("#authorName").val(data[0].authorName);
					  $("#authorInfo").val(data[0].authorInfo);
					  $("#authorImage").val(data[0].authorImage);
					  $("#authorId").val(data[0].authorId);
				},"json")
		}
	</script>
	<script type="text/javascript">
		function del(authorId) {
			if (window.confirm("您确定要删除吗？")) {
				location.href = "${path}admin/delAuthor.action?authorId=" + authorId;
			}
		}
	<script src="${path }bookshop_admin/js/ajaxfileupload.js"></script>
	<script src="${path }bookshop_admin/js/amazeui.min.js"></script>
	<script src="${path }bookshop_admin/js/amazeui.datatables.min.js"></script>
	<script src="${path }bookshop_admin/js/dataTables.responsive.min.js"></script>
	<script src="${path }bookshop_admin/js/app.js"></script>

</body>
</html>