package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    private PageBean pageBean;
//    用户注册
    @RequestMapping("/regist")
    public  String regist(User user){
        user.setUserStatus("冻结");
        userService.regist(user);
        return "redirect:/login.jsp";
    }
//    分页查询所有用户
    @RequestMapping("/findAllUser")
    public String  findAllUser(Integer count, HttpSession session,Integer  currentPage){
        if(session.getAttribute("findLike")!=null){
            session.removeAttribute("findLike");
        }
        session.setAttribute("selectAll","2");
        if(currentPage==null){
            currentPage=1;
        }
        pageBean = userService.findAllUser(count,currentPage,session);
        session.setAttribute("pageBean",pageBean);
        System.out.println("===================");
        return "redirect:/admin.jsp";
    }
//    删除User
    @RequestMapping("/delUser")
    public  String delUser(String username){
        userService.delUser(username);
        return "redirect:/user/findAllUser.do";
    }
//    修改用户状态
    @RequestMapping("/changeUserStatus")
    public String changeUserStatus(String username,String userStatus){
        userService.changeUserStatus(username,userStatus);
        return "forward:/user/findAllUser.do";
    }
//    根据用户名查询用户
    @RequestMapping("/selectByUsername")
    @ResponseBody
    public  User selectByUsername(String username,HttpSession session){
        User user = userService.selectByUsername(username);
        return user;
    }
    //修改用户信息
    @RequestMapping("/updateUser")
    public  String updateUser(User user){
        userService.updateUser(user);
        return "redirect:/user/findAllUser.do";
    }
//    添加用户信息
    @RequestMapping("/addUser")
    public String addUser(User user){
        System.out.println(user);
        userService.regist(user);
        return "redirect:/user/findAllUser.do";
    }
    //模糊查询用户
    @RequestMapping("/findLikeUsername")
    public String findLikeUsername(String username,HttpSession session,Integer count,Integer currentPage){
        System.out.println(username+"============"+count);
        if(session.getAttribute("selectAll")!=null){
            session.removeAttribute("selectAll");
        }
//        默认首页为第一页
        if(currentPage==null){
            currentPage=1;
        }
//        如果什么都没传过来，默认查询所有用户
        if(username==null &&count==null){
            return "redirect:/user/findAllUser.do";
        }else {
//          每页条数count为空的时候，说明是刚刚模糊查询过，未选择每页展示条数
            if(count==null){
                session.setAttribute("likeUsername",username);
            }else{
                username=(String)session.getAttribute("likeUsername");
            }
            pageBean= userService.findLikeUsername(username,count,currentPage);
            session.setAttribute("queryLike", pageBean);
            session.setAttribute("findLike", "1");
            return "redirect:/admin.jsp";
        }
    }
}
