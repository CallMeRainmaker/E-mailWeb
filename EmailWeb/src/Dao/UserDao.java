package Dao;

import Model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public User Select(String name){
        String sql = "select * from user where name = '"+name+"'";
        ResultSet resultSet = query(sql);
        try {
            if(resultSet.next()){
                User user = new User();
                user.setName(resultSet.getString("name"));
                user.setMobile(resultSet.getString("mobile"));
                user.setPassword(resultSet.getString("password"));
                return user;
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getUserList() throws SQLException {
        String sql = "select * from user";
        List<User> users = new ArrayList<User>();
        ResultSet resultSet = query(sql);
        while(resultSet.next()){
            User user = new User();
            user.setId(resultSet.getInt("id"));
            user.setMobile(resultSet.getString("mobile"));
            user.setName(resultSet.getString("name"));
            users.add(user);
        }
        return users;
    }

    public boolean Register(String name,String mobile,String password){
        String sql = "insert  into user values(null,'"+name+"','"+mobile+"','"+password+"')";
        return update(sql);
    }

    public boolean EditPassword(User user,String password){
        String sql = "update user set password = '"+password+"' where id = "+user.getId();
        return update(sql);
    }

    public boolean ForgetPassword(String name,String password){
        String sql = "update user set password = '"+password+"' where name = '"+name+"'";
        return update(sql);
    }
}
