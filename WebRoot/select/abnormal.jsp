﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>教师评价系统后台操作页面</title>

<link rel="stylesheet" href="css/basic.css" />
<link rel="stylesheet" href="css/style.css" />
<!--<link rel="stylesheet" href="css/style-metro.css"/>-->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css" />
<link href="css/font-awesome.css" rel="stylesheet" />
<style type="text/css">
.table {
	table-layout: fixed;
}
</style>
</head>
<body>
	<%
		HttpSession s = request.getSession();
		String username = (String) s.getAttribute("username");
		String password = (String) s.getAttribute("password");
		System.out.println("username1:" + username + ",password1:" + password);
		if (username != null && password != null) {
	%>
	<div id="wrapper" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc1-52"
		data-genuitec-path="/SearchServer/WebRoot/select/abnormal.jsp"
		data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-52"
		data-genuitec-path="/SearchServer/WebRoot/select/abnormal.jsp">
		<nav class="navbar  navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">翡翠教育</a>
			</div>
		</nav>
		<!-- 导航 -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<!--查询主页面的侧边栏按钮-->
					<li><a href="queryExport.jsp"><i class="fa fa-dashboard"></i>查询导出</a>
					</li>
					<!--编辑菜单栏按钮-->
					<li><a class="active-menu" href="abnormal.jsp"><i
							class="fa fa-anchor"></i>异常数据</a></li>
					<li><a href="teacherManage.jsp"><i class="fa fa-edit "></i>老师管理</a>
					</li>
					<li><a href=" dataAnalysis.jsp"><i
							class="fa fa-bar-chart-o"></i>数据分析</a></li>
					<%
						if (username.equals("admin") || username.equals("jxgl")) {
					%>
					<li><a href="dataStatistics.jsp"><i class="fa fa-key"></i>数据统计</a></li>
					<%
						}
					%>
				</ul>
			</div>

		</nav>
		<!-- 主页面  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<!--主页面头部-->
				<div>
					<div class="col-md-12">
						<!--<h1 class="page-subhead-line">请选择查询条件并编辑：</h1>-->
					</div>
				</div>

				<div class="portlet box grey">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-user"></i>异常数据
						</div>
					</div>
					<div class="panel panel-default" style="margin-bottom:10px;">
						<div class="panel-heading">查询条件</div>
						<div class="panel-body">
							<form id="formSearch" class="form-horizontal">
								<div class="form-group" style="margin-top: 15px">
									<label class="control-label col-sm-1"
										for="txt_search_departmentname">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</label>
									<div class="col-sm-2">
										<select class="form-control" id="bigArea">
											<option value text="请选择">请选择</option>
										</select>
									</div>
									<label class="control-label col-sm-1" for="txt_search_statu">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校</label>
									<div class="col-sm-2">
										<select class="form-control" id="schools">
											<option value txt="请选择">请选择</option>
										</select>
									</div>
									<label class="control-label col-sm-1" for="txt_search_statu">专业</label>
									<div class="col-sm-2">
										<select class="form-control " id="profession">
											<option value txt="请选择">请选择</option>
										</select>
									</div>
									<label class="control-label col-sm-1" for="txt_search_statu">角色</label>
									<div class="col-sm-2">
										<select class="form-control " id="role">
											<option value text="请选择">请选择</option>
											<option value='0' selected text="讲师">讲师</option>
											<option value='1' text="班主任">班主任</option>
											<option value='2' text="就业">就业</option>
											<option value='3' text="在线老师">在线老师</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<!--日期-->
									<label class="control-label col-sm-1" for="startDate">起始日期</label>
									<div class="col-sm-2">
										<input class="form-control Wdate" style="height:35px;"
											type="text" onclick="WdatePicker()" id="startDate"
											name="startDate">
									</div>
									<label class="control-label col-sm-1" for="endDate">结束日期</label>
									<div class="col-sm-2">
										<input class="form-control Wdate" style="height:35px;"
											type="text" onclick="WdatePicker()" id="endDate"
											name="endDate">
									</div>
									<!--查询按钮-->
									<div class="col-sm-2">
										<button type="button" id="search" class="btn btn-primary"
											style="margin-left:40px;">查询</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="tableStyle">
						<table id="tb_departments" class="table"></table>
					</div>

					<!--<div class="portlet-body">
						    <table id="tb_departments"> 
							</table>
					    </div>-->
				</div>

			</div>
		</div>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改信息</h4>
				</div>
				<div class="modal-body">
					<div class="row" style="margin-bottom:20px;">
						<div class="col-xs-1"></div>
						<div class="col-xs-5">
							大区：<select name="daqu" id="bigRegion"
								style="width:174px;height:28px;">
								<option value="" text="请选择">请选择</option>
							</select>
						</div>
						<div class="col-xs-5">
							学校：<select name="school" id="school"
								style="width:174px; height:28px;">
								<option value="" text="请选择" txt="请选择">请选择</option>
							</select>
						</div>
					</div>
					<div class="row" style="margin-bottom:20px;">
						<div class="col-xs-1"></div>
						<div class="col-xs-5">
							专业：<select name="profession" id="prof"
								style="width:174px; height:28px;">
								<option value="" text="请选择">请选择</option>
							</select>
						</div>
						<div class="col-xs-5">
							角色：<select name="style" id="leixing"
								style="width:174px;height:28px;">
								<option value="" text="请选择">请选择</option>
								<option value="" text="讲师">讲师</option>
								<option value="" text="班主任">班主任</option>
								<option value="" text="就业">就业</option>
								<option value="" text="在线老师">在线老师</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-5">
							姓名：<input type="text" name="name" id="name" maxlength="5" />
						</div>
						<div class="col-xs-5">
							班级：<input type="text" name="class" id="banji" maxlength="10" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="subm">提交更改</button>
				</div>
			</div>
		</div>
	</div>
	<!--尾部-->
	<div id="footer-sec">
		<div class="footer">
			<div class="innerContainer">
				<p style="text-align:center;">总部地址:北京市海淀区小南庄怡秀园甲一号亿德大厦10层
					电话：010-61943240</p>
				<p style="text-align:center;">Copyright © 2005-2020
					北京翡翠教育科技有限公司，All Rights Reserved 京ICP备12036804号-23</p>
			</div>
		</div>
	</div>
	<%
		} else {
			response.sendRedirect("../Login.html");
		}
	%>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-table.min.js"></script>
	<script src="js/bootstrap-table-zh-CN.min.js"></script>
	<script src="js/WdatePicker.js"></script>
	<script src="js/tableExport.min.js"></script>
	<script src="js/bootstrap-table-export.min.js"></script>
	<script src="js/src/abnormal.js"></script>

</body>
</html>
