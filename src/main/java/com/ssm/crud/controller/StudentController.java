package com.ssm.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.Student;
import com.ssm.crud.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 处理学生CRUD请求
 * @author 33438
 */
@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    /**
     * 单个删除和批量删除二合一
     * 批量删除： 1-2-3-4-5
     * 单个删除：1
     *
     * @param ids
     * @return
     */
    @RequestMapping(value = "/stu/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteStuById(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String str: str_ids) {
                del_ids.add(Integer.parseInt(str));
            }
            studentService.deleteBatch(del_ids);
        }else {
            //单个删除
            Integer id = Integer.parseInt(ids);
            studentService.deteleStu(id);
        }

        return Msg.success();
    }



    /**
     *
     * 如果直接发送ajax=PUT形式的请求
     * 封装的数据 Student{stuId=2, stuName='null', gender='null', email='null', cId=null, college=null}
     *
     * 问题：
     * 请求体中有数据：
     * 但是Student对象封装不上
     * sql语句如下
     * update stu_tab  where stu_id = 2
     *
     * 原因
     * Tomcat:
     *      1、将请求体中的数据，封装一个map
     *      2、request.getParameter("stuName")就会从这个map中取值
     *      3、SpringMVC封装POJO对象的时候。 会把POJO中每个属性的值，request.getParamter("email");
     *
     * AJAX发送PUT请求引发的血案：
     * 		PUT请求，请求体中的数据，request.getParameter("empName")拿不到
     *      Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
     *      org.apache.catalina.connector.Request--parseParameters() (3111);
     *
     *      protected String parseBodyMethods = "POST";
     *      if( !getConnector().isParseBodyMethod(getMethod()) ) {
     *      success = true;
     *      return;
     *      }
     *
     * 解决方案；
     * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
     * 1、配置上FormContentFilter；
     * 2、他的作用；将请求体中的数据解析包装成一个map。
     * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
     *
     * 学生更新
     * @param student
     * @return
     */
    @RequestMapping(value = "/stu/{stuId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStu(Student student, HttpServletRequest request){
//        System.out.println("请求体中的值："+request.getParameter("gender"));
//        System.out.println("更新的员工数据"+student);
        studentService.updateStu(student);
        return Msg.success();
    }


    /**
     * 根据id查询学生
     * @param id
     * @return
     */
    @RequestMapping(value = "/stu/{id}", method = RequestMethod.GET)
    @ResponseBody
    /*
    @PathVariable("xxx")
    通过 @PathVariable 可以将URL中占位符参数{xxx}绑定到处理器类的方法形参中@PathVariable(“xxx“)
    */
    public Msg getStu(@PathVariable("id") Integer id){
        Student stu =  studentService.getStu(id);
        return Msg.success().add("student",stu);
    }


    /**
     * 检查用户名是否可用
     * @param stuName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public  Msg checkuser(@RequestParam("stuName") String stuName){
        //先判断用户名是否合法的表达式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!stuName.matches(regx)){
            //如果校验失败则返回错误
            return Msg.fail().add("va_msg","用户名必须是2-5位中文或者6-16位英文和数字的组合");
        }
        //数据库用户名重复校验
        boolean check = studentService.checkUser(stuName);
        if (check){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","用户名重复不可用");
        }
    }


    /**
     * 学生保存
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validation
     *
     * @return
     */
    @RequestMapping(value = "/stu",method = RequestMethod.POST)
    @ResponseBody
    /*
    @Valid校验
    BindingResult result 封装结果
    */
    public Msg saveStu(@Valid Student student, BindingResult result){
        if(result.hasErrors()){
            Map<String, Object> map = new HashMap<>();
            //校验失败，应该返回失败，在模态框中校验失败的错误信息
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名:"+fieldError.getField());
                System.out.println("错误信息:"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else {
            studentService.saveStu(student);
            return Msg.success();
        }

    }

    /**
     * 导入jackson包
     * @param pageNum
     * @return
     */
    @RequestMapping("/stus")
    /*自动把返回对象转换为json字符串*/
    @ResponseBody
    public Msg getStusWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,5);
        // startPage后面紧跟的这个查询就是分页查询
        List<Student> stu = studentService.getAll();
        // 使用pageInfo包装查询后的结果 只需要将pageInfo交给页面就行了
        // 封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(stu,5);

        return Msg.success().add("pageInfo",page);

    }


    /**
     * 查询学生数据（分页查询）
     * @return
     */
//    @RequestMapping("/stu")
    public String getStu(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model){
        // 引入PageHelper分页插件
        // 查询之前只需要调用 传入页码以及每页大小
        PageHelper.startPage(pageNum,5);
        // startPage后面紧跟的这个查询就是分页查询
        List<Student> stu = studentService.getAll();
        // 使用pageInfo包装查询后的结果 只需要将pageInfo交给页面就行了
        // 封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(stu,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

}
