<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loginPath = basePath + "admin/login.jsp";
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

    <title>头头商城后台管理</title>
</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<%=loginPath%>">头头商城后台管理</a>

            <%-- 已登录管理员 --%>
            <c:if test="${sessionScope.admin != null }">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="admin_selectGoods?act=condiction&typeid=all">商品管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_Type?act=manager">类型管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_userManager?act=manager">用户管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_orderManager?act=manager">订单管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_orderManager?act=report">销售报表</a>
                        </li>
                    </ul>
                </div>
                <span class="navbar-item navbar-right">
                    <a href="admin_loginOut" class="nav-link">注销</a>
                </span>
            </c:if>
            <%-- 始终显示在导航栏（右侧） --%>
            <span class="navbar-item navbar-right">
                <a class="nav-link" href="<%=basePath%>">返回主商城</a>
            </span>
        </nav>