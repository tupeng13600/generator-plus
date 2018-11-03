package com.mybatis.plus.context;

public class DataSourceConfig {

    private String ip;

    private String port;

    private String databasename;

    private String username;

    private String password;

    public DataSourceConfig(String ip, String port, String databasename, String username, String password) {
        this.ip = ip;
        this.port = port;
        this.databasename = databasename;
        this.username = username;
        this.password = password;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getDatabasename() {
        return databasename;
    }

    public void setDatabasename(String databasename) {
        this.databasename = databasename;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
