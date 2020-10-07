package com.czu.util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * JDBC工具类 使用Durid连接池
 */
public class JDBCUtils {

    private static DruidDataSource datasource ;

    static {

        try {
            datasource = new DruidDataSource();

            datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
            datasource.setUrl("jdbc:mysql://localhost:3306/mms?characterEncoding=utf-8&serverTimezone=UTC");
            datasource.setUsername("root");
            datasource.setPassword("root");
            //2.初始化连接池对象


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接池对象
     */
    public static DataSource getDataSource(){
        return datasource;
    }


    /**
     * 获取连接Connection对象
     */
    public static Connection getConnection() throws SQLException {
        return  datasource.getConnection();
    }
}