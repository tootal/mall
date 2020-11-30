<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loginPath = basePath + "beforeUser/userLogin.jsp";
%>
<jsp:include page="head.jsp"></jsp:include>
<div class="alert alert-warning" role="alert">
  您还没有登录，请先<a href="<%= loginPath %>">登录</a>！
</div>
<jsp:include page="foot.jsp"></jsp:include>