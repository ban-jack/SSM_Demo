package com.ssm.crud.bean;

import javax.validation.constraints.Pattern;

public class Student {
    private Integer stuId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message = "用户名可以是2-5位中文或者6-16位英文和数字的组合")
    private String stuName;

    private String gender;

    @Pattern(regexp = "(^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$)"
            ,message = "邮箱格式不正确")
    private String email;

    private Integer cId;

    // 新增学校属性
    private College college;

    public Student() {
    }

    public Student(Integer stuId, String stuName, String gender, String email, Integer cId) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.gender = gender;
        this.email = email;
        this.cId = cId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuId=" + stuId +
                ", stuName='" + stuName + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", cId=" + cId +
                ", college=" + college +
                '}';
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }
}