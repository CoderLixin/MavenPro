package com.wlx.shop.dbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author wanglixin
 * @create 2020-02-06 11:13
 */
public class DatabaseConnection {
    private static final String DBDRIVE = "com.mysql.jdbc.Driver";
    private static final String DBURL = "jdbc:mysql://localhost:3306/mshop";
    private static final String DBUSER = "root";
    private static final String DBPASSWORD = "@wlx1010001";

    private Connection conn = null;//保存连接对象

    /**
     * 构造方法的主要目的是进行数据库连接，只要在程序之中实例化了DatabaseConnection对象
     * 那么就表示要进行数据库的连接操作了，所以在构造方法之中连接数据库
     * 在本构造方法之中，如果出现了异常，将直接输出异常信息，因为如果数据库连接都没有了，根本就无法操作
     */
    public DatabaseConnection() {
        try {
            Class.forName(DBDRIVE);
            this.conn= DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
        }  catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 取得一个数据库连接对象，这个对象在构造方法中取得
     * @return Connection接口对象
     */
    public Connection getConnection() {
        return this.conn;
    }

    /**
     * 关闭连接，不管是否连接上，执行此操作都不会出错
     */
    public void close(){
        if (this.conn!=null) {// 取得连接
            try { //关闭连接
                this.conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
