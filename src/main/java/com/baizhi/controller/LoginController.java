package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.entity.User;
import com.baizhi.service.AdminService;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public String login(HttpSession session, String role, String username, String password){
        if("user".equals(role)){
            User loginUser = userService.userLogin(username, password);
            if("激活".equals(loginUser.getUserStatus())){
                session.setAttribute("loginUser",loginUser);
                session.setAttribute("loginRole","普通用户");
                return "redirect:/userlist.jsp";
            }else {
                return "redirect:/login.jsp";
            }

        }else{
            Admin admin = adminService.adminLogin(username, password);
            if (admin !=null) {
                session.setAttribute("loginAdmin", admin);
                session.setAttribute("loginRole", "管理员");
                session.setAttribute("loginStatus",1);
                return "redirect:/user/findAllUser.do";
            }else {
                return "redirect:/login.jsp";
            }
        }
    }
}
