<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>

<table class="table">
	<caption>销售报表（共${fn:length(orderReport)}条记录）</caption>
	<thead>
		<tr>
			<th scope="col">商品编号</th>
			<th scope="col">商品名称</th>
			<th scope="col">商品价格</th>
			<th scope="col">销量</th>
			<th scope="col">销售额</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="n" items="${orderReport}">
			<tr>
				<td scope="row">${n.id}</td>
				<td>${n.gname}</td>
				<td>${n.gprice}</td>
				<td>${n.num}</td>
				<td>${n.gprice*n.num}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="foot.jsp"></jsp:include>