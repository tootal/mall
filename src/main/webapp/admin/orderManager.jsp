<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>

<script type="text/javascript">
	function notice(id, email) {
		$.ajax({
			url: "admin_orderManager?act=notice&ordersn=" + id + "&email=" + email,
			success: function (obj) {
				console.log(obj);
				if (String(obj).trim() == "ok") alert("发送提醒邮件成功！");
				else alert("发送提醒邮件失败！");
			},
			error: function () {
				console.error("邮箱通知出现异常！");
			}
		});
	}
</script>
<table class="table">
	<caption>订单管理（共${fn:length(orderList)}条记录）</caption>
	<thead>
		<tr>
			<th scope="col">订单编号</th>
			<th scope="col">用户邮箱</th>
			<th scope="col">订单金额</th>
			<th scope="col">订单状态</th>
			<th scope="col">订单日期</th>
			<th scope="col">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="n" items="${orderList}">
			<tr">
				<td scope="row">${n.id}</td>
				<td>${n.bemail}</td>
				<td>${n.amount}</td>
				<td>
					<c:if test="${n.status == 0}">未付款</c:if>
					<c:if test="${n.status == 1}">已付款</c:if>
				</td>
				<td>${n.orderdate}</td>
				<td>
					<c:if test="${n.status == 0}">
						<a href="admin_orderManager?act=delete&ordersn=${n.id}" role="button"
							class="btn btn-danger">删除订单</a>
					</c:if>
					<c:if test="${n.status != 0}">
						<button class="btn btn-primary" onclick="notice('${n.id}', '${n.bemail}')">通知发货</button>
					</c:if>
				</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="foot.jsp"></jsp:include>