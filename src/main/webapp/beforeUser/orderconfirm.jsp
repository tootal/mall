<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<div class="location ared">当前位置：<a href="index.php">首页</a> > 购物流程 > 确认订单信息</div>
<div class="blank"></div>
<div class="nFlowBox">
	<form action="" method="post">
		<h6>商品列表</h6>
		<table style="width:99%; align-content: center;">
			<tr>
				<th>商品名称</th>
				<th>商品价格</th>
				<th>购买数量</th>
				<th>小计</th>
			</tr>
			<c:forEach var="ce" items="${cartlist}">
				<tr>
					<td>${ce.gname}</td>
					<td>${ce.gprice}</td>
					<td> ${ce.shoppingnum}</td>
					<td>￥${ce.smallsum}</td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					应付款
					<span class="text-danger display-4">￥${total}</span>
				</td>
			</tr>
		</table>
		<a role="button" class="btn btn-primary" href="before_ordersubmit?amount=${total}">提交订单</a>
	</form>
</div>
<jsp:include page="foot.jsp"></jsp:include>