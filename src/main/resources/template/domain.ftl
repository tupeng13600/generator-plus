package ${domainPackage};
<#if (lombokEnable?string('yes', 'no'))=='yes'>
import lombok.Data;
</#if>
import com.zuche.framework.annotation.IbatisAliasConfig;
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
<#if (lombokEnable?string('yes', 'no'))=='yes'>
@Data
</#if>
@IbatisAliasConfig(alias = "${domain?uncap_first}")
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
<#if (lombokEnable?string('yes', 'no'))=='yes'>
<#else >
<#if propertyList??>
    <#list propertyList as property>
    public ${property.typeName} get${property.name?cap_first}(){
        return this.${property.name};
    }

    public void set${property.name?cap_first}(${property.typeName} ${property.name}){
        this.${property.name} = ${property.name};
    }

    </#list>
    </#if>
</#if>
}