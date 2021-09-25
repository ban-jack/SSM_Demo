package com.ssm.crud.bean;

import org.springframework.stereotype.Repository;

@Repository

public class College {
    private Integer collId;

    private String collName;

    public College() {
    }

    public College(Integer collId, String collName) {
        this.collId = collId;
        this.collName = collName;
    }

    public Integer getCollId() {
        return collId;
    }

    public void setCollId(Integer collId) {
        this.collId = collId;
    }

    public String getCollName() {
        return collName;
    }

    public void setCollName(String collName) {
        this.collName = collName == null ? null : collName.trim();
    }
}