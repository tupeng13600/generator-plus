# generator-plus
mybatis 逆向生成工具

**使用方式：
```
    <dependencies>
        <dependency>
            <groupId>com.mybatis.plus</groupId>
            <artifactId>generator-plus</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
```
**最最简单的使用实例
```
public class TestGenertor {

    // 这是简单的例子，当然你也可以指定你的对象的包名或者mapper包名等，如下写法会数据库所有的表都逆向生成，当然你也可以自己添加需要操作的表
    //.addTable("想要操作的表")
    public static void main(String[] args) {
        Generator.build().ip("your ip")
                .port(port)
                .database("db name")
                .user("username")
                .password("password")
                .repositoryPackage("repository package") //仓库包名，Example：com.demo.repository
                .gernerate();
    }

}
```
**生成的包说明
```
// 假设你设定的repository的包路径为：com.demo.repository

- src/main/java

  - com.demo.repository  仓库包，该包跟路径包含了数据库的访问入口层 XxxxRepository
  
    - mapper    mapper，有基础功能提供，需要新增可以此新增方法
    
      -base     BaseMapper，用户无需关心
      
    - domain    数据库实体
    
      -example  对象模板
      
- src/main/resources

  -mapper sql资源文件
  

```
