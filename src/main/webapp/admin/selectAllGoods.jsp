<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<form action="admin_selectGoods" method="post">
    <div class="input-group my-3">
        <a role="button" class="btn btn-success" href="admin/addGoods.jsp">添加商品</a>
        <div class="input-group-prepend">
          <span class="input-group-text">商品搜索</span>
        </div>
        <input type="text" class="form-control" placeholder="请输入商品名称" name="gname" value="${gname1}">
        <div class="input-group-append">
            <select class="custom-select" name="typeid">
                <option value="all" selected>所有类型</option>
                <c:forEach var="gtp" items="${goodsType}">
                    <option value="${gtp.id}">${gtp.typename}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="act" value="condiction" />
            <input type="submit" value="查询" class="btn btn-primary" />
          </div>
      </div>
</form>

<table class="table">
    <caption>商品列表（共${totalCount}条记录）</caption>
    <thead>
        <tr>
            <th scope="col">商品ID</th>
            <th scope="col">商品名称</th>
            <th scope="col">商品类型</th>
            <th scope="col">操作</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="g" items="${requestScope.allGoods}">
            <tr>
                <th scope="row">${g.id}</td>
                <td>${g.gname}</td>
                <td>${g.typename}</td>
                <td>
                    <a role="button" class="btn btn-outline-success" 
                        href="admin_detail?gno=${g.id}&act=detail">查看</a>
                    <a role="button" class="btn btn-outline-primary" 
                        href="admin_detail?gno=${g.id}&act=updateAgoods">修改</a>
                    <a role="button" class="btn btn-outline-danger" 
                        href="admin_deleteGoods?gno=${g.id}&act=link">删除</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<%
    String gname1 =(String)request.getAttribute("gname1");
    if(gname1 != null){
        gname1 = java.net.URLEncoder.encode(gname1,"utf-8");
        request.setAttribute("gname1",gname1);
    }
%>

<nav aria-label="多页导航栏">
    <ul class="pagination">
        <c:url var="url_pre" value="admin_selectGoods?act=${act}&&gname1=${gname1}&&typeid=${typeid}">
            <c:param name="pageCur" value="${pageCur-1}" />
        </c:url>
        <li class="page-item <c:if test="${pageCur == 1}">disabled</c:if>">
            <a class="page-link" href="${url_pre}">上一页</a>
        </li>
        <c:forEach var="x" begin="1" end="${totalPage}" step="1">
            <c:url var="url_this" value="admin_selectGoods?act=${act}&&gname1=${gname1}&&typeid=${typeid}">
                <c:param name="pageCur" value="${x}" />
            </c:url>
            <li class="page-item <c:if test="${pageCur==x}">disabled</c:if>">
                <a class="page-link" href="${url_this}">${x}</a>
            </li>
        </c:forEach>
        <c:url var="url_next" value="admin_selectGoods?act=${act}&&gname1=${gname1}&&typeid=${typeid}">
            <c:param name="pageCur" value="${pageCur + 1 }" />
        </c:url>
        <li class="page-item <c:if test=" ${pageCur == totalPage}">disabled</c:if>">
            <a class="page-link" href="${url_next}">下一页</a>
        </li>
    </ul>
</nav>
<jsp:include page="foot.jsp"></jsp:include>