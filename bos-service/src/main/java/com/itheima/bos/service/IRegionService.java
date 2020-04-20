package com.itheima.bos.service;

import com.itheima.bos.entity.Region;
import com.itheima.bos.utils.PageBean;

import java.util.List;

public interface IRegionService {
    void saveBatch(List<Region> regionList);

    void pageQury(PageBean pageBean);

    List<Region> findAll();

    List<Region> findListByQ(String q);
}
