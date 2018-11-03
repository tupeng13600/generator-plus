package com.mybatis.plus.context;

import com.mybatis.plus.model.PropertyModel;

import java.util.*;

public abstract class ArgsFactory {

    public static Map<String, Object> initArg(){
        Map<String, Object> args = new HashMap<>();
        args.put("examplePackage", PlusContext.getExamplePackage());
        args.put("domainPackage", PlusContext.getDomainPackage());
        args.put("mapperPackage", PlusContext.getMapperPackage());
        args.put("repositoryPackage", PlusContext.getRepositoryPackage());
        args.put("lombokEnable", true);
        return args;
    }

    public static Map<String, Object> initArg(String domainName, List<PropertyModel> propertyList){
        Map<String, Object> args = new HashMap<>();
        args.put("examplePackage", PlusContext.getExamplePackage());
        args.put("domainPackage", PlusContext.getDomainPackage());
        args.put("mapperPackage", PlusContext.getMapperPackage());
        args.put("repositoryPackage", PlusContext.getRepositoryPackage());
        args.put("lombokEnable", true);

        Set<String> importList = new HashSet<>();
        for (PropertyModel property : propertyList) {
            if(null != property.getFullTypeName() && !"".equals(property.getFullTypeName().trim())) {
                importList.add(property.getFullTypeName());
            }
        }
        args.put("propertyList", propertyList);
        args.put("domain", domainName);
        args.put("importList", importList);
        return args;
    }

}
