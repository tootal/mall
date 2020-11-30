<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="head.jsp"></jsp:include>
<div class="card">
	<div class="card-header">
		添加商品
	</div>
	<div class="card-body">
		<form action="admin_addGoods?act=add" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">商品名称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="gname">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">商品价格</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="gprice">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">商品图片</label>
				<div class="col-sm-10">
					<input type="file" class="form-control-file" name="gpicture">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">商品类型</label>
				<div class="col-sm-10">
					<select class="custom-select" name="typeid">
						<option selected>请选择商品类型</option>
						<c:forEach var="gtp" items="${goodsType}">
							<option value="${gtp.id}">${gtp.typename}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">提交</button>
		</form>
	</div>
</div>
<jsp:include page="foot.jsp"></jsp:include>