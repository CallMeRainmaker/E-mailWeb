package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
    private String DBUrl = "jdbc:mysql://localhost:3306/Email?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    private String DBUser = "root";
    private String DBPassword = "19971008";
    private String jdbcName = "com.mysql.jdbc.Driver";
    private Connection connection = null;
    public Connection getConnection(){
        try {
            Class.forName(jdbcName);
            connection = DriverManager.getConnection(DBUrl,DBUser,DBPassword);
            System.out.println("数据库连接成功");
        } catch (Exception e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        }
        return connection;
    }
    public static void main(String[] args){
        DbUtil dbUtil = new DbUtil();
        dbUtil.getConnection();
    }
}
