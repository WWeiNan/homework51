package com.baizhi.dao;

import com.baizhi.entity.User;
import com.baizhi.util.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    // 用户注册
    void regist(User user);
    //登录
    User userLogin(@Param("username") String username, @Param("password") String password);
    //分页查询所有的用户
    List<User> queryAllUser(@Param("index")Integer index, @Param("count") Integer count);
    //查询总的用户的条数
    Integer findTotalCount();
    //根据用户名删除用户
    void  delUser(String username);
//    修改用户状态
    void changeUserStatus(@Param("username") String username,@Param("userStatus")String userStatus);
//    根据用户名查询用户
    User selectByUsername(String username);
//    修改用户信息
    void updateUser(User user);
//    模糊查询用户信息
    List<User> findLikeUsername(String username);
//    模糊查询分页
    List<User> queryLike(@Param("index")Integer index, @Param("count") Integer count,@Param("username") String username);
}
