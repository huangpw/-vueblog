package com.vueblog.service.impl;

import com.vueblog.entity.Blog;
import com.vueblog.mapper.BlogMapper;
import com.vueblog.service.BlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author AlbertHPW
 * @since 2024-08-25
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

}
