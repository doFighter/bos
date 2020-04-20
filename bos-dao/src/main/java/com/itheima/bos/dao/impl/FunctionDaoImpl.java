package com.itheima.bos.dao.impl;

import com.itheima.bos.dao.IFunctionDao;
import com.itheima.bos.dao.IRoleDao;
import com.itheima.bos.dao.base.impl.BaseDaoImpl;
import com.itheima.bos.entity.Function;
import com.itheima.bos.entity.Role;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Repository
public class FunctionDaoImpl extends BaseDaoImpl<Function> implements IFunctionDao {
    @Autowired
    private IRoleDao roleDao;
    public List<Function> findAll(){
//        Session session = getSessionFactory().getCurrentSession();
//        String sql = "FROM Function f WHERE f.parentFunction IS NULL";
//        Query query = session.createQuery(sql);
//        return query.list();
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Function.class);
        detachedCriteria.add(Restrictions.isNull("parentFunction"));
        return this.findByCriteria(detachedCriteria);
    }


    public List<Function> findFunctionListByUserId(String id) {

        String hql = "SELECT DISTINCT f FROM Function f left outer join f.roles r left outer join r.users u where u.id = ?";

        List<Function> functions = (List<Function>) this.getHibernateTemplate().find(hql,id);


        return functions;
    }

    /**
     *  查询所有菜单
     * @return
     */
    public List<Function> findAllMenu() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Function.class);
        detachedCriteria.add(Restrictions.eq("generatemenu","1"));
        detachedCriteria.addOrder(Order.desc("zindex"));
        return this.findByCriteria(detachedCriteria);
    }

    /**
     *  根据用户查询菜单
     * @param userId
     * @return
     */
    public List<Function> findMenuByUserId(String userId) {
        String hql = "SELECT DISTINCT f FROM Function f left outer join f.roles r left outer join r.users u where u.id = ? AND f.generatemenu='1'  ORDER BY f.zindex DESC";
        List<Function> functions = (List<Function>) this.getHibernateTemplate().find(hql,userId);

        return functions;
    }
}
