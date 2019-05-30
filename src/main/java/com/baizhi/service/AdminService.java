package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
//    管理员登录
    Admin adminLogin(String username,String password);
}
