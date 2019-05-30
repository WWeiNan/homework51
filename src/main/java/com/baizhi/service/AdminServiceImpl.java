package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;
//    管理员登录
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Admin adminLogin(String username,String password){
        Admin admin = adminDao.adminLogin(username, password);
        return admin;
    }
}
