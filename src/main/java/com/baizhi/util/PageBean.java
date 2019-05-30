package com.baizhi.util;

import com.baizhi.entity.User;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T>{
//    当前页数
    private Integer currentPage;
//    每页显示的条数
    private Integer count;
//    总条数
    private  Integer totalCount;
    //总页数
    private  Integer totalPage;
    //每页显示的数据
    private List<T> userList=new ArrayList<T>();

    public PageBean() {
    }

    public PageBean(Integer currentPage, Integer count, Integer totalCount, Integer totalPage, List<T> userList) {
        this.currentPage = currentPage;
        this.count = count;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.userList = userList;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getUserList() {
        return userList;
    }

    public void setUserList(List<T> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", count=" + count +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", userList=" + userList +
                '}';
    }
}
