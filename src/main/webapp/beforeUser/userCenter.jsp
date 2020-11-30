<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<h2>我的订单</h2>
<table style="width:99%; align-content: center;">
	<tr>
		<th>订单编号</th>
		<th>订单金额</th>
		<th>订单日期</th>
		<th>详情</th>
	</tr>
	<c:forEach var="mo" items="${myOrder}">
		<tr>
			<td>${mo.id}</td>
			<td>${mo.amount}</td>
			<td>${mo.orderdate}</td>
			<td>
				<a href="before_userCenter?ordersn=${mo.id}&act=detail">详情</a>
			</td>
		</tr>
	</c:forEach>
</table>
<jsp:include page="foot.jsp"></jsp:include>