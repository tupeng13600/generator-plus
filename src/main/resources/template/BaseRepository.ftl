package ${basePackage};

import ${basePackage}.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
/**
 *
 * 该文件无需手动修改，若表变更，运行一次Generator即可，会自动刷新
 *
 */
public abstract class BaseRepository<D, E> {

    public Object insert(D domain) {
        return getMapper().insert(domain);
    }

    public Integer insertBatch(List<D> list) {
        return getMapper().insertBatch(list);
    }

    public Integer updateBatch(List<D> list) {
        return getMapper().updateBatch(list);
    }

    public D getById(Long id) {
        return getMapper().getById(id);
    }

    public Integer deleteById(Long id){
        return getMapper().deleteById(id);
    }

    protected abstract BaseMapper<D, E> getMapper();

}