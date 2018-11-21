package Servlet;

import Dao.MailDao;
import Model.Mail;
import Model.User;
import Util.TimeUtil;
import net.sf.json.JSON;
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

public class SendMailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response){
        String method = request.getParameter("method");
        if("SendMailView".equals(method)){
            SendMailView(request,response);
        }else if("sendMail".equals(method)){
            sendMail(request,response);
        }
    }



    private void sendMail(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String theme = request.getParameter("theme");
        String content = request.getParameter("content");
        User user = (User)request.getSession().getAttribute("user");
        Mail mail = new Mail();
        mail.setAccept_name(name);
        mail.setTheme(theme);
        mail.setContent(content);
        mail.setTime(TimeUtil.getTime());
        MailDao mailDao = new MailDao();
        if(mailDao.sendMail(user,mail)){
            try {
                HttpSession session = request.getSession();
                session.setAttribute("mail",mail);
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("sendError");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void SendMailView(HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = request.getParameter("name");
            HttpSession session = request.getSession();
            session.setAttribute("name",name);
            request.getRequestDispatcher("view/sendMail.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
