package Servlet;

import Dao.UserDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        String method = request.getParameter("method");
        if("Login".equals(method)){
            login(request,response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("Name");
        String password = request.getParameter("Password");
        UserDao userDao = new UserDao();
        User user = userDao.Login(name,password);
        if(user == null){
            try {
                response.getWriter().write("loginError");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.getWriter().write("user");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
