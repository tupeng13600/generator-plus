package ${basePackage};

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Example 基础生成类,无需修改
 */
public abstract class BaseExample<T extends BaseExample.GeneratedCriteria> {

    private static final String AND = " AND ";

    private static final String BLANK = " ";

    protected String conditionSql;

    private String orderByClause;

    private boolean distinct;

    protected StringBuilder updatedCondition = null;

    private List<T> oredCriteria;

    private String fields;

    private Integer limit;

    private Integer offset;

    public BaseExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public String getUpdatedCondition() {
        return null == updatedCondition ? null : updatedCondition.toString();
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public String getFields() {
        return fields;
    }

    public List<T> getOredCriteria() {
        return oredCriteria;
    }

    public void or(T criteria) {
        oredCriteria.add(criteria);
    }

    public T or() {
        T criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public T createCriteria() {
        T criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected abstract T createCriteriaInternal();

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

    public String getConditionSql() {
        StringBuilder builder = new StringBuilder();
        if (null == oredCriteria || oredCriteria.size() == 0) {
            return "";
        }
        for (GeneratedCriteria critia : oredCriteria) {
            builder.append(doCritia(critia));
        }
        return builder.toString();
    }

    private String doCritia(GeneratedCriteria critia) {
        StringBuilder builder = new StringBuilder();
        if (null == critia || !critia.isValid() || critia.criteria.isEmpty()) {
            return builder.toString();
        }
        for (Criterion criterion : critia.criteria) {
            doCriterion(criterion, builder);
        }
        return builder.toString();
    }

    private void doCriterion(Criterion criterion, StringBuilder builder) {
        builder.append(AND).append(criterion.condition).append(BLANK);

        if (criterion.noValue) {
            return;
        }

        if (criterion.singleValue) {
            builder.append(handlerVal(criterion.value)).append(BLANK);
            return;
        }

        if (criterion.betweenValue) {
            builder.append(handlerVal(criterion.value))
                    .append(AND)
                    .append(handlerVal(criterion.secondValue)).append(BLANK);
            return;
        }

        if (criterion.listValue) {
            if (criterion.value instanceof Collection) {
                doListValue(((Collection) criterion.value).iterator(), builder);
            } else {
                throw new RuntimeException("Error Type of argument");
            }
        }
    }

    protected static class Criterion {

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

    public abstract static class GeneratedCriteria {

        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return !criteria.isEmpty();
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

    }


    private void doListValue(Iterator iterator, StringBuilder builder) {
        if (!iterator.hasNext()) {
            return;
        }
        builder.append(" (").append(BLANK);
        while (iterator.hasNext()) {
            Object val = iterator.next();
            builder.append(handlerVal(val.toString()));
            if (iterator.hasNext()) {
                builder.append(", ");
            }
        }
        builder.append(") ");
    }

    protected Object handlerVal(Object val) {
        if (null == val) {
            return "null";
        }
        if (val instanceof String) {
            String strVal = val.toString().replaceAll("'", "\\\\'")
            return "'".concat(strVal).concat("'");
        }
        if (val instanceof Date) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return "'".concat(format.format(val)).concat("'");
        }
        return val;
    }

    protected abstract String getColumn(String field);

    public BaseExample<T> fields(String... fields) {
        if(null == fields || fields.length == 0) {
            this.fields = null;
        } else {
            StringBuilder builder = new StringBuilder();
            for(String field : fields) {
                String column = getColumn(field);
                if(null == column) {
                    column = field;
                }
                builder.append(column).append(" AS ").append(field).append(",");
            }
            String desFields = builder.toString();
            desFields = desFields.substring(0, desFields.length() - 1);
            this.fields = desFields;
        }
        return this;
    }


}
