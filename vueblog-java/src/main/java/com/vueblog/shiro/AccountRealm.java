package com.vueblog.shiro;

import cn.hutool.core.bean.BeanUtil;
import com.vueblog.entity.User;
import com.vueblog.service.UserService;
import com.vueblog.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Author: AlbertHPW
 * @Date: 2024/8/26 23:37
 */
@Slf4j
@Component
public class AccountRealm extends AuthorizingRealm {

    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    UserService userService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /**
     * 登录处理
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        JwtToken jwt  = (JwtToken) token;
        // 获取用户Id
        String userId = jwtUtils.getClaimByToken((String) jwt.getPrincipal()).getSubject();

        User user = userService.getById(Long.parseLong(userId));
        // 如果用户不存在，则抛出账户不存在异常
        if(user == null) {
            throw new UnknownAccountException("账户不存在");
        }
        // 如果用户状态为锁定状态（状态为-1），则抛出账户已被锁定异常
        if (user.getStatus() == -1) {
            throw new LockedAccountException("账户已被锁定");
        }
        // 将User对象的属性复制到AccountProfile对象
        AccountProfile profile = new AccountProfile();
        BeanUtil.copyProperties(user, profile);
        // 返回SimpleAuthenticationInfo对象，包含认证信息
        return new SimpleAuthenticationInfo(profile, jwt.getCredentials(), getName());
    }
}
