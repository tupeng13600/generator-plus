package ${domainPackage};

import lombok.Data;
<#if importList??>
<#list importList as imp>
import ${imp};
</#list>
</#if>

/**
 *
 * 该文件无需手动修改，若表变更，运行一次Generator即可，会自动刷新
 *
 */
@Data
public class ${domain} {

<#if propertyList??>
    <#list propertyList as property>
    <#if property.description?? && property.description!=''>
    /**
     * ${property.description}
     */
    </#if>
    private ${property.typeName} ${property.name};

    </#list>
</#if>

}