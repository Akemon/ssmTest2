<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

    <meta charset="UTF-8" />
    <link rel="stylesheet" href="static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" />
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
</head>

<body>

<div class="container">
    <!-- 标题-->
    <div class="row">
        <div class="col-md-12"><h1>Test</h1></div>
    </div>
    <!-- 按钮-->
    <div class="row">
        <div class="col-md-6 col-md-offset-10">
            <button class="btn btn-lg btn-primary">新增</button>
            <button class="btn btn-lg btn-danger">删除</button>
        </div>

    </div>
    <!-- 显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gendder</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除</button>

                        </th>
                    </tr>

                </c:forEach>

            </table>
        </div>

    </div>
    <!-- 显示分布信息-->
    <div class="row">
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,总共${pageInfo.pages}页,总共${pageInfo.total}条纪录
        </div>
        <div class="col-md-6">

            <ul class="pagination">
                <li><a href="/emps?pageNum=1">首页</a></li>
                <c:if test="${!pageInfo.isFirstPage}">
                    <li><a href="/emps?pageNum=${pageInfo.pageNum-1}">&laquo;</a></li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                    <c:if test="${page_Num==pageInfo.pageNum}">
                        <li class="active"><a href="#">${page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num!=pageInfo.pageNum}">
                        <li ><a href="/emps?pageNum=${page_Num}">${page_Num}</a></li>
                    </c:if>

                </c:forEach>
                <c:if test="${!pageInfo.isLastPage}">
                    <li><a href="/emps?pageNum=${pageInfo.pageNum+1}">&raquo;</a></li>
                </c:if>

                <li><a href="/emps?pageNum=${pageInfo.pages}">末页</a></li>
            </ul>


        </div>
    </div>
</div>
</body>
</html>
