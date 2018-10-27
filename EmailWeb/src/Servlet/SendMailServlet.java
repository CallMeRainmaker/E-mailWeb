package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SendMailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response){
        String method = request.getParameter("method");
        if("SendMailView".equals(method)){
            SendMailView(request,response);
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
