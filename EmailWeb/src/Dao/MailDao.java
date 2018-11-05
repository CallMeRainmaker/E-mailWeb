package Dao;

import Model.Mail;
import Model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MailDao extends BaseDao{
    public boolean sendMail(User user, Mail mail){
        String sql = "insert into mail values(null,'"+user.getName()+"'," +
                "'"+mail.getAccept_name()+"','"+mail.getTheme()+"'," +
                "'"+mail.getContent()+"','"+mail.getTime()+"')";
        return update(sql);
    }

    public List<Mail> getMailList(User user) throws SQLException {
        String sql = "select * from mail where accept_name = '"+user.getName()+"'";
        ResultSet resultSet = query(sql);
        List<Mail> mailList = new ArrayList<Mail>();
        if(resultSet.next()){
           Mail mail = new Mail();
           mail.setId(resultSet.getInt("id"));
           mail.setSend_name(resultSet.getString("send_name"));
           mail.setTheme(resultSet.getString("theme"));
           mail.setTime(resultSet.getString("time"));
           mailList.add(mail);
        }
        return mailList;
    }
}
