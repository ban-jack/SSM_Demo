package com.ssm.crud.test;

import com.github.pagehelper.PageInfo;
import com.ssm.crud.bean.Student;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring测试模块提供的测试请求功能，测试crud请求的正确性
 * @author 33438
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
/*
首先加上spring的配置文件
classpath:applicationContext.xml
因为是测试请求功能,所以还要加上springmvc的配置文件
file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml
*/
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {

    //传入Springmvc的ioc
    //上面的@WebAppConfiguration注解让我们可以用@Autowired自动装配springmvc的IOC容器,
    //不加的话是不可以自动装配IOC容器自身的
    @Autowired
    WebApplicationContext context;
    //虚拟的mvc请求，获取到处理结果
    MockMvc mockMvc;

    //@Before:每次先调用这个方法
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void  testPage() throws Exception {

        /*
         * 模拟请求拿到返回值
         * perform:模拟我们发送请求
         * param:请求要带的参数
         * andReturn:拿到返回值
         */
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/stu").param("pageNum", "1")).andReturn();

        // 请求成功后，请求域中会有pageInfo，我们可以取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo p = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+p.getPageNum());
        System.out.println("总页码"+p.getPages());
        System.out.println("总记录数"+p.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums = p.getNavigatepageNums();
        for (int i:nums) {
            System.out.println(""+i);
        }

        // 获取员工数据
        List<Student> list = p.getList();
        for (Student s:list) {
            System.out.println("ID:"+s.getStuId()+"---->Name:"+s.getStuName());
        }
    }

}
