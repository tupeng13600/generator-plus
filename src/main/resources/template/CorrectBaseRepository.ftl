package ${basePackage};

import ${mapperPackage}.DemoMessMapper;
import ${basePackage}.BaseMapper;
import ${mapperPackage}.${domain}Mapper;
import ${domainPackage}.${domain};
import ${assemblerPackage}.${domain}Assembler;
import ${basePackage}.BaseRepository;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class ${domain}BaseRepository extends BaseRepository<${domain}, ${domain}Assembler> {

    @Autowired
    private ${domain}Mapper mapper;

    @Override
    protected BaseMapper<${domain}, ${domain}Assembler> getMapper() {
        return mapper;
    }
}
