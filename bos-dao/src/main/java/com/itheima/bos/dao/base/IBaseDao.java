package com.itheima.bos.dao.base;

import com.itheima.bos.utils.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;

public interface IBaseDao<T> {
    public void save(T entity);
    public void update(T entity);
    public void saveOrUpdate(T entity);
    public void delete(T entity);
    public T findById(Serializable id);
    public List<T> findByCriteria(DetachedCriteria detachedCriteria);
    public List<T> findAll();
    public void pageQuery(PageBean pageBean);
}
