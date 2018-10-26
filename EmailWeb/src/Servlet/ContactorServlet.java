package Servlet;

import Dao.UserDao;
import Model.User;
import net.sf.json.JSONArray;
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

public class ContactorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("ContactorView".equals(method)) {
            ContactorView(request,response);
        }else if("getUserList".equals(method)){
            getUserList(request,response);
        }else if("GetUserList".equals(method)){
            GetUserList(request,response);
        }
    }

    private void GetUserList(HttpServletRequest request, HttpServletResponse response) {
        UserDao userDao = new UserDao();
        try {
            List<User> users = userDao.GetUserList();
            try {
                response.getWriter().write(JSONArray.fromObject(users).toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        UserDao userDao = new UserDao();
        User user = new User();
        user.setName(name);
        user.setMobile(mobile);
        try {
            List<User> users = userDao.getUserList(user);
            Map<String,Object> ret = new HashMap<>();
            ret.put("rows",users);
            response.setCharacterEncoding("UTF-8");
            try {
                    response.getWriter().write(JSONObject.fromObject(ret).toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void ContactorView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/Contactor.jsp").forward(request,response);
    }
}
