<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>

<script type="text/javascript">
	function checkForm() {
		var bpwd = document.registerForm.bpwd.value;
		var rebpwd = document.registerForm.rebpwd.value;
		if (bpwd != rebpwd) {
			$("#rebpwd").addClass("is-invalid");
			return false;
		}
		$("#flag").val("register");
		document.registerForm.submit();
		return true;
	}
	function checkEmail(bemail) {
		$("#flag").val("check_email");
		$.ajax({
			url: "before_register",
			type: "post",
			data: "bemail=" + bemail + "&&flag=" + $("#flag").val(),
			success: function (obj) {
				console.log(obj);
				if (obj == "email_registered") {
					$("#bemail").addClass("is-invalid");
				} else if (obj == "email_not_registered") {
					$("#bemail").addClass("is-valid");
				}
			},
			error: function () {
				console.error("验证邮箱出现异常！");
			}
		});
	}
	function clearEmailStatus() {
		$("#bemail").removeClass("is-invalid");
		$("#bemail").removeClass("is-valid");
	}
</script>


<form action="before_register" method="POST" name="registerForm">
	<input type="hidden" name="flag" id="flag" />
	<div class="form-group">
		<label>邮箱</label>
		<input type="text" class="form-control" name="bemail" id="bemail" onblur="checkEmail(this.value)" onfocus="clearEmailStatus()">
		<div class="valid-feedback">该邮箱未被注册！</div>
		<div class="invalid-feedback">该邮箱已被注册！</div>
	</div>
	<div class="form-group">
		<label>密码</label>
		<input type="password" class="form-control" name="bpwd" id="bpwd">
	</div>
	<div class="form-group">
		<label>重复密码</label>
		<input type="password" class="form-control" name="rebpwd" id="rebpwd">
		<div class="invalid-feedback">两次输入的密码不一致！</div>
	</div>
	<button onclick="checkForm()" id="button" class="btn btn-primary">注册</button>
</form>
<jsp:include page="foot.jsp"></jsp:include>