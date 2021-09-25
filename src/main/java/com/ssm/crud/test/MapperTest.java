package com.ssm.crud.test;


import com.ssm.crud.bean.College;
import com.ssm.crud.bean.Student;
import com.ssm.crud.dao.CollegeMapper;
import com.ssm.crud.dao.StudentMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 *
 * 测试dao层的工作
 * @author 33438
 *
 * 推荐spring的项目可以使用spring的单元测试 可以自动注入我们需要的组件
 *  1、导入SpringTest模块
 *  2、@ContextConfiguration指定spring配置文件的位置
 *  3、@RunWith指定单元测试Test用SpringJUnit4
 *  4、直接@Autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    CollegeMapper collegeMapper;

    @Autowired
    StudentMapper studentMapper;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试CollegeMapper
     *
     */
    @Test
    public void testCRUD(){

/*      以前的方式
        //1、创建SpringIOC容器
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2、从容器中获取mapper
        College bean = ioc.getBean(College.class);*/

        System.out.println(collegeMapper);

        // 插入几个部门
//        collegeMapper.insertSelective(new College(null,"清华大学"));
//        collegeMapper.insertSelective(new College(null,"北京邮电大学"));

        // 生成员工数据 测试员工插入
//        studentMapper.insertSelective(new Student(null, "梅西", "F", "meixi@qq.com",1));

        // 批量插入多个员工：批量，使用可以执行批量操作的sqlSession
        // 法一
/*        for(){
            studentMapper.insertSelective(new Student(null, "梅西", "F", "meixi@qq.com",1));

        }*/
        // 法二 配置一个可以执行批量的sqlSession 并且注入
        StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
        for (int i = 0; i < 1000; i++ ){
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Student(null, uid, "M",uid+"@qq.com",1));
        }
        System.out.println("批量完成");
    }

}
