<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="head.jsp"></jsp:include>
<form action="before_userLogin" method="POST">
	<div class="form-group">
		<label>邮箱</label>
		<input type="text" 
			class="form-control 
			<c:if test="${ bpwdError != null }">is-invalid</c:if>"
			name="bemail">
		<c:if test="${ bemailError != null }">
			<div class="invalid-feedback">${bemailError}</div>
		</c:if>
	</div>
	<div class="form-group">
		<label>密码</label>
		<input type="password" 
			class="form-control 
			<c:if test="${ bpwdError != null }">is-invalid</c:if>"
			name="bpwd">
		<c:if test="${ bpwdError != null }">
			<div class="invalid-feedback">${bpwdError}</div>
		</c:if>
	</div>
	<button type="submit" class="btn btn-primary">登录</button>
</form>
<jsp:include page="foot.jsp"></jsp:include>

