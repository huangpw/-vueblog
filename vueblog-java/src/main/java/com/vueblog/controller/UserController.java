package com.vueblog.controller;


import com.vueblog.common.lang.Result;
import com.vueblog.entity.User;
import com.vueblog.service.UserService;
import com.vueblog.utils.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author AlbertHPW
 * @since 2024-08-25
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequiresAuthentication
    @GetMapping("/index")
    public Result index() {
        User user = userService.getById(1);
        return Result.success(200, "操作成功", user);
    }

    @PostMapping("/save")
    public Result save(@Validated @RequestBody User user) {

        return Result.success(user);
    }

    @RequiresAuthentication
    @GetMapping("/detail")
    public Result detail() {
        Long id = ShiroUtils.getProfile().getId();
        User user = userService.getById(id);
        user.setPassword(null);
        return Result.success(user);
    }

}
