package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IRegionDao;
import com.itheima.bos.entity.Region;
import com.itheima.bos.service.IRegionService;
import com.itheima.bos.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RegionServiceImpl implements IRegionService {

    @Autowired
    private IRegionDao regionDao;

    /**
     *  区域数据批量处理
     * @param regionList
     */
    @Override
    public void saveBatch(List<Region> regionList) {
//        regionDao.saveBatch(regionList);
        for (Region region:regionList){
            regionDao.saveOrUpdate(region);
        }
    }

    /**
     *  分页查询
     * @param pageBean
     */
    @Override
    public void pageQury(PageBean pageBean) {
        regionDao.pageQuery(pageBean);
    }

    /**
     *  查询所有区域
     * @return
     */
    @Override
    public List<Region> findAll() {

        return regionDao.findAll();
    }

    /**
     *  根据页面输入进行模糊查询
     * @param q
     * @return
     */
    @Override
    public List<Region> findListByQ(String q) {
        return regionDao.findListByQ(q);
    }
}
