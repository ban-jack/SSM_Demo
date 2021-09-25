package com.ssm.crud.service;

import com.ssm.crud.bean.Student;
import com.ssm.crud.bean.StudentExample;
import com.ssm.crud.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    StudentMapper studentMapper;

    /**
     * 查询所有学生
     * @return
     */
    public List<Student> getAll() {
        //查询所有不带条件
        return studentMapper.selectByExampleWithColl(null);
    }

    /**
     * 学生保存方法
     * @param student
     *
     */
    public void saveStu(Student student) {
        //不用插入id的插入方法
        studentMapper.insertSelective(student);
    }

    /**
     * 检验用户名是否可用
     * @param stuName
     * @return true - 当前姓名可用  fasle - 不可用
     */
    public boolean checkUser(String stuName) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andStuNameEqualTo(stuName);
        //按照条件统计符合条件的记录数
        //按照名字等于stuName 去看数据库有没有这条记录
        //如果有返回大于0的数字
        long count = studentMapper.countByExample(studentExample);
        return count==0;
    }

    /**
     * 按照学生id查询学生
     * @param id
     * @return
     */
    public Student getStu(Integer id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    /**
     * 学生更新
     * @param student
     */
    public void updateStu(Student student) {
        //根据主键有选择的更新
        studentMapper.updateByPrimaryKeySelective(student);
    }

    /**
     * 学生删除单个
     * @param id
     */
    public void deteleStu(Integer id) {
        studentMapper.deleteByPrimaryKey(id);
    }

    /**
     * 学生删除多个
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        StudentExample example = new StudentExample();
        StudentExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in（1,2,3)
        criteria.andStuIdIn(ids);
        studentMapper.deleteByExample(example);
    }
}

