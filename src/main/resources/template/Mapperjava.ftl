package ${mapperPackage};

import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${mapperPackage}.base.BaseMapper;

/**
 *
 *需要新增自定义操作，在此文件新增即可，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
public interface ${domain}Mapper extends BaseMapper<${domain}, ${domain}Example> {

}