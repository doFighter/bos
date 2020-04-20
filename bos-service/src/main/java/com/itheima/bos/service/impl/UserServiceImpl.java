package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IUserDao;
import com.itheima.bos.entity.Role;
import com.itheima.bos.entity.User;
import com.itheima.bos.service.IUserService;
import com.itheima.bos.utils.MD5Utils;
import com.itheima.bos.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;
    /**
     *  用户登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        // 密码要进行加密，使用MD5进行加密
//        String password = MD5Utils.md5(user.getPassword());
        String password = user.getPassword();

        return userDao.findUserByNameAndPwd(user.getUsername(),password);
    }

    /**
     *  更新用户密码
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    /**
     *  添加用户，同时关联角色
     * @param model
     * @param roleIds
     */
    @Override
    public void save(User model, String[] roleIds) {
        userDao.save(model);
        if (roleIds != null && roleIds.length > 0){
            for (String roleId:roleIds){
                // 手动构造托管对象
                Role role = new Role(roleId);
                // 使用用户对象关联角色对象
                model.getRoles().add(role);
            }
        }
    }

    /**
     *  查询用户
     * @param pageBean
     */
    @Override
    public void pageQuery(PageBean pageBean) {
        userDao.pageQuery(pageBean);
    }
}
