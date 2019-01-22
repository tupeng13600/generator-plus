package ${mapperPackage};

import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${mapperPackage}.base.BaseMapper;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 *需要新增自定义操作，在此文件新增即可，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
@Repository
public class ${domain}Mapper extends BaseMapper<${domain}, ${domain}Example> {

    private static final String EXTRA_MAPPER = "${domain}ExtMapper"; //自定义SQL时使用该namespace

    public ${domain}Mapper(){
        super("${domain}Mapper");
    }

}