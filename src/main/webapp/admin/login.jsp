<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if (session.getAttribute("admin") != null) {
	response.sendRedirect(basePath + "admin_selectGoods?act=condiction&typeid=all");
}
%>

<jsp:include page="head.jsp"></jsp:include>
<form action="admin_login" method="POST">
	<div class="form-group">
		<label for="exampleInputText1">用户名</label>
		<input type="text" class="form-control" id="exampleInputText1" aria-describedby="anameHelp" name="aname">
		<small id="anameHelp" class="form-text text-muted">请使用管理员账号登录。</small>
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">密码</label>
		<input type="password" class="form-control" id="exampleInputPassword1" name="apwd">
	</div>
	<button type="submit" class="btn btn-primary">登录</button>
</form>
<jsp:include page="foot.jsp"></jsp:include>