<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<table class="table">
	<caption>用户管理（共${fn:length(requestScope.userList)}个用户）</caption>
	<thead>
		<tr>
			<th scope="col">用户ID</th>
			<th scope="col">用户邮箱</th>
			<th scope="col">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="n" items="${requestScope.userList}">
			<tr>
				<td>${n.id}</td>
				<td>${n.bemail}</td>
				<td>
					<a href="admin_userManager?act=delete&bid=${n.id}">删除</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="foot.jsp"></jsp:include>