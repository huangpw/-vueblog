package com.vueblog.utils;

import com.vueblog.shiro.AccountProfile;
import org.apache.shiro.SecurityUtils;

/**
 * @author AlbertHPW
 */
public class ShiroUtils {

    public static AccountProfile getProfile() {
        return (AccountProfile) SecurityUtils.getSubject().getPrincipal();
    }

}
