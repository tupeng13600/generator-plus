package ${basePackage};

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.zuche.framework.common.RequestContext;
import com.zuche.framework.dao.IbatisDaoImpl;
import com.zuche.framework.dao.util.QueryCond;
import com.zuche.framework.vo.SortNameMappingVO;
import org.jmesa.limit.Limit;
import org.jmesa.limit.SortSet;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zuche.framework.utils.StringUtils.isBlank;

/**
 *
 *该文件无需修改，为自动生成，且一旦生成将不再改变
 */
public abstract class BaseMapper<D, E> extends IbatisDaoImpl {

    private String mapperNamespace;
    private Class<D> clazz;
    private Method loadJmesaVoMethod;
    private Method toStrMethod;

    @SuppressWarnings("unchecked")
    public BaseMapper(String mapperNamespace) {
        super(true);
        this.mapperNamespace = mapperNamespace;
        clazz = (Class<D>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        try {
//            ClassUtils.getMethod()
            loadJmesaVoMethod = IbatisDaoImpl.class.getDeclaredMethod("loadJmesaVO", Class.class);
            loadJmesaVoMethod.setAccessible(true);

            toStrMethod = IbatisDaoImpl.class.getDeclaredMethod("toStr", SortSet.class);
            toStrMethod.setAccessible(true);
            super.setSqlMapClientTemplate(new SqlMapClientTemplateExtendLog());
        } catch (NoSuchMethodException e) {
            logger.error("不支持的方法，请检查是否继承IbatisDaoImpl！ " + e.getMessage(), e);
        }
    }

    @Resource(name = "dataSource")
    public void setDataSourceCarGps(DataSource dataSourceCarSale) {
        this.setDataSource(dataSourceCarSale);
    }

    @Resource(name = "sqlMapClient")
    public void setSqlMapClientCarGps(SqlMapClient sqlMapClientCarSale) {
        this.setSqlMapClient(sqlMapClientCarSale);
    }

    @Resource(name = "sqlExecutor")
    public void setSqlExecutorCarGps(SqlExecutor sqlExecutorCarSale) {
        this.setSqlExecutors(sqlExecutorCarSale);
    }

    public List<D> getByAssembler(E assembler){
        return (List<D>) super.queryForList(mapperNamespace.concat("getByAssembler"), assembler);
    }

    public D getById(Long id){
        return (D) super.queryForObject(mapperNamespace.concat("getById"), id);
    }

    public Object insert(D domain){
        return super.insert(mapperNamespace.concat("insert"), domain);
    }

    public Long countByAssembler(E assembler){
        return (Long)queryForObject(mapperNamespace.concat("countByAssembler"), assembler);
    }

    @SuppressWarnings("unchecked")
    public <T> List<T> queryList(String statementId, Object queryParam) {
        Limit limit = RequestContext.getJmesaLimit();
        if(limit == null && queryParam instanceof QueryCond){
            limit = ((QueryCond) queryParam).getLimit();
        }

        if (limit == null) {
            if (queryParam instanceof BaseAssembler && statementId == null) {
                return (List<T>) getByAssembler((E) queryParam);
            } else if (queryParam instanceof QueryCond) {
                QueryCond queryCond = (QueryCond) queryParam;
                return getSqlMapClientTemplate().queryForList(statementId, queryParam, queryCond.getStartIndex(),
                        queryCond.getEndIndex(), null);
            }
            return queryForList(statementId, queryParam);
        }
        String orderByStr = null;
        boolean isSort = limit.getSortSet().isSorted();
        SortNameMappingVO mapping;
        try {
            mapping = (SortNameMappingVO) loadJmesaVoMethod.invoke(this, clazz);
            if (!isSort && queryParam instanceof QueryCond) {
                orderByStr = ((QueryCond) queryParam).getDefaultOrder();
                if (isBlank(orderByStr)) {
                    orderByStr = mapping.getDefaultName();
                }
            } else {
                orderByStr = ordermapper(mapping.getMap(), (String) toStrMethod.invoke(this, limit.getSortSet()));
            }
        } catch (Exception e) {
            logger.error("排序方法调用失败！" + e.getMessage(), e);
        }
        int start = limit.getRowSelect().getRowStart();
        int end = limit.getRowSelect().getRowEnd();
        if (queryParam instanceof QueryCond) {
            ((QueryCond) queryParam).setOrderByColumn(" ORDER BY " + orderByStr);

            if(((QueryCond) queryParam).getStartIndex() != -1){
                start = ((QueryCond) queryParam).getStartIndex();
            }
            if(((QueryCond) queryParam).getEndIndex()>0){
                end = ((QueryCond) queryParam).getEndIndex();
            }
        }
        if (queryParam instanceof BaseAssembler) {
            BaseAssembler assembler = (BaseAssembler) queryParam;
            assembler.setOffset(start);
            assembler.setLimit(limit.getRowSelect().getMaxRows());
            assembler.setOrderByClause(orderByStr);
            return (List<T>) getByAssembler((E) queryParam);
        }
        return this.getSqlMapClientTemplate().queryForList(statementId, queryParam, start, end,null);
    }

    public <T> List<T> queryList(E e) {
        return this.queryList(null, e);
    }

    public Integer updateByAssembler(E assembler){
        return update(mapperNamespace.concat("updateByAssembler"), assembler);
    }

    public Integer insertBatch(List<D> list){
        if(null == list || list.size() == 0) {
            return 0;
        }
        Map<String,List<D>> insertMap = new HashMap<>();
        insertMap.put("list", list);
        return (Integer)super.insert(mapperNamespace.concat("insertBatch"), insertMap);
    }

    public Integer updateBatch(List<D> list){
        if(null == list || list.size() == 0) {
            return 0;
        }
        super.batchUpdate(mapperNamespace.concat("updateById"), list);
        return list.size();
    }

    protected String getJmesaSort(Object queryParam, Limit limit) {

        return null;
    }

    public Integer deleteById(Long id){
        return deleteObject(mapperNamespace.concat("deleteById"), id);
    }

}
