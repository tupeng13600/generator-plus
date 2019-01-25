package ${mapperPackage};

import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${mapperPackage}.base.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 *
 *需要新增自定义操作，在此文件新增即可，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
@Repository
public class ${domain}Mapper extends BaseMapper<${domain}, ${domain}Example> {

    /** 这部分代码为自动生成代码, 一般情况无需修改 **/

    private static final String EXTRA_MAPPER = "${domain}ExtMapper"; //自定义SQL时使用该namespace

    private static final String DEFAULT_NAMESPACE = "${domain}Mapper";

    public ${domain}Mapper(){
        super(DEFAULT_NAMESPACE);
    }

    /** 这部分代码为自动生成代码, 一般情况无需修改 **/

}