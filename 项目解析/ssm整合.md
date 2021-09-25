

# SSM 整合

## 技术选型

![alt 属性文本](imges\图1技术选型.png)
        
## 功能点
![alt 属性文本](imges\图2功能点.png)

## 基础环境搭建

- `maven` 配置文件 `setting.xml`文件下面的添加镜像
    ```xml
    <mirror>
          <id>aliyunmaven</id>
          <mirrorOf>*</mirrorOf>
          <name>阿里云公共仓库</name>
          <url>https://maven.aliyun.com/repository/public</url>
      </mirror>
    </mirrors>

    ```

- `maven` 仓库中搜索 `jar` 包示例

    搜索 `maven repository` -> 搜索 `spring webmvc` -> 选择想要的版本 -> 添加依赖

    ![alt 属性文本](imges\图3添加springmvc.png)

- 需要导入的 `jar` 包

    ![alt 属性文本](imges\图4添加的依赖.png)

- 引入 `bootstrap` 前端框架

    ![alt 属性文本](imges\图5引入前端框架.png)

- `web.xml` 的配置

    ![alt 属性文本](imges\图6web-xml配置.png)

- `springMVC` 的配置（`dispatcherServlet-servlet.xml`）

    ![alt 属性文本](imges\图7spring-mvc的配置.png)

- `spring` 的配置（`applicationContext.xml`）

    ![alt 属性文本](imges\图8spring配置.png)

- `Mybatis` 的配置（`mybatis-config.xml`）

    ![alt 属性文本](imges\图9mybatis-github.png)
    ![alt 属性文本](imges\图10mybatis配置1.png)
    ![alt 属性文本](imges\图11mybatis配置2.png)

- 数据库建表

    ![alt 属性文本](imges\图12数据库建表.png)

- 使用 `Mybatis` 的逆向工程生成对应的 `bean` 以及 `Mapper`

    ![alt 属性文本](imges\图13Mybatis逆向文件生成器1.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器2.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器3.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器4.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器5.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器6.png)
    ![alt 属性文本](imges\图13Mybatis逆向文件生成器7.png)

- 解决逆向生成器中没有根据主键的方法

    ![alt 属性文本](imges\图14解决没有主键的方法.png)

- 解决逆向生成器中编译报错的方法

    ![alt 属性文本](imges\图15解决生成器文件报错的方法.png)

    另外的方法： https://blog.csdn.net/xsm666/article/details/80076253

- `Mapper` 文件的修改

    ![alt 属性文本](imges\图16修改mapper文件.png)


- `spring` 单元环境的测试

    ![alt 属性文本](imges\图16测试1.png)
    遇到错误   `org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'com.ssm.crud.test.MapperTest'` 的解决方法
    ![alt 属性文本](imges\图16测试错误2.png)
    ![alt 属性文本](imges\图16测试2.png)

- 查询分页显示

    1、访问`index.jsp`页面

    2、`index.jsp`页面发送出查询学生列表请求    URI:/stu

    3、`StudentController`来接受请求，查出学生数据

    4、来到`list.jsp`页面进行展示
    
    5、`pageHelper`分页插件完成分页查询功能
    ![alt 属性文本](imges\图17分页1.png)
    ![alt 属性文本](imges\图17请求查询分页显示.png)

    测试分页
    ![alt 属性文本](imges\图17分页2.png)

    错误
    ![alt 属性文本](imges\图17分页3.png)

- `Bootstrap` 搭建分页页面

    ![alt 属性文本](imges\图18jsp页面错误1.png)

    `list.jsp`页面
    ```html
    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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

                        <tr>
                            <th>1</th>
                            <th>达瓦里希</th>
                            <th>女</th>
                            <th>dawalixi@qq.com</th>
                            <th>圣彼得堡大学</th>
                            <th>
                                <%--btn-sm：小按钮--%>
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

                    </table>
                </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6">
                    当前记录数：xxx
                </div>
                <!-- 分页条信息 -->
                <div class="col-md-6">
                    <%-- Bootstrap --> 组件 --> 分页 --%>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="#">首页</a></li>
                            <li>
                                <a href="#" aria-label="Previous">
                                    <%-- 上一页 --%>
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <%-- 下一页 --%>
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="#">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </body>
    </html>

    ```

    导入标签库
    ![alt 属性文本](imges\图18填充数据1.png)
    填充分页数据
    ![alt 属性文本](imges\图18填充数据2.png)
    ![alt 属性文本](imges\图18填充数据3.png)

- 改造查询 -》`ajax` + `json` （新建 `index.jsp` 重写分页和查询数据）

    1、`index.jsp` 页面直接发送 `ajax` 请求进行学生分页数据的查询

    2、服务器将查出的数据，以 `json` 字符串的形式返回给浏览器

    3、浏览器收到js字符串。可以使用 `js` 对 `json` 进行解析，使用 `js` 通过 `dom` 增删改改变页面。
    
    4、返回 `json`。实现客户端的无关性。
    
    ![alt 属性文本](imges\图19改造查询1.png)
    ![alt 属性文本](imges\图19改造查询2.png)
    ![alt 属性文本](imges\图19改造查询3.png)

    解析并显示员工数据
    ![alt 属性文本](imges\图19改造查询4.png)
    解析并显示分页信息和分页条数据
    ![alt 属性文本](imges\图19改造查询5.png)
    分页条是静态的
    ![alt 属性文本](imges\图19改造查询6.png)

    动态显示分页
    ![alt 属性文本](imges\图19改造查询7.png)
    ![alt 属性文本](imges\图19改造查询8.png)

- 新增数据

    1. 在 `index.jsp` 页面点击”新增”

    2. 弹出新增对话框

    3. 去数据库查询部门列表，显示在对话框中

    4. 用户输入数据，并进行校验 `jquery` 前端校验，`ajax` 用户名重复校验，重要数据（后端校验`JSR303`，唯一约束）

    5. 完成保存

    `URI`:

        /stu/{id} `GET` 查询学生

        /stu      `POST` 保存学生

        /stu/{id} `PUT` 修改学生

        /stu/{id} `DELETE` 删除学生

    - 模态框的搭建
    ![alt 属性文本](imges\图20新增模态框的搭建1.png)
    ![alt 属性文本](imges\图20新增模态框的搭建2.png)

    - 下拉框传入学校数据
    ![alt 属性文本](imges\图20下拉框传入学校数据3.png)
    ![alt 属性文本](imges\图20下拉框传入学校数据4.png)

    - 保存数据并显示
    ![alt 属性文本](imges\图20保存数据5.png)
    ![alt 属性文本](imges\图20保存数据6.png)

    - 对要提交的数据进行格式校验
    ![alt 属性文本](imges\图20格式校验数据7.png)

    - 对要提交的数据进行重复性校验并重置表单
    ![alt 属性文本](imges\图20重复性校验数据8.png)

    - 逻辑顺序bug解决
    ![alt 属性文本](imges\图20保存数据9.png)

    - 后端校验（防同行）
    ![alt 属性文本](imges\图20后端校验数据10.png)
    可以在数据库中加上 `unique` 不可重复约束

- 修改数据
    1. 点击编辑
    2. 弹出用户修改的模态框（显示用户信息）
    3. 点击更新，完成用户修改

    - 模态框的建立
    ![alt 属性文本](![alt 属性文本](imges\图21搭建修改模态框1.png)

    - 回显学生信息
    ![alt 属性文本](imges\图21数据回显2.png)

    - 发送ajax完成修改
    法一：`ajax` 发送 `PUT` 请求（推荐）
    ![alt 属性文本](imges\图21ajax发送PUT请求3.png)

    法二：`ajax` 发送 `POST` 转 `PUT` 请求
    ![alt 属性文本](imges\图21ajax发送Post请求4.png)

- 删除数据

    - 单个删除
    ![alt 属性文本](imges\图22单个删除1.png)

    - 全选全不选功能实现
    ![alt 属性文本](imges\图22全选全不选2.png)

    - 批量删除
    ![alt 属性文本](imges\图22批量删除3.png)

- 总结
    ![alt 属性文本](imges\图23总结.png)
