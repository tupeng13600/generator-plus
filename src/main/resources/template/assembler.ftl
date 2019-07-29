package ${assemblerPackage};

import java.util.List;
import java.io.Serializable;
import ${basePackage}.BaseAssembler;
<#if importList??>
<#list importList as imp>
import ${imp};
</#list>
</#if>

/**
 *
 * 该文件无需手动修改，若表变更，运行一次Generator即可，会自动刷新
 *
 */
public class ${domain}Assembler extends BaseAssembler<${domain}Assembler.Criteria> implements Serializable {

    public ${domain}Assembler() {
        super();
    }

    @Override
    protected Criteria createCriteriaInternal() {
        return new Criteria();
    }

    @Override
    protected String getColumn(String field) {
        return Field.getColumn(field);
    }

    <#list propertyList as property>
    public ${domain}Assembler set${property.methodPropertyName}(${property.typeName} value) {
        if(null != value) {
            updateConditionMap.put("${property.columnName}", value);
        }
        return this;
    }
    </#list>

    <#list propertyList as property>
    public ${domain}Assembler set${property.methodPropertyName}ToNull() {
        if(null != value) {
            nullConditionSet.add("${property.columnName}");
        }
        return this;
    }
    </#list>

    <#list propertyList as property>
        public ${domain}Assembler orderBy${property.methodPropertyName}ASC() {
            if(null == orderByClause) {
                orderByClause = " ${property.columnName} ASC ";
            } else {
                orderByClause = orderByClause + ", ${property.columnName} ASC";
            }
        return this;
        }
    </#list>

    <#list propertyList as property>
        public ${domain}Assembler orderBy${property.methodPropertyName}DESC() {
            if(null == orderByClause) {
                orderByClause = " ${property.columnName} DESC ";
            } else {
                orderByClause = orderByClause + ", ${property.columnName} DESC";
            }
            return this;
        }
    </#list>

    public static class Criteria extends BaseAssembler.GeneratedCriteria {
        protected Criteria() {
            super();
        }
        <#list propertyList as property>
        public Criteria and${property.methodPropertyName}IsNull() {
            addCriterion("${property.columnName} is null");
            return this;
        }

        public Criteria and${property.methodPropertyName}IsNotNull() {
            addCriterion("${property.columnName} is not null");
            return this;
        }

        public Criteria and${property.methodPropertyName}EqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} =", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}NotEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} <>", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}GreaterThan(${property.typeName} value) {
            addCriterion("${property.columnName} >", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}GreaterThanOrEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} >=", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}LessThan(${property.typeName} value) {
            addCriterion("${property.columnName} <", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}LessThanOrEqualTo(${property.typeName} value) {
            addCriterion("${property.columnName} <=", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}In(List<${property.typeName}> values) {
            addCriterion("${property.columnName} in", values, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}NotIn(List<${property.typeName}> values) {
            addCriterion("${property.columnName} not in", values, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}Between(${property.typeName} value1, ${property.typeName} value2) {
            addCriterion("${property.columnName} between", value1, value2, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}NotBetween(${property.typeName} value1, ${property.typeName} value2) {
            addCriterion("${property.columnName} not between", value1, value2, "${property.name}");
            return this;
        }

        <#if property.typeName=="String">
        public Criteria and${property.methodPropertyName}NotLike(String value) {
            addCriterion("${property.columnName} not like", value, "${property.name}");
            return this;
        }

        public Criteria and${property.methodPropertyName}Like(String value) {
            addCriterion("${property.columnName} like", value, "${property.name}");
            return this;
        }
        </#if>
        </#list>
    }

    private enum Field{
        <#list propertyList as property>
        ${property.name}("${property.columnName}"),
        </#list>
        ;

        private String columnName;

        Field(String columnName) {
            this.columnName = columnName;
        }

        public static String getColumn(String field) {
            try{
                return Field.valueOf(field).columnName;
            }catch (Exception e) {
                return null;
            }
        }
    }

}