package ${mapperPackage}.base;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.zuche.framework.dao.IbatisDaoImpl;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 *该文件无需修改，为自动生成，且一旦生成将不再改变
 */
public abstract class BaseMapper<D, E> extends IbatisDaoImpl {

    private String mapperNamespace;

    public BaseMapper(String mapperNamespace) {
        super(true);
        this.mapperNamespace = mapperNamespace;
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

    public List<D> getByExample(E example){
        return super.queryForList(mapperNamespace.concat(".getByExample"), example);
    }

    public D getById(Long id){
        return super.queryForObject(mapperNamespace.concat(".getById"), id);
    }

    public Integer insert(D domain){
        return super.insert(mapperNamespace.concat(".insert"), domain)
    }

    public void insertBatch(List<D> list){
        Map<${r'String'},List<D>> insertMap = new HashMap<>();
        insertMap.put("list", list)
        return super.insert(mapperNamespace.concat(".insertBatch"), insertMap)
    }

    public Long countByExample(E example){
        return (Long)queryForObject(mapperNamespace.concat(".countByExample"), example);
    }

    public Integer updateById(D domain){
        return (Integer)queryForObject(mapperNamespace.concat(".updateById"), domain);
    }

}
