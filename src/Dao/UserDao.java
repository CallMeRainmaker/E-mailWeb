package Dao;

import Model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends BaseDao{
    public User Login(String name,String password){
        String sql = "select * from user where name = '" + name + "' and password = '"+ password +"' ";
        ResultSet resultSet = query(sql);
        try {
            if(resultSet.next()){
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setPassword(resultSet.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
