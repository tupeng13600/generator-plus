package ${basePackage};

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import java.util.HashMap;

/**
 * Assembler 基础生成类,无需修改
 */
public abstract class BaseAssembler<T extends BaseAssembler.GeneratedCriteria> {

    private static final String AND = " AND ";

    private static final String BLANK = " ";

    protected String conditionSql;

    protected String orderByClause;

    private boolean distinct;

    protected StringBuilder updatedCondition = null;

    protected Map<String, Object> updateConditionMap = new HashMap<>();

    protected Set<String> nullConditionSet = new HashSet<>();

    private List<T> oredCriteria;

    protected String fields;

    private Integer limit;

    private Integer offset;

    public BaseAssembler() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public String getUpdatedCondition() {
        if(updatedCondition != null) {
            return updatedCondition.toString();
        }
        List<String> updateList = new ArrayList<>();
        if(!updateConditionMap.isEmpty()) {
            updateConditionMap.forEach((column, value) -> {
                if (nullConditionSet.contains(column)) {
                    updateList.add(column + " = " + null);
                    nullConditionSet.remove(column);
                } else {
                    updateList.add(column + " = " + handlerVal(value));
                }
            });
        }

        if(!nullConditionSet.isEmpty()) {
            nullConditionSet.forEach(column -> updateList.add(column + " = null"));
        }

        String result = null;
        if(!updateList.isEmpty()) {
            result = " ".concat(String.join(", ", updateList)).concat(" ");
        }
        return result;
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
            String strVal = val.toString().replaceAll("'", "\\\\'");
            return "'".concat(strVal).concat("'");
        }
        if (val instanceof Date) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return "'".concat(format.format(val)).concat("'");
        }
        return val;
    }

    @Override
    protected String getColumn(String field) {
        return null;
    }

}
