<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<script>
	function pay(ordersn) {
		$.ajax({
			url: "before_pay",
			type: "post",
			data: "ordersn=" + ordersn,
			success: function (obj) {
				if (String(obj).trim() == "ok") {
					alert("支付成功！");
				} else {
					alert("支付失败!");
				}
			},
			error: function () {
				console.error("支付过程出现异常！");
			}
		});
	}
</script>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">首页</a></li>
		<li class="breadcrumb-item"><a href="#">购物流程</a></li>
		<li class="breadcrumb-item active" aria-current="page">生成订单</li>
	</ol>
</nav>
<h2 style="text-align:center; height:30px; line-height:30px;">感谢您在头头商城购物！您的订单已提交成功，
	您的订单号为: <span class="text-danger">${ordersn}</span>
</h2>
<button class="btn btn-primary" onclick="pay('${ordersn}')">付款</button>

<jsp:include page="foot.jsp"></jsp:include>