package filter;

import entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * @author yangxin
 * @time 2019/1/2  13:46
 */
@WebFilter
public class LoginFilter implements Filter {
    Logger log = LoggerFactory.getLogger(LoginFilter.class);
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("拦截器初始化完成");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        log.info("进入过滤器处理");
        HttpServletRequest httpRequest =(HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        String uri = httpRequest.getRequestURI();
        if(uri.contains("login")||uri.contains("register")||uri.contains("AdminLogin")){
            filterChain.doFilter(servletRequest, servletResponse);
        }else{
            HttpSession session =httpRequest.getSession();
            User user =(User) session.getAttribute("user");
            if(null==user){
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
            Map<Integer, Object> loginMap = (Map<Integer, Object>)httpRequest.getSession().getServletContext().getAttribute("loginMap");
            if(loginMap.get((int)user.getUserId())!=httpRequest.getSession().getId()){
                httpRequest.getSession().removeAttribute("user");
                httpResponse.sendRedirect("/user/index.html");
            }else{
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
