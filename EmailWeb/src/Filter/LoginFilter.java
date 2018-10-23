package Filter;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void destroy(){

    }

    public void doFilter(ServletRequest req, ServletResponse rep,FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)rep;
        Object user = request.getSession().getAttribute("user");
        if(user == null){
                response.sendRedirect("index.jsp");
        }else{
            filterChain.doFilter(request,response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {

    }
}
