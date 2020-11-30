<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loginPath = basePath + "beforeUser/userLogin.jsp";
%>
<jsp:include page="head.jsp"></jsp:include>
<div class="alert alert-danger" role="alert">
	操作失败！请<a href="javascript:history.back()">返回</a>!
</div>
<jsp:include page="foot.jsp"></jsp:include>
