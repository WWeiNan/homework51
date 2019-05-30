package com.baizhi.service;

import com.baizhi.entity.User;
import com.baizhi.util.PageBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
//    用户注册
    void regist(User user);
//    用户登录
    User userLogin(String username, String password);
//    查询所有用户
    PageBean findAllUser(Integer count, Integer currentPage, HttpSession session);
//根据用户名删除用户
    void delUser(String username);
//    修改用户状态
    void  changeUserStatus(String username,String userStatus);
//    根据用户名查询用户
    User selectByUsername(String username);
//    修改用户信息
    void updateUser(User user);
//    模糊查询用户信息
    PageBean findLikeUsername(String username,Integer count,Integer currentPage);
}

