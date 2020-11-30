<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

<head>
	<!-- Required meta tags -->
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

	<title>头头商城</title>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="before_first?typeid=0">头头商城</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<%-- 已登录用户 --%>
					<c:if test="${sessionScope.user != null }">
						<li class="nav-item">
							<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">欢迎
								${sessionScope.user.bemail}</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="before_userCenter?act=index">用户中心</a>
						</li>
						<li class="nav-item">
							<a href="before_userLogout" class="nav-link">注销</a>
						</li>
					</c:if>
					<%-- 未登录用户 --%>
					<c:if test="${sessionScope.user == null }">
						<li class="nav-item">
							<a class="nav-link" href="beforeUser/userLogin.jsp">登录</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="beforeUser/register.jsp">注册</a>
						</li>
					</c:if>
					<%-- 始终显示在导航栏 --%>
					<li class="nav-item">
						<a class="nav-link" href="admin/login.jsp">后台登录</a>
					</li>
				</ul>
			</div>
			<form class="form-inline" action="before_search" name="myForm" method="POST">
				<input class="form-control mr-sm-2" type="search" name="mykey" placeholder="请输入您要查询的内容"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
			</form>
		</nav>
		<!-- 商品分类列表 -->
		<div class="list-group list-group-horizontal">
			<a class="list-group-item list-group-item-action" href="before_first?typeid=0">
				首页
			</a>

			<c:forEach var="g" items="${sessionScope.goodsType}">
				<a href="before_first?typeid=${g.id }" class="list-group-item list-group-item-action">${g.typename }</a>
			</c:forEach>
			<a class="list-group-item list-group-item-action" href="before_selectCart">购物车</a>
		</div>