package Servlet;

import Dao.MailDao;
import Model.Mail;
import Model.User;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        }else if("MailContentView".equals(method)){
            MailContentView(request,response);
        }else if("DeleteMail".equals(method)){
            DeleteMail(request,response);
        }
    }

    private void DeleteMail(HttpServletRequest request, HttpServletResponse response) {
        Mail mail = (Mail)request.getSession().getAttribute("mail");
        MailDao mailDao = new MailDao();
        if(mailDao.DeleteMailFromAccept(mail.getId())){
            try {
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("error");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void MailContentView(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("id");
            MailDao mailDao = new MailDao();
            Mail mail = mailDao.getMailContentFromAccept(id);
            HttpSession session = request.getSession();
            session.setAttribute("mail",mail);
            request.getRequestDispatcher("view/AcceptMailContent.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
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
        String from = request.getParameter("from");
        if("accept".equals(from)){
            if(mailDao.deleteMailFromAccept(idStr)){
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
        }else if("send".equals(from)){
            if(mailDao.deleteMailFromSend(idStr)){
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

    }

    public void AcceptMailView(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/AcceptMailList.jsp").forward(request,response);
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
