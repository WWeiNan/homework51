package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.security.PublicKey;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    PageBean pageBean=new PageBean();
//    用户注册
    public void  regist(User user){
        userDao.regist(user);
    }
//    用户登录
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User userLogin(String username,String password){
        User user = userDao.userLogin(username, password);
        return user;
    }
//    查询所有用户
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageBean findAllUser(Integer count, Integer currentPage, HttpSession session){
//        先判断是否登陆后分页查询所有
        Integer loginStatus=(Integer)session.getAttribute("loginStatus");
        if(loginStatus!=null){
            //如果是从登录页面跳转的查询所有信息，那么默认每页显示5条数据
            count=5;
            session.removeAttribute("loginStatus");
        }else{
            //不是从登录页面跳转的查询所有，那么就要再判断是否勾选过每页展示条数
            if(count==null){
//                如果没有勾选过每页展示条数的话，再判断之前是否勾选过
                if(session.getAttribute("count")!=null) {
                    count = (Integer) session.getAttribute("count");
                    currentPage = (Integer) session.getAttribute("currentPage");
                }else {
                    count=5;
                }
            }else {
                session.setAttribute("count",count);
                session.setAttribute("currentPage",currentPage);
            }
        }
        if(count==null){
            count=5;
        }else {
            count=count;
        }
        pageBean.setCurrentPage(currentPage);
        pageBean.setCount(count);
        //查询出总用户数
        Integer totalCount = userDao.findTotalCount();
        pageBean.setTotalCount(totalCount);
        //求出总页数                  Math.ceil(Long l)    向上取整，参数为Long类型的数据
        Integer totalPage= (int)Math.ceil(1.0*totalCount/count);
        pageBean.setTotalPage(totalPage);
        //算出分页查询所需的数据：起始索引
        Integer index=(currentPage-1)*count;
        List<User> list = userDao.queryAllUser(index, count);
        pageBean.setUserList(list);
        return pageBean;

    }
//    根据用户名删除用户
    public  void delUser(String username){
        userDao.delUser(username);
    }
//    修改用户状态
    public  void changeUserStatus(String username,String userStatus){
        userDao.changeUserStatus(username,userStatus);
    }
//    根据用户名查询用户
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public  User selectByUsername(String username){
        User user = userDao.selectByUsername(username);
        return user;
    }
//    修改用户信息
    public void updateUser(User user){
        userDao.updateUser(user);
    }
//    模糊查询用户信息
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public PageBean findLikeUsername(String username,Integer count,Integer currentPage){
        if(count==null){
            count=5;
        }
        pageBean.setCurrentPage(currentPage);
        pageBean.setCount(count);
        //查询出模糊查询结果的总用户数
        Integer totalCount = userDao.findLikeUsername(username).size();
        pageBean.setTotalCount(totalCount);
        //求出模糊总页数                  Math.ceil(Long l)    向上取整，参数为Long类型的数据
        Integer totalPage= (int)Math.ceil(1.0*totalCount/count);
        pageBean.setTotalPage(totalPage);
        //算出分页查询所需的数据：起始索引
        Integer index=(currentPage-1)*count;
        List<User> list = userDao.queryLike(index, count, username);
        pageBean.setUserList(list);
        return pageBean;
    }
}
