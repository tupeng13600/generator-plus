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

    public Integer insert(D domain) {
        return getMapper().insert(domain);
    }

    public Integer insertBatch(List<D> list) {
        return getMapper().insertBatch(list);
    }

    public D getById(Long id) {
        return getMapper().getById(id);
    }

    public Integer updateById(D domain) {
        return getMapper().updateById(domain);
    }

    public List<D> getByExample(E example){
        return getMapper().getByExample(example);
    }

    public Long countByExample(E example){
        return getMapper().countByExample(example);
    }

    public Integer deleteById(Long id){
        return getMapper().deleteById(id);
    }

    protected abstract BaseMapper<D, E> getMapper();

}