package ${repositoryPackage}.base;

import ${mapperPackage}.base.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
/**
 *
 * 该文件无需手动修改，若表变更，运行一次Generator即可，会自动刷新
 *
 */
public abstract class BaseRepository<D, E> {

    @Autowired
    protected BaseMapper<D, E> mapper;

    public Integer insert(D domain) {
        return mapper.insert(domain);
    }

    public Integer insertBatch(List<D> list) {
        return mapper.insertBatch(list);
    }

    public D getById(Integer id) {
        return mapper.getById(id);
    }

    public Integer updateById(D domain) {
        return mapper.updateById(domain);
    }

    public List<D> getByExample(E example){
        return mapper.getByExample(example);
    }

    public Long countByExample(E example){
        return mapper.countByExample(example);
    }

}