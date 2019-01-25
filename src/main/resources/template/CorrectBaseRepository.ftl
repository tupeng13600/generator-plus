package ${repositoryPackage}.base;

import com.uc.mmcmams.repository.mapper.DemoMessMapper;
import ${mapperPackage}.base.BaseMapper;
import ${mapperPackage}.${domain}Mapper;
import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${repositoryPackage}.base.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class ${domain}BaseRepository extends BaseRepository<${domain}, ${domain}Example> {

    @Autowired
    private ${domain}Mapper mapper;

    @Override
    protected BaseMapper<${domain}, ${domain}Example> getMapper() {
        return mapper;
    }
}
