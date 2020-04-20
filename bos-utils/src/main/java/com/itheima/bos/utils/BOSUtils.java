package com.itheima.bos.utils;

import com.itheima.bos.entity.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 *  BOS 项目的工具类
 */
public class BOSUtils {
    // 获取 session 对象
    public static HttpSession getSession(){
        return ServletActionContext.getRequest().getSession();
    }
    // 获取 user 对象
    public static User getLoginUser(){
        return (User) getSession().getAttribute("loginUser");
    }
}
