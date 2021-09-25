package com.ssm.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.crud.bean.College;
import com.ssm.crud.bean.Msg;
import com.ssm.crud.bean.Student;
import com.ssm.crud.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 * @author 33438
 */
@Controller
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    /**
     * 返回所有部门信息
     */
    @ResponseBody
    @RequestMapping("/colls")
    public Msg getStusWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){

        List<College> coll = collegeService.getCollAll();

        return Msg.success().add("college",coll);

    }
}
