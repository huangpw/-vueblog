package com.vueblog.shiro;

import cn.hutool.json.JSONUtil;
import com.vueblog.common.lang.Result;
import com.vueblog.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.web.filter.authc.AuthenticatingFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: AlbertHPW
 * @Date: 2024/8/26 23:56
 */
@Component
public class JwtFilter extends AuthenticatingFilter {


    @Autowired
    JwtUtils jwtUtils;

    /**
     * 创建JwtToken对象
     * @param servletRequest 请求
     * @param servletResponse 响应
     * @return
     * @throws Exception
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        // 将传入的通用Servlet请求对象转换为HttpServletRequest对象，以便获取请求中的JWT令牌
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        // 从请求头中获取JWT令牌
        String jwt = request.getHeader("Authorization");
        // 检查获取到的JWT令牌是否为空或无效
        if(StringUtils.isEmpty(jwt)) {
            // 如果JWT令牌为空或无效，返回null
            return null;
        }
        // 返回一个新的JwtToken对象，封装了验证和解析后的JWT令牌
        return new JwtToken(jwt);
    }

    /**
     * 拦截请求
     * @param servletRequest 请求
     * @param servletResponse 响应
     * @return
     * @throws Exception
     */
    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        // 将传入的通用Servlet请求对象转换为HttpServletRequest对象，以便获取请求中的JWT令牌
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        // 从请求头中获取JWT令牌
        String jwt = request.getHeader("Authorization");
        // 检查获取到的JWT令牌是否为空或无效
        if(StringUtils.isEmpty(jwt)) {
            return true;
        } else {
            // 校验jwt
            Claims claim = jwtUtils.getClaimByToken(jwt);
            if(claim == null || jwtUtils.isTokenExpired(claim.getExpiration())) {
                throw new ExpiredCredentialsException("token已失效，请重新登录");
            }

            // 执行登录
            return executeLogin(servletRequest, servletResponse);
        }
    }

    /**
     * 登录失败
     * @param token
     * @param e
     * @param request
     * @param response
     * @return
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        Throwable throwable = e.getCause() == null ? e : e.getCause();
        Result result = Result.fail(throwable.getMessage());
        String json = JSONUtil.toJsonStr(request);

        try {
            httpServletResponse.getWriter().print(json);
        } catch (IOException ioException) {

        }
        return false;
    }

    /**
     * 跨域处理
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {

        HttpServletRequest httpServletRequest = WebUtils.toHttp(request);
        HttpServletResponse httpServletResponse = WebUtils.toHttp(response);
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", httpServletRequest.getHeader("Access-Control-Request-Headers"));
        // 跨域时会首先发送一个OPTIONS请求，这里我们给OPTIONS请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(org.springframework.http.HttpStatus.OK.value());
            return false;
        }

        return super.preHandle(request, response);
    }
}
