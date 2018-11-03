<#if package??>
package ${package};
</#if>

import java.util.List;
import java.util.ArrayList;
<#if importList??>
<#list importList as imp>
import ${imp};
</#list>
</#if>

public class ${domain}Example {

    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public ${domain}Example() {
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

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
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

        <#list propertyList as property>
        public Criteria and${property.methodPropertyName}IsNull() {
            addCriterion("${property.columnName} is null");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}IsNotNull() {
            addCriterion("${property.columnName} is not null");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}EqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} =", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}NotEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} <>", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}GreaterThan(${property.typeName} value) {
            addCriterion("${property.columnName} >", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}GreaterThanOrEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} >=", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}LessThan(${property.typeName} value) {
            addCriterion("${property.columnName} <", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}LessThanOrEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} <=", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}In(List<${property.typeName}> values) {
            addCriterion("${property.columnName} in", values, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}NotIn(List<${property.typeName}> values) {
            addCriterion("${property.columnName} not in", values, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}Between(${property.typeName} value1, ${property.typeName} value2) {
            addCriterion("${property.columnName} between", value1, value2, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}NotBetween(${property.typeName} value1, ${property.typeName} value2) {
            addCriterion("${property.columnName} not between", value1, value2, "${property.name}");
            return (Criteria) this;
        }

        <#if property.typeName=="String">
        public Criteria andC${property.methodPropertyName}NotLike(String value) {
            addCriterion("${property.columnName} not like", value, "${property.name}");
            return (Criteria) this;
        }

        public Criteria and${property.methodPropertyName}Like(String value) {
            addCriterion("${property.columnName} like", value, "${property.name}");
            return (Criteria) this;
        }
        </#if>
        </#list>
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
            this.condition = condition; this.typeHandler = null; this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value; this.typeHandler = typeHandler;
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