package com.generator.plus.util;

import com.generator.plus.constant.Str;
import com.generator.plus.context.DataSourceConfig;
import com.generator.plus.context.PlusContext;
import com.generator.plus.handler.TypeHandler;
import com.generator.plus.model.PropertyModel;

import java.io.Closeable;
import java.sql.*;
import java.util.*;

public class JDBCUtil implements Closeable {

    private static String tableNameQuery;

    private static String columnQueryPrifx;

    private static String url;

    private static String username;

    private static String password;

    private static Connection connection;

    private static Boolean isInit = false;

    private Statement statement;

    private ResultSet rs;

    private static List<String> tableNamePrefix;

    static {
        tableNamePrefix = Arrays.asList(Str.TABLE_PREFIX);
    }

    private JDBCUtil() {
    }

    public static JDBCUtil build(DataSourceConfig config) {
        if (isInit) {
            return new JDBCUtil();
        }
        isInit = true;
        JDBCUtil.username = config.getUsername();
        JDBCUtil.password = config.getPassword();
        JDBCUtil.url = "jdbc:mysql://".concat(config.getIp()).concat(":").concat(config.getPort()).concat("/")
                .concat(config.getDatabasename()).concat("?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&useSSL=false");
        JDBCUtil.tableNameQuery = "select table_name AS tableName from information_schema.tables where table_schema='"
                .concat(config.getDatabasename()).concat("'");
        JDBCUtil.columnQueryPrifx = "select column_name AS columnName,column_comment AS description,data_type AS dataType, column_default AS columnDefault from information_schema.columns where table_schema='"
                .concat(config.getDatabasename()).concat("'");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBCUtil.url, JDBCUtil.username, JDBCUtil.password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JDBCUtil();
    }

    private Set<String> getTableList() {
        Set<String> resultList = new HashSet<>();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(tableNameQuery);
            while (rs.next()) {
                resultList.add(rs.getString("tableName"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeStatement();
            closeRS();
        }
        return resultList;
    }

    public Map<String, List<PropertyModel>> getDomainList(Set<String> tableNames) {

        Map<String, List<PropertyModel>> resultMap = new HashMap<>();

        Set<String> tableNameList =
                (null == tableNames || tableNames.isEmpty())
                        ? getTableList() : tableNames;

        if (null == tableNameList || tableNameList.isEmpty()) {
            System.out.println("未找到表信息...");
            return resultMap;
        }

        for (String tableName : tableNameList) {
            getDomain(tableName, resultMap);
        }
        return resultMap;
    }

    private void getDomain(String tableName, Map<String, List<PropertyModel>> resultMap) {
        String columnQuerySuffix = "ORDER BY ordinal_position;";
        String queryString = columnQueryPrifx.concat("AND table_name = '").concat(tableName).concat("'").concat(columnQuerySuffix);
        List<PropertyModel> propertyModels = new ArrayList<>();
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery(queryString);
            while (rs.next()) {
                String columnName = rs.getString("columnName");
                String description = rs.getString("description");
                String dataType = rs.getString("dataType");
                String columnDefault = rs.getString("columnDefault");
                Class javaType = TypeHandler.handler(columnName, dataType);
                propertyModels.add(new PropertyModel(javaType, getFieldName(columnName), description, columnName, columnDefault, dataType));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeRS();
            closeStatement();
        }
        if (!propertyModels.isEmpty()) {
            String domain = getDomainName(tableName);
            resultMap.put(domain, propertyModels);
            PlusContext.add(domain, tableName);
        }
    }

    private void closeRS() {
        if (null != rs) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void closeStatement() {
        if (null != statement) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void closeConnection() {
        if (null != connection) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String getDomainName(String tableName) {
        tableName = clearTableTag(tableName);
        String[] tempList = tableName.split(Str.SQL_SPLIT);
        String result = Str.EMPTY;
        for (String temp : tempList) {
            result = result.concat(temp.substring(0, 1).toUpperCase()).concat(temp.substring(1));
        }
        return result;
    }

    private String getFieldName(String columnName) {
        String[] tempList = (columnName.startsWith(Str.IS_) ? columnName.replaceFirst(Str.IS_, Str.EMPTY) : columnName).split(Str.SQL_SPLIT);
        String result = Str.EMPTY;
        for (int i = 0; i < tempList.length; i++) {
            result = i == 0 ? result.concat(tempList[i])
                    : (tempList[i].length() > 1 ?
                    result.concat(tempList[i].substring(0, 1).toUpperCase()).concat(tempList[i].substring(1))
                    : result.concat(tempList[i].substring(0, 1).toUpperCase()));
        }
        return result;
    }

    private String clearTableTag(String tableName) {
        for (String namePrefix : tableNamePrefix) {
            if (tableName.startsWith(namePrefix)) {
                return tableName.replaceFirst(namePrefix, Str.EMPTY);
            }
        }
        return tableName;
    }

    @Override
    public void close() {
        closeRS();
        closeStatement();
        closeConnection();
    }

}
