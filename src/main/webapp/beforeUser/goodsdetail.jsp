<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
	function goCart() {
		document.putcartform.submit();
	}
</script>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">首页</a></li>
		<li class="breadcrumb-item active" aria-current="page">商品详情</li>
	</ol>
</nav>
<div class="row">
	<div class="col-6">
		<img src="uploadFile/${agoods.gpicture}" width="230px" height="230px" />
	</div>
	<div class="col-6">
		<form action="before_putCart" name="putcartform" method="post">
			<input type="hidden" name="gno" value="${agoods.id}" />
			<div class="bt">
				${agoods.gname}
			</div>
			<div class="goods_show">
				<ul>
					<li><span>价格:</span><span class="display-4 text-danger font-weight-bold">
							￥${agoods.gprice}
						</span>
					</li>
					<li><span>类型:</span> ${agoods.typename}</li>
					<li>
						<span>购买数量:</span>
						<input type="text" name="mknum" class="good_txt" value="1" />
					</li>
				</ul>
			</div>
			<p class="bottom10 top5">
				<button type="btn" class="btn btn-primary" onclick="goCart()">加入购物车</button>
			</p>
		</form>
	</div>
</div>

<jsp:include page="foot.jsp"></jsp:include>