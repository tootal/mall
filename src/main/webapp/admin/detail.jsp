<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">后台管理</a></li>
		<li class="breadcrumb-item"><a href="#">商品管理</a></li>
		<li class="breadcrumb-item active" aria-current="page">商品详情</li>
	</ol>
</nav>
<div class="row">
	<div class="col-6">
		<img src="uploadFile/${agoods.gpicture}" width="230px" height="230px" />
	</div>
	<div class="col-6">
		<div class="bt">
			${agoods.gname}
		</div>
		<div class="goods_show">
			<ul>
				<li><span>ID:</span>${agoods.id}</li>
				<li><span>价格:</span><span class="display-4 text-danger font-weight-bold">
						￥${agoods.gprice}
					</span>
				</li>
				<li><span>类型:</span> ${agoods.typename}</li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="foot.jsp"></jsp:include>