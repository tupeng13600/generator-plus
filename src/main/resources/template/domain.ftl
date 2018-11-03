<#if package??>
package ${package};
</#if>

<#if lombokEnable??>
import lombok.Data;
</#if>
<#if importList??>
<#list importList as imp>
import ${imp};
</#list>
</#if>

<#if lombokEnable??>
@Data
</#if>
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