<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<div class="card">
	<div class="card-header">
		添加类型
	</div>
	<div class="card-body">
		<form action="admin_Type?act=add" method="post">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">类型名称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="typename">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">提交</button>
		</form>
	</div>
</div>
<table class="table">
	<caption>类型管理（共${fn:length(allType)}种类型）</caption>
	<thead>
		<tr>
			<th scope="col">类型ID</th>
			<th scope="col">类型名称</th>
			<th scope="col">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="t" items="${allType}">
			<tr>
				<td scope="row">${t.id}</td>
				<td>${t.typename}</td>
				<td><a href="admin_Type?id=${t.id}&act=delete">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="foot.jsp"></jsp:include>