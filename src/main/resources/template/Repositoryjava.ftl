package ${repositoryPackage};

import org.springframework.stereotype.Repository;
import ${mapperPackage}.DemoMessMapper;
import ${mapperPackage}.base.BaseMapper;
import ${mapperPackage}.${domain}Mapper;
import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${repositoryPackage}.base.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 *对数据库操作的统一入口，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
@Repository
public class ${domain}Repository extends BaseRepository<${domain}, ${domain}Example> {

    @Autowired
    private ${domain}Mapper mapper;

    @Override
    protected BaseMapper<${domain}, ${domain}Example> getMapper() {
        return mapper;
    }

}