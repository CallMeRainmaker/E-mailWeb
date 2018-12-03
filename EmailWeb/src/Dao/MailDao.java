package Dao;

import Model.Mail;
import Model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MailDao extends BaseDao{
    public boolean sendMail(User user, Mail mail){
        String sql = "insert into send_mail values(null,'"+user.getName()+"'," +
                "'"+mail.getAccept_name()+"','"+mail.getTheme()+"'," +
                "'"+mail.getContent()+"','"+mail.getTime()+"')";
        return update(sql);
    }

    public List<Mail> getSendMailList(User user) throws SQLException {
        String sql = "select * from send_mail where send_name = '"+user.getName()+"'";
        ResultSet resultSet = query(sql);
        List<Mail> mailList = new ArrayList<>();
        if(resultSet.next()){
            Mail mail = new Mail();
            mail.setId(resultSet.getInt("id"));
            mail.setAccept_name(resultSet.getString("accept_name"));
            mail.setTheme(resultSet.getString("theme"));
            mail.setTime(resultSet.getString("time"));
            mailList.add(mail);
        }
        return mailList;
    }

    public List<Mail> getMailList(User user) throws SQLException {
        String sql = "select * from accept_mail where accept_name = '"+user.getName()+"'";
        ResultSet resultSet = query(sql);
        List<Mail> mailList = new ArrayList<Mail>();
        while(resultSet.next()){
           Mail mail = new Mail();
           mail.setId(resultSet.getInt("id"));
           mail.setSend_name(resultSet.getString("send_name"));
           mail.setTheme(resultSet.getString("theme"));
           mail.setTime(resultSet.getString("time"));
           mailList.add(mail);
        }
        return mailList;
    }

    public Mail getMailContent(String id) throws SQLException {
        String sql = "select * from mail where id =" + id;
        ResultSet resultSet = query(sql);
        Mail mail = new Mail();
        if(resultSet.next()){
            mail.setAccept_name(resultSet.getString("accept_name"));
            mail.setTheme(resultSet.getString("theme"));
            mail.setContent(resultSet.getString("content"));
        }
        return mail;
    }

    public boolean deleteMailFromAccept(String string){
        String sql = "delete from accept_mail where id in("+string+")";
        return update(sql);
    }

    public boolean deleteMailFromSend(String string){
        String sql = "delete from send_mail where id in("+string+")";
        return update(sql);
    }
}
