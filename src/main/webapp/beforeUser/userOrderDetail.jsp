<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<h2>订单详情</h2>
<table style="width:99%; align-content: center;">
	<tr>
		<th>商品编号</th>
		<th>商品名称</th>
		<th>商品图片</th>
		<th>商品价格</th>
		<th>购买数量</th>
	</tr>
	<c:forEach var="mf" items="${myOrderDetail}">
		<tr>
			<td bgcolor="#ffffff" align="center">${mf.id}</td>
			<td bgcolor="#ffffff" align="center">${mf.gname}</td>
			<td align="center" bgcolor="#ffffff" height="60px"> <img style="width: 50px; height: 50px;"
					src="uploadFile/${mf.gpicture}" border="0" title="${mf.gname}" /> </td>
			<td align="center" bgcolor="#ffffff">${mf.gprice}</td>
			<td align="center" bgcolor="#ffffff">${mf.shoppingnum}</td>
		</tr>
	</c:forEach>
</table>
<jsp:include page="foot.jsp"></jsp:include>