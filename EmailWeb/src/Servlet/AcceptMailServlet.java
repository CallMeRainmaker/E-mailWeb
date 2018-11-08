package Servlet;

import Dao.MailDao;
import Model.Mail;
import Model.User;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AcceptMailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if("AcceptMailView".equals(method)){
            AcceptMailView(request,response);
        }else if("mailList".equals(method)){
            try {
                mailList(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if("deleteMail".equals(method)){
            deleteMail(request,response);
        }
    }

    private void deleteMail(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("ids[]");
        String idStr = "";
        for(String id:ids){
            idStr +=  id + ",";
        }
        idStr = idStr.substring(0,idStr.length()-1);
        MailDao mailDao = new MailDao();
        if(mailDao.deleteMail(idStr)){
            try {
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                response.getWriter().write("deleteError");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void AcceptMailView(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/MailList.jsp").forward(request,response);
    }

    private void mailList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        MailDao mailDao = new MailDao();
        User user = (User)request.getSession().getAttribute("user");
        List<Mail> mailList = mailDao.getMailList(user);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",mailList);
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(JSONObject.fromObject(map).toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
