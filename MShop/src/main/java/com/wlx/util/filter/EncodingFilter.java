package com.wlx.util.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
/**
 * @author wanglixin
 * @create 2020-02-06 12:26
 */
@WebFilter(filterName = "encodingFilter",urlPatterns = "/*")
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request,response);
        response.setCharacterEncoding("UTF-8");
    }

    @Override
    public void destroy() {

    }
}
