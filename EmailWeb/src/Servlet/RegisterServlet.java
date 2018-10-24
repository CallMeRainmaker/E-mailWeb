package Servlet;

import Dao.UserDao;
import Model.User;

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
        }else if("forgetPassword".equals(method)){
            forgetPassword(request,response);
        }else if("toForgetView".equals(method)){
            toForgetView(request,response);
        }
    }

    private void toForgetView(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/forgetPassword.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void forgetPassword(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("Name");
        String mobile = request.getParameter("Mobile");
        String password = request.getParameter("Password");
        response.setCharacterEncoding("UTF-8");
        UserDao userDao = new UserDao();
        User user = userDao.Select(name);
        if(user != null) {
            if (user.getMobile().equals(mobile)) {
                if(!user.getPassword().equals(password)){
                    if (userDao.ForgetPassword(name, password)) {
                        try {
                            response.getWriter().write("success");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }else {
                    try {
                        response.getWriter().write("新密码与原密码不能相同");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                try {
                    response.getWriter().write("预留电话不正确，请重试");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }else{
            try {
                response.getWriter().write("此邮箱不存在，请输入正确邮箱");
            } catch (IOException e) {
                e.printStackTrace();
            }
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
        String mobile = request.getParameter("Mobile");
        String password = request.getParameter("Password");
        UserDao userDao = new UserDao();
        User user = userDao.Select(name);
        if(user == null){
            if(userDao.Register(name,mobile,password)){
                try {
                    response.getWriter().write("success");
                } catch (IOException e) {
                    e.printStackTrace();
                }
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
