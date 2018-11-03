package ${package};

import ${mapperPackage}.base.BaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

public abstract class BaseRepository<D, U> {

    @Autowired
    protected BaseMapper<D, U> mapper;

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

}