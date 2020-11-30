<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="head.jsp"></jsp:include>
<form action="admin_addGoods?act=update" method="POST" enctype="multipart/form-data">
	<fieldset disabled> 
		<!-- disabled中的数据不会上传服务器 -->
		<div class="form-group">
			<label>商品ID</label>
			<input type="text" class="form-control" name="gno" value="${agoods.id}" />
		</div>
	</fieldset>
	<input type="hidden" name="gno" value="${agoods.id}" />
	<div class="form-group">
		<label>商品名称</label>
		<input type="text" class="form-control" name="gname" value="${agoods.gname}">
	</div>
	<div class="form-group">
		<label>商品价格</label>
		<input type="text" class="form-control" name="gprice" value="${agoods.gprice}">
	</div>
	<div class="form-group row">
		<label class="col-2">商品图片</label>
		<div class="col-4">
			<img alt="" width="50" height="50" src="uploadFile/${agoods.gpicture}" />
		</div>
		<div class="col-6">
			<input type="file" class="form-control" name="gpicture">
			<input type="hidden" name="oldgpicture" value="${agoods.gpicture}" />
		</div>
	</div>
	<div class="form-group">
		<label>商品类型</label>
		<select name="typeid">
			<c:forEach var="gtp" items="${sessionScope.goodsType}">
				<option value="${gtp.id}" <c:if test="${gtp.id == agoods.goodstype_id}">
					selected
					</c:if>
					>
					${gtp.typename}
				</option>
			</c:forEach>
		</select>
	</div>
	<button type="submit" class="btn btn-primary">提交</button>
</form>
<jsp:include page="foot.jsp"></jsp:include>