<%--
  Created by IntelliJ IDEA.
  User: 33438
  Date: 2021/9/12
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%--使用 taglib 指令引入标签库--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%-- 获取当前的工程路径 --%>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--
        不以/开始的相对路径、找资源、以当前资源的路径为基准，经常容易出问题
        以/开始的相对路径、找资源、以服务器的路径为标准(http://localhost:3306）需要加上项目名
        http://localhost:3306/SSM_Demo
    --%>
    <!-- 引入 jquery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <%-- 搭建显示页面 --%>
    <%-- Bootstrap --> 全局CSS样式 --> 栅格系统 --> 布局容器 --%>
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <%--中等屏幕 桌面显示器 (≥992px)占12列--%>
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <!-- 按钮 -->
        <div class="row">
            <%-- 使用 .col-md-offset-* 类可以将列向右侧偏移 --%>
            <div class="col-md-4 col-md-offset-8">
                <%-- btn btn-primary:蓝色 btn btn-danger:红色--%>
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <%-- 表格 table-hover：鼠标悬停变色 --%>
                <table class="table table-hover">
                    <tr>
                        <th></th>
                        <th>stuName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>collName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list }" var="stu">
                        <tr>
                            <th>${stu.stuId }</th>
                            <th>${stu.stuName }</th>
                            <th>${stu.gender=="M"?"男":"女" }</th>
                            <th>${stu.email }</th>
                            <th>${stu.college.collName}</th>
                            <th><%--btn-sm：小按钮--%>
                                <button class="btn btn-primary btn-sm">
                                    <%-- Bootstrap --> 组件 --%>
                                    <%-- 图标 --%>
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!-- 显示分页信息 -->
        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录
            </div>
            <!-- 分页条信息 -->
            <div class="col-md-6">
                <%-- Bootstrap --> 组件 --> 分页 --%>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/stu?pageNum=1">首页</a></li>
                        <%--判断是否有上一页--%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                    <%-- 上一页 当前页码 - 1 --%>
                                <a href="${APP_PATH}/stu?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <%--pageInfo.navigatepageNums:所有页码--%>
                        <c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
                            <%--
                                判断是不是当前页码
                                是 -> active 激活状态
                                不是 -> 跳转链接
                            --%>
                            <c:if test="${pageNum == pageInfo.pageNum }">
                                <li class="active"><a href="#">${pageNum }</a></li>
                            </c:if>
                            <c:if test="${pageNum != pageInfo.pageNum }">
                                <li><a href="${APP_PATH}/stu?pageNum=${pageNum}">${pageNum }</a></li>
                            </c:if>

                        </c:forEach>
                        <%--判断是否有下一页--%>
                        <c:if test="${pageInfo.hasNextPage }">
                            <li>
                                    <%-- 下一页 当前页码 + 1 --%>
                                <a href="${APP_PATH}/stu?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${APP_PATH}/stu?pageNum=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>

    </div>
</body>
</html>
