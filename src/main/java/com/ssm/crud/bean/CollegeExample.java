package com.ssm.crud.bean;

import java.util.ArrayList;
import java.util.List;

public class CollegeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CollegeExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCollIdIsNull() {
            addCriterion("coll_id is null");
            return (Criteria) this;
        }

        public Criteria andCollIdIsNotNull() {
            addCriterion("coll_id is not null");
            return (Criteria) this;
        }

        public Criteria andCollIdEqualTo(Integer value) {
            addCriterion("coll_id =", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdNotEqualTo(Integer value) {
            addCriterion("coll_id <>", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdGreaterThan(Integer value) {
            addCriterion("coll_id >", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("coll_id >=", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdLessThan(Integer value) {
            addCriterion("coll_id <", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdLessThanOrEqualTo(Integer value) {
            addCriterion("coll_id <=", value, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdIn(List<Integer> values) {
            addCriterion("coll_id in", values, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdNotIn(List<Integer> values) {
            addCriterion("coll_id not in", values, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdBetween(Integer value1, Integer value2) {
            addCriterion("coll_id between", value1, value2, "collId");
            return (Criteria) this;
        }

        public Criteria andCollIdNotBetween(Integer value1, Integer value2) {
            addCriterion("coll_id not between", value1, value2, "collId");
            return (Criteria) this;
        }

        public Criteria andCollNameIsNull() {
            addCriterion("coll_name is null");
            return (Criteria) this;
        }

        public Criteria andCollNameIsNotNull() {
            addCriterion("coll_name is not null");
            return (Criteria) this;
        }

        public Criteria andCollNameEqualTo(String value) {
            addCriterion("coll_name =", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameNotEqualTo(String value) {
            addCriterion("coll_name <>", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameGreaterThan(String value) {
            addCriterion("coll_name >", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameGreaterThanOrEqualTo(String value) {
            addCriterion("coll_name >=", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameLessThan(String value) {
            addCriterion("coll_name <", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameLessThanOrEqualTo(String value) {
            addCriterion("coll_name <=", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameLike(String value) {
            addCriterion("coll_name like", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameNotLike(String value) {
            addCriterion("coll_name not like", value, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameIn(List<String> values) {
            addCriterion("coll_name in", values, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameNotIn(List<String> values) {
            addCriterion("coll_name not in", values, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameBetween(String value1, String value2) {
            addCriterion("coll_name between", value1, value2, "collName");
            return (Criteria) this;
        }

        public Criteria andCollNameNotBetween(String value1, String value2) {
            addCriterion("coll_name not between", value1, value2, "collName");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}