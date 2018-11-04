<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${mapperPackage}.${domain}Mapper">

    <!--          千万不要尝试修改该文件，该文件为模板基础，若表变更，重新执行Generator即可             -->


    <resultMap id="BaseMap" type="${domainPackage}.${domain}">
        <#list propertyList as property>
        <#if property.name?? && property.name=='id'>
        <id column="id" property="id" />
        <#else >
        <result column="${property.columnName}" property="${property.name}" />
        </#if>
        </#list>
    </resultMap>
    <sql id="Example_Where_Clause">
        <where>
            <foreach collection="oredCriteria" item="criteria" separator="or">
                <if test="criteria.valid">
                    <trim prefix="(" prefixOverrides="and" suffix=")">
                        <foreach collection="criteria.criteria" item="criterion">
                            <choose>
                                <when test="criterion.noValue">
                                    and ${r'${'}criterion.condition}
                                </when>
                                <when test="criterion.singleValue">
                                    and ${r'${'}criterion.condition} ${r'#{'}criterion.value}
                                </when>
                                <when test="criterion.betweenValue">
                                    and ${r'${'}criterion.condition} ${r'#{'}criterion.value} and ${r'#{'}criterion.secondValue}
                                </when>
                                <when test="criterion.listValue">
                                    and ${r'${'}criterion.condition}
                                    <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                                    ${r'#{'}listItem}
                                    </foreach>
                                </when>
                            </choose>
                        </foreach>
                    </trim>
                </if>
            </foreach>
        </where>
    </sql>
    <sql id="Update_By_Example_Where_Clause">
        <where>
            <foreach collection="example.oredCriteria" item="criteria" separator="or">
                <if test="criteria.valid">
                    <trim prefix="(" prefixOverrides="and" suffix=")">
                        <foreach collection="criteria.criteria" item="criterion">
                            <choose>
                                <when test="criterion.noValue">
                                    and ${r'${'}criterion.condition}
                                </when>
                                <when test="criterion.singleValue">
                                    and ${r'${'}criterion.condition} ${r'#{'}criterion.value}
                                </when>
                                <when test="criterion.betweenValue">
                                    and ${r'${'}criterion.condition} ${r'#{'}criterion.value} and ${r'#{'}criterion.secondValue}
                                </when>
                                <when test="criterion.listValue">
                                    and ${r'${'}criterion.condition}
                                    <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                                    ${r'#{'}listItem}
                                    </foreach>
                                </when>
                            </choose>
                        </foreach>
                    </trim>
                </if>
            </foreach>
        </where>
    </sql>
    <sql id="BaseSql">
        <#list propertyList as property>
            ${property.columnName}<#if property_has_next>,</#if>
        </#list>
    </sql>
    <select id="getByExample" parameterType="${examplePackage}.${domain}Example" resultMap="BaseMap">
        select
        <if test="distinct">
            distinct
        </if>
        <include refid="BaseSql" />
        from ${tableName}
        <if test="_parameter != null">
            <include refid="Example_Where_Clause" />
        </if>
        <if test="orderByClause != null">
            order by ${r'${'}orderByClause}
        </if>
        <if test="limit != null">
            <if test="offset != null">
                limit ${r'${'}offset}, ${r'${'}limit}
            </if>
            <if test="offset == null">
                limit ${r'${'}limit}
            </if>
        </if>
    </select>
    <select id="getById" resultMap="BaseMap">
        select
        <include refid="BaseSql" />
        from ${tableName}
        where id = ${r'#{'}id}
    </select>

    <insert id="insert" parameterType="${domainPackage}.${domain}" useGeneratedKeys="true" keyProperty="id">
        insert into system_wallet (<include refid="BaseSql"/>)
        values (
        <#list propertyList as property>
        ${r'#{'}${property.name}}<#if property_has_next>,</#if>
        </#list>
        )
    </insert>

    <insert id="insertBatch" parameterType="java.util.List" useGeneratedKeys="true" keyProperty="id">
        insert into system_wallet (<include refid="BaseSql"/>)
        values
        <foreach collection="list" item="record" separator=",">
        (
        <#list propertyList as property>
            ${r'#{record.'}${property.name}}<#if property_has_next>,</#if>
        </#list>
        )
        </foreach>
    </insert>

    <select id="countByExample" parameterType="${examplePackage}.${domain}Example" resultType="java.lang.Long">
        select count(1) from ${tableName}
        <if test="_parameter != null">
            <include refid="Example_Where_Clause" />
        </if>
    </select>

    <update id="updateByExample" parameterType="map">
        update ${tableName}
        <#list propertyList as property>
        set ${property.columnName} = ${r'#{record.'}${property.name}${r'}'}<#if property_has_next>,</#if>
        </#list>
        <if test="_parameter != null">
            <include refid="Update_By_Example_Where_Clause" />
        </if>
    </update>

    <update id="updateById">
        update ${tableName}
        <#list propertyList as property>
        set ${property.columnName} = ${r'#{record.'}${property.name}${r'}'}<#if property_has_next>,</#if>
        </#list>
        where id = ${r'#{id}'}
    </update>
</mapper>