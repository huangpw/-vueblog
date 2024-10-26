package com.vueblog.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @Author: AlbertHPW
 * @Date: 2024/8/27 0:01
 */
public class JwtToken implements AuthenticationToken {
    private String token;
    public JwtToken(String token) {
        this.token = token;
    }
    @Override
    public Object getPrincipal() {
        return token;
    }
    @Override
    public Object getCredentials() {
        return token;
    }
}
