package ${mapperPackage};

import ${domainPackage}.${domain};
import ${assemblerPackage}.${domain}Assembler;
import ${basePackage}.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 *
 *需要新增自定义操作，在此文件新增即可，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
@Repository
public class ${domain}Mapper extends BaseMapper<${domain}, ${domain}Assembler> {

}