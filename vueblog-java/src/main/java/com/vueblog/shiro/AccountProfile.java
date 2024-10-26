package com.vueblog.shiro;

import lombok.Data;

import java.io.Serializable;

/**
 * @author AlbertHPW
 * @Date: 2024/8/26 23:37
 */
@Data
public class AccountProfile implements Serializable {

    private Long id;

    private String username;

    private String avatar;

    private String email;

}
