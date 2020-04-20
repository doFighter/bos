package com.itheima.bos.dao;

import com.itheima.bos.dao.base.IBaseDao;
import com.itheima.bos.entity.Subarea;

import java.util.List;

public interface ISubareaDao extends IBaseDao<Subarea> {

    List<Object> findSubareasGroupByProvince();
}
