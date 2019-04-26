package ${basePackage};

import com.ucarinc.framework.autoconfigure.ubatis.dao.BaseUbatisDaoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 *该文件无需修改，为自动生成，且一旦生成将不再改变
 */
public abstract class BaseMapper<D, E> extends BaseUbatisDaoImpl {

    private String mapperNamespace;

    @SuppressWarnings("unchecked")
    public BaseMapper(String mapperNamespace) {
        super(true);
        this.mapperNamespace = mapperNamespace;
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

    public Integer deleteById(Long id){
        return deleteObject(mapperNamespace.concat("deleteById"), id);
    }

}
