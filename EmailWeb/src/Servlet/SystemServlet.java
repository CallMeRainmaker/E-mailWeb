package Servlet;

import Dao.UserDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SystemServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String method = request.getParameter("method");
        if("toSystemView".equals(method)){
            toSystemView(request,response);
        }else if("PersonView".equals(method)){
            PersonView(request,response);
        }else if("EditPassword".equals(method)){
            EditPassword(request,response);
        }
    }

    private void EditPassword(HttpServletRequest request, HttpServletResponse response) {
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        User user = (User)request.getSession().getAttribute("user");
        response.setCharacterEncoding("UTF-8");
        UserDao userDao = new UserDao();
        if(user.getPassword().equals(password)){
            if(userDao.EditPassword(user,newpassword)){
                try {
                    response.getWriter().write("success");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                try {
                    response.getWriter().write("数据库修改错误");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }else{
            try {
                response.getWriter().write("原密码错误");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void PersonView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/editPassword.jsp").forward(request,response);
    }

    private void toSystemView(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/system.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
