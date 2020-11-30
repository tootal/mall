<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>

<div class="row row-cols-4 mx-0">
	<c:forEach var="sg" items="${lastedlist}">
		<div class="p-2">
			<div class="card col p-0">
				<a href="before_detail?gno=${sg.id}">
					<img src="uploadFile/${sg.gpicture}" class="card-img-top" width="250px" height="250px">
				</a>
				<div class="card-body">
					<h5 class="card-title text-danger">￥${sg.gprice}</h5>
					<a href="before_detail?gno=${sg.id}">
						<p class="card-text">${sg.gname}</p>
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<jsp:include page="foot.jsp"></jsp:include>