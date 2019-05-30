package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
//    管理员登录
    Admin adminLogin(@Param("username") String  username, @Param("password") String password);
}
