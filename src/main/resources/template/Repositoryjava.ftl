package ${repositoryPackage};

import org.springframework.stereotype.Repository;
import ${repositoryPackage}.base.${domain}BaseRepository;

/**
 *
 *对数据库操作的统一入口，该文件只会生成一次，在执行Generator时不会覆盖掉新增加的代码
 *
 */
@Repository
public class ${domain}Repository extends ${domain}BaseRepository {

}