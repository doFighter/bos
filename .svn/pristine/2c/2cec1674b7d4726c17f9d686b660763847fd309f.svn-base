package com.itheima.bos.service;

import com.itheima.bos.entity.Subarea;
import com.itheima.bos.utils.PageBean;

import java.util.List;

public interface ISubareaService {
    void save(Subarea model);

    void pageQuery(PageBean pageBean);

    List<Subarea> findAll();

    List<Subarea> findListNotAssociation();

    List<Subarea> findListByDecidedzoneId(String decidedzoneId);

    List<Object> findSubareasGroupByProvince();
}
