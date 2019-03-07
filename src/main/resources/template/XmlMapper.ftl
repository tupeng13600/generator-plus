<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="${domain}Mapper">

    <!--          千万不要尝试修改该文件，该文件为模板基础，若表变更，重新执行Generator即可             -->
    <sql id="allFieldMap">
        <#list propertyList as property>
        <#if property_has_next>
            ${property.columnName} AS ${property.name},
        <#else>
            ${property.columnName} AS ${property.name}
        </#if>
        </#list>
    </sql>

    <sql id="AllFields">
        <#list propertyList as property>
            ${property.columnName}<#if property_has_next>,</#if>
        </#list>
    </sql>

    <select id="getByExample" parameterClass="${examplePackage}.${domain}Example" resultClass="${domainPackage}.${domain}">
        SELECT
        <dynamic>
            <isNotNull property="distinct">
                DISTINCT
            </isNotNull>
            <isNotNull property="fields">
                <![CDATA[ $fields$ ]]>
            </isNotNull>
            <isNull property="fields">
                <include refid="allFieldMap" />
            </isNull>
            FROM ${tableName} WHERE 1=1
            <isNotNull property="conditionSql">
                <![CDATA[ $conditionSql$ ]]>
            </isNotNull>
            <isNotNull  property="orderByClause">
                ORDER BY <![CDATA[ $orderByClause$ ]]>
            </isNotNull>
            <isNotNull  property="limit">
                <isNotNull  property="offset">
                    LIMIT #offset#, #limit#
                </isNotNull>
                <isNull property="offset">
                    LIMIT #limit#
                </isNull>
            </isNotNull>

        </dynamic>
    </select>

    <select id="getById" parameterClass="java.lang.Long" resultClass="${domainPackage}.${domain}">
        SELECT
        <dynamic>
            <include refid="allFieldMap" />
            FROM ${tableName} WHERE id = #id#
        </dynamic>
    </select>

    <insert id="insert" parameterClass="${domainPackage}.${domain}">
        insert into ${tableName}
        <dynamic>
            (
            <#list propertyList as property>
            <isNotNull property="${property.name}">
                ${property.columnName}<#if property_has_next>,</#if>
            </isNotNull>
            </#list>
            )
            values (
            <#list propertyList as property>
            <isNotNull property="${property.name}">
            ${r'#'}${property.name}${r'#'}<#if property_has_next>,</#if>
            </isNotNull>
            </#list>
            )
        </dynamic>
        <selectKey resultClass="long" keyProperty="id">
            select LASt_INSERT_ID() AS id
        </selectKey>
    </insert>

    <insert id="insertBatch" parameterClass="java.util.Map">
        INSERT INTO ${tableName}
        <dynamic>
            (
            <#list propertyList as property>
            <isNotNull  property="${property.name}">
                ${property.columnName}<#if property_has_next>,</#if>
            </isNotNull>
            </#list>
            )
            VALUES
            <iterate property="list" conjunction=",">
                (
                <#list propertyList as property>
                <isNotNull  property="${property.name}">
                    ${r'#'}list[].${property.name}${r'#'}<#if property_has_next>,</#if>
                </isNotNull>
                </#list>
                )
            </iterate>
        </dynamic>
    </insert>

    <select id="countByExample" parameterClass="${examplePackage}.${domain}Example" resultClass="java.lang.Long">
        SELECT COUNT(1) FROM ${tableName} WHERE 1=1
        <dynamic>
            <isNotNull property="conditionSql">
                <![CDATA[ $conditionSql$ ]]>
            </isNotNull>
        </dynamic>
    </select>

    <update id="updateByExample" parameterClass="${examplePackage}.${domain}Example">
        UPDATE ${tableName} SET
        <dynamic>
            <isNotNull property="updatedCondition">
                <![CDATA[ $updatedCondition$ ]]>
            </isNotNull>
            WHERE 1=1
            <isNotNull property="conditionSql">
                <![CDATA[ $conditionSql$ ]]>
            </isNotNull>
        </dynamic>
    </update>

    <update id="updateBatch" parameterClass="java.util.Map">
        <dynamic>
            <iterate property="list" conjunction=";">
                UPDATE ${tableName} SET
                <#list propertyList as property>
                <isNotNull property="list[].${property.name}">
                ${property.name} = ${r'#'}list[].${property.name}${r'#'} <#if property_has_next>,</#if>
                </isNotNull>
                </#list>
                WHERE id = ${r'#'}list[].id${r'#'}
            </iterate>
        </dynamic>
    </update>

    <delete id="deleteById" parameterClass="java.lang.Long">
        DELETE FROM ${tableName} WHERE id = #id#;
    </delete>

</sqlMap>