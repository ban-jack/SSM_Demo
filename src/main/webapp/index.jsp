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
    <%--学生修改的模态框--%>
    <div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">学生修改</h4>
                </div>
                <%--添加表单--%>
                <%-- Bootstrap --> 全局css样式 --> 表单 --%>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">stuName</label>
                            <div class="col-sm-10">
                                <%--
                                    表单 -> 静态控件

                                --%>
                                <p class="form-control-static" id="stuName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">collName</label>
                            <div class="col-sm-4">
                                <%-- 下拉列表 --%>
                                <!-- 学校提交学校id即可 -->
                                <select class="form-control" name="cId">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

    <%--学生添加的模态框--%>
    <%-- Bootstrap --> javascript插件 --> 模态框--%>
    <!-- Modal -->
    <div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">学生添加</h4>
                </div>
                <%--添加表单--%>
                <%-- Bootstrap --> 全局css样式 --> 表单 --%>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">stuName</label>
                            <div class="col-sm-10">
                                <%--
                                    提交的数据自动封装
                                    要求表单项的name和javabean属性名一样

                                --%>
                                <input type="text" name="stuName" class="form-control" id="stuName_add_input" placeholder="stuName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">collName</label>
                            <div class="col-sm-4">
                                <%-- 下拉列表 --%>
                                <!-- 学校提交学校id即可 -->
                                <select class="form-control" name="cId" id="coll_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="stu_save_btn">确认</button>
                </div>
            </div>
        </div>
    </div>

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
                <button class="btn btn-primary" id="stu_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="stu_delete_all_btn">删除</button>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <%-- 表格 table-hover：鼠标悬停变色 --%>
                <table class="table table-hover" id="stus_table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th></th>
                            <th>stuName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>collName</th>
                            <th>操作</th>
                        </tr>

                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- 显示分页信息 -->
        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6" id="page_info_area">

            </div>
            <!-- 分页条信息 -->
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>

    </div>
    <script type="text/javascript">

        var totalRecord,currentPage;

        //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
        $(function () {
            //去首页
            to_page(1);

        });
        //把ajax请求抽取出来
        function to_page(pageNum){
            $.ajax({
                url:"${APP_PATH}/stus",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function(result){
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_stu_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }
        //解析并显示学生数据
        function build_stu_table(result){
            //清空table表格
            $("#stus_table tbody").empty();
            var stus = result.extend.pageInfo.list;
            $.each(stus,function(index,item){
                // alert(item.stuName);
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
                var stuIdTd = $("<td></td>").append(item.stuId);
                var stuNameTd = $("<td></td>").append(item.stuName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var collNameTd = $("<td></td>").append(item.college.collName);

                /*
                 <button class="btn btn-primary btn-sm">
                 <span class=glyphicon glyphicon-pencil"" aria-hidden="true"></span>
                 编辑
                 </button>
                 */
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",item.stuId);
                var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除")
                // 为删除按钮添加一个自定义的属性，来表示当前员工id
                delBtn.attr("delete-id",item.stuId);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(stuIdTd)
                    .append(stuNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(collNameTd)
                    .append(btnTd)
                    .appendTo("#stus_table tbody");
             });
        }
        //解析显示分页信息
        function build_page_info(result){
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
                result.extend.pageInfo.pages+"页,总"+
                result.extend.pageInfo.total+"条记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;

        }
        //解析显示分页条，点击分页要能去下一页....
        function build_page_nav(result){
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            //首页
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            //上一页
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            /*
                如果没有前一页则禁用链接（disabled）
            */
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                });
                prePageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }

            //下一页
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            //末页
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            /*
              如果没有后一页则禁用链接（disabled）不发请求
            */
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function(){
                    to_page(result.extend.pageInfo.pages);
                });
            }

            //添加首页和上一页
            ul.append(firstPageLi).append(prePageLi);

            //遍历的页码号 1 2 3 4 5
            $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                /*
                    判断是不是当前页码
                    是 -> active 激活状态
                */
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                //发ajax请求：去哪页
                numLi.click(function(){
                    to_page(item);
                });
                //添加页码号
                ul.append(numLi);
            });
            //添加下一页和末页
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //清空表单样式以及内容
        function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增按钮弹出模态框。
        $("#stu_add_modal_btn").click(function () {
            //清除表单数据（表单重置）
            // console.log($("#stuAddModal form")[0]);
            // $("#stuAddModal form")[0].reset();
            //表单完整重置
            reset_form("#stuAddModal form");
            //查出数据在下拉列表
            getColl("#stuAddModal select");
            //弹出模态框
            $("#stuAddModal").modal({
                //点击背景模态框不会消失
                backdrop:"static"
            })

        });

        //查出所有的学校信息并显示在下拉列表中
        function getColl(ele) {
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/colls",
                type:"GET",
                success:function(result){
                    // console.log(result);
                    // $("#coll_add_select").append() //用id
                    // $("#stuAddModal select").append()
                    $.each(result.extend.college,function () {
                        var option = $("<option></option>").append(this.collName).attr("value",this.collId);
                        option.appendTo(ele);
                    })
                }
            });
        }

        //校验表单数据 Bootstrap -> 全局css样式 -> 表单 -> 校验状态
        function valid_add_form() {
            //1、拿到要校验的数据，使用正则表达式
            var stuName = $("#stuName_add_input").val();
            //用户名可以是2-5位中文或者6-16位英文和数字的组合
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(stuName)){
                // alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
/*                $("#stuName_add_input").parent().addClass("has-error");
                $("#stuName_add_input").next("span").text("用户名可以是2-5位中文或者6-16位英文和数字的组合");*/
                show_validate_msg("#stuName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else {
/*                $("#stuName_add_input").parent().addClass("has-success");
                $("#stuName_add_input").next("span").text("");*/
                show_validate_msg("#stuName_add_input", "success", "");
            }

            //2、校验邮箱信息
            var email = $("#email_add_input").val();
            var regEmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                // alert("邮箱格式不正确");
                //应该清空这个元素之前的样式
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
             /*   $("#email_add_input").parent().addClass("has-error");
                $("#email_add_input").next("span").text("邮箱格式不正确");*/
                return false;
            }else {
 /*               $("#email_add_input").parent().addClass("has-success");
                $("#email_add_input").next("span").text("");*/
                show_validate_msg("#email_add_input", "success", "");
            }

            return true;
        }


        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }


        //校验用户名是否可用
        $("#stuName_add_input").change(function(){

            //发送ajax请求校验用户名是否可用
            var stuName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"stuName="+stuName,
                type:"POST",
                success:function(result){
                    // console.log(result);
                    if(result.code==200){
                        show_validate_msg("#stuName_add_input","success","用户名可用");
                        $("#stu_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg("#stuName_add_input","error",result.extend.va_msg);
                        $("#stu_save_btn").attr("ajax-va","error");
                    }
                }
            });
        });

        //点击保存，保存学生数据
        $("#stu_save_btn").click(function () {
            //1、模态框中填写的表单数据提交给服务器进行保存

            //1.2、判断之前的Ajax用户名校验是否成功。如果成功
            if($(this).attr("ajax-va")=="error"){
                return false;
            }


            //1.1、先对要提交的数据进行校验
            if(!valid_add_form()){
                return false;
            }


            //2、发送ajax请求保存员工
            // alert($("#stuAddModal form").serialize());

            $.ajax({
                url:"${APP_PATH}/stu",
                type:"Post",
                //发送到服务器的数据
                data:$("#stuAddModal form").serialize(),
                success:function (result) {

                    if(result.code == 200){
                        // alert(result.msg);//显示处理成功
                        //1、关闭吗模态框
                        $("#stuAddModal").modal("hide");
                        //2、来到最后一页，显示刚才保存的数据
                        //发送ajax请求显示最后一页数据即可
                        // to_page(9999999999999);
                        to_page(totalRecord);
                    }else {
                        //显示失败信息
                        // console.log(result);
                        //有哪个字段的错误信息就显示哪个字段的
                        // alert("result.extend.errorFields.email");
                        if(undefined != result.extend.errorFields.email){
                            //显示邮箱错误信息
                            show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                        }
                        if(undefined != result.extend.errorFields.stuName){
                            //显示员工名字的错误信息
                            show_validate_msg("#empName_add_input", "error", result.extend.errorFields.stuName);
                        }
                    }


                }
            });
        });

        //1、我们是按钮创建之前就绑定了click，所以绑定不上。
        //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
        //jquery新版没有live，使用on进行替代
        $(document).on("click",".edit_btn",function(){
            // alert("edit");
            // 1、查出学校信息，并显示学校列表
            getColl("#stuUpdateModal select");
            // 2、查出学生信息，并显示学生列表
            getStu($(this).attr("edit-id"));

            // 3、把员工id传递给模态框的更新按钮
            $("#stu_update_btn").attr("edit-id",$(this).attr("edit-id"));

            //弹出模态框
            $("#stuUpdateModal").modal({
                backdrop:"static"
            });
        });
        
        function getStu(id) {
            $.ajax({
                url:"${APP_PATH}/stu/"+id,
                type:"GET",
                success:function(result){
                    //console.log(result);
                    var stuData = result.extend.student;
                    $("#stuName_update_static").text(stuData.stuName);
                    $("#email_update_input").val(stuData.email);
                    $("#stuUpdateModal input[name=gender]").val([stuData.gender]);
                    $("#stuUpdateModal select").val([stuData.cId]);
                }
            });
        }

        //点击更新，更新学生信息
        $("#stu_update_btn").click(function () {
            //1、验证邮箱是否合法
            var email = $("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
                return false;
            }else {
                show_validate_msg("#email_update_input", "success", "");
            }

            //2、发送ajax请求保存更新的员工数据
            $.ajax({
                url:"${APP_PATH}/stu/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#stuUpdateModal form").serialize(),
                success:function (result) {
                    // alert(result.msg);
                    //1、关闭对话框
                    $("#stuUpdateModal").modal("hide");
                    //回到当前页面
                    to_page(currentPage);
                }

            });
        });

        //单个删除
        $(document).on("click",".delete_btn",function () {
            //1、弹出是否确认删除对话框
            //找到当前按钮的父节点的tr中的第三个td的文本值
            // alert($(this).parents("tr").find("td:eq(1)").text());
            var stuName = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除【"+stuName+"】吗？")){
                //确认，发送ajax请求删除即可
                $.ajax({
                    url:"${APP_PATH}/stu/"+$(this).attr("delete-id"),
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        //回到当前页面
                        to_page(currentPage);
                    }

                });
            }

        })

        //完成全选/全不选功能
        $("#check_all").click(function(){
            //attr获取checked是undefined;
            //我们这些dom原生的属性；attr获取自定义属性的值；
            //prop修改和读取dom原生属性的值
            //保证check_item的复选框的值和check_all的一致
            $(".check_item").prop("checked",$(this).prop("checked"));
        });

        //check_item
        $(document).on("click",".check_item",function(){
            //选中的复选框的个数
            // alert($(".check_item:checked").length);
            //判断当前选择中的元素是否是所有check_item的个数
            var flag = $(".check_item:checked").length==$(".check_item").length;
            $("#check_all").prop("checked",flag);
        });

        //点击全部删除、批量删除
        $("#stu_delete_all_btn").click(function () {
            var stuNames = "";
            var del_idstr= "";
            // alert($(this).parents("tr").find("td:eq(2)").text());
            //遍历被选中的
            $.each($(".check_item:checked"),function () {
                stuNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                //组装学生id字符串
                del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //去除stuNames多余的,
            stuNames = stuNames.substring(0, stuNames.length-1);
            //去除stuNames多余的-
            del_idstr = del_idstr.substring(0, del_idstr.length-1);
            if (confirm("确认删除【"+stuNames+"】吗？")){
                //发送ajax请求删除
                $.ajax({
                    url:"${APP_PATH}/stu/"+del_idstr,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //回到当前页面
                        to_page(currentPage);
                    }
                });
            }
        })
    </script>
</body>
</html>
