package com.itheima.bos.service.impl;

import com.itheima.bos.dao.ISubareaDao;
import com.itheima.bos.entity.Subarea;
import com.itheima.bos.service.ISubareaService;
import com.itheima.bos.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SubareaServiceImpl implements ISubareaService {
    @Autowired
    private ISubareaDao subareaDao;
    @Override
    public void save(Subarea model) {
        subareaDao.save(model);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        subareaDao.pageQuery(pageBean);
    }

    @Override
    public List<Subarea> findAll() {
        return subareaDao.findAll();
    }

    /**
     *  查询所有未关联的定区
     * @return
     */
    @Override
    public List<Subarea> findListNotAssociation() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subarea.class);
        // 添加过滤条件  分区对象中 decidedzone 为null的便没有管理定区
        detachedCriteria.add(Restrictions.isNull("decidedzone"));

        return subareaDao.findByCriteria(detachedCriteria);
    }

    /**
     *  根据定区id 查询关联的分区
     * @param decidedzoneId
     * @return
     */
    @Override
    public List<Subarea> findListByDecidedzoneId(String decidedzoneId) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Subarea.class);
        detachedCriteria.add(Restrictions.eq("decidedzone.id",decidedzoneId));

        return subareaDao.findByCriteria(detachedCriteria);
    }

    @Override
    public List<Object> findSubareasGroupByProvince() {
        return subareaDao.findSubareasGroupByProvince();
    }
}