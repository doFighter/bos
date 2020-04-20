package com.itheima.bos.dao;

import com.itheima.bos.dao.base.IBaseDao;
import com.itheima.bos.entity.Region;

import java.util.List;

public interface IRegionDao extends IBaseDao<Region> {
    List<Region> findListByQ(String q);
//    void saveBatch(List<Region> regionList);
}
