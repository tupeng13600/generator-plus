package ${mapperPackage}.base;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 *
 * 该文件无需手动修改，若表变更，运行一次Generator即可，会自动刷新
 *
 */
public interface BaseMapper<D, E> {

    long countByExample(E example);

    int insert(D domain);

    int insertBatch(@Param("list")List<D> domain);

    List<D> getByExample(E example);

    D getById(@Param("id") Integer id);

    int updateByExample(@Param("record") D domain, @Param("example") E example);

    int updateById(D record);

}