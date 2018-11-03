package ${domainPackage};

import lombok.Data;
<#if importList??>
<#list importList as imp>
import ${imp};
</#list>
</#if>

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