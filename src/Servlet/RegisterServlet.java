package Servlet;

import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        String method = request.getParameter("method");
        if("Register".equals(method)){
            register(request,response);
        }else if("toRegisterView".equals(method)){
            toRegisterView(request,response);
        }
    }

    private void toRegisterView(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/register.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("Name");
        String password = request.getParameter("Password");
        UserDao userDao = new UserDao();
        if(userDao.Register(name,password)){
            try {
                response.getWriter().write("success");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("registerError");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
