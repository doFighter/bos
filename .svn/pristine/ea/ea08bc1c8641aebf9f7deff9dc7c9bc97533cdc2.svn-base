package com.itheima.bos.dao;

import com.itheima.bos.dao.base.IBaseDao;
import com.itheima.bos.entity.User;

public interface IUserDao extends IBaseDao<User> {
    User findUserByNameAndPwd(String username, String password);

    void updateUser(User user);

    User findUserByName(String username);
}