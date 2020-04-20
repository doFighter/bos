package com.itheima.bos.service.realm;

import com.itheima.bos.dao.IFunctionDao;
import com.itheima.bos.dao.IUserDao;
import com.itheima.bos.entity.Function;
import com.itheima.bos.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BOSRealm extends AuthorizingRealm {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IFunctionDao functionDao;
    // 授权方法
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        System.out.println("授权方法执行了！");
        // 获取当前登录用户对象
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        List<Function> functions = null;
        // 根据当前登录对象查询数据库，获取实际对应的权限
        if (user.getUsername().equals("admin")){
            DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Function.class);
            // 超级管理员的内置用户，查询所有权限
            functions = functionDao.findByCriteria(detachedCriteria);
        }else {
            functions = functionDao.findFunctionListByUserId(user.getId());
        }
        for (Function function:functions){
            info.addStringPermission(function.getCode());
            System.out.println(function.getCode());
        }
        return info;
    }

    // 认证方法
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;
        // 获得页面输入的用户名
        String username = usernamePasswordToken.getUsername();

        // 根据用户名查询数据库中的密码
        User user = userDao.findUserByName(username);
        if (user == null){
            // 说明用户名不存在
            return null;
        }
        // 框架负责比对页面输入的密码是否和数据库中的密码一致
        // 简单认证信息对象
        AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());

        return authenticationInfo;
    }
}
