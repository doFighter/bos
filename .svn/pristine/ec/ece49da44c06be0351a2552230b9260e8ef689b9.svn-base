package com.itheima.bos.service;

import com.itheima.bos.entity.Staff;
import com.itheima.bos.utils.PageBean;

import java.util.List;


public interface IStaffService {
    void save(Staff model);

    void pageQuery(PageBean pageBean);

    void deleteBatch(String ids);

    Staff findById(String id);

    void update(Staff staff);

    List<Staff> findListNotDelete();
}
