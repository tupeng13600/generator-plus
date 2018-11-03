package ${package};

import org.springframework.stereotype.Repository;
import ${domainPackage}.${domain};
import ${examplePackage}.${domain}Example;
import ${package}.base.BaseRepository;

@Repository
public class ${domain}Repository extends BaseRepository<${domain}, ${domain}Example> {

}