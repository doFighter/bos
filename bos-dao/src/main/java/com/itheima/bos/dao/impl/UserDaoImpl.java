package com.itheima.bos.dao.impl;

import com.itheima.bos.dao.IUserDao;
import com.itheima.bos.dao.base.impl.BaseDaoImpl;
import com.itheima.bos.entity.User;
import com.itheima.bos.utils.MD5Utils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

    /**
     *  根据用户名和密码查询用户
     * @param username
     * @param password
     * @return
     */
    @Override
    public User findUserByNameAndPwd(String username, String password) {
//        String sql = "from User u where u.username=? and u.password=?";
//        List<User> users = (List<User>) this.getHibernateTemplate().find(sql,username,password);
        User user = new User();

        user.setUsername(username);
        user.setPassword(password);
        List<User> users = this.getHibernateTemplate().findByExample(user);
        if (users != null && users.size() > 0){
            return users.get(0);
        }
        return null;
    }

    /**
     *  对用户的密码进行更新
     * @param user
     */
    @Override
    public void updateUser(User user) {
        this.getHibernateTemplate().update(user);
    }

    @Override
    public User findUserByName(String username) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        detachedCriteria.add(Restrictions.eq("username",username));
        List<User> users = (List<User>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if (users != null && users.size()>0){
            return users.get(0);
        }
        return null;
    }
}
