package com.itheima.bos.dao.impl;

import com.itheima.bos.dao.ISubareaDao;
import com.itheima.bos.dao.base.impl.BaseDaoImpl;
import com.itheima.bos.entity.Subarea;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubareaDaoImpl extends BaseDaoImpl<Subarea> implements ISubareaDao {
    @Override
    public List<Object> findSubareasGroupByProvince() {
        String hql = "SELECT r.province,count(*) from Subarea s LEFT OUTER JOIN s.region r GROUP BY r.province";
        return (List<Object>) this.getHibernateTemplate().find(hql);
    }
}
