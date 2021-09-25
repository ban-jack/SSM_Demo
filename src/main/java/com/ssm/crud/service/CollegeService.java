package com.ssm.crud.service;

import com.ssm.crud.bean.College;
import com.ssm.crud.dao.CollegeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeService {

    @Autowired
    private CollegeMapper collegeMapper;

    public List<College> getCollAll() {
        List<College> colleges = collegeMapper.selectByExample(null);
        return colleges;
    }
}
