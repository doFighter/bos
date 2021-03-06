package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IDecidedzoneDao;
import com.itheima.bos.dao.ISubareaDao;
import com.itheima.bos.entity.Decidedzone;
import com.itheima.bos.entity.Subarea;
import com.itheima.bos.service.IDecidedzoneService;
import com.itheima.bos.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DecidedzoneServiceImpl implements IDecidedzoneService {

    @Autowired
    private IDecidedzoneDao decidedzoneDao;

    @Autowired
    private ISubareaDao subareaDao;
    /**
     *  添加定区，同时关联分区
     * @param model
     * @param subareaid
     */
    @Override
    public void save(Decidedzone model, String[] subareaid) {
        decidedzoneDao.save(model);
        for (String id:subareaid){
            Subarea subarea = subareaDao.findById(id);
            subarea.setDecidedzone(model);
        }
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        decidedzoneDao.pageQuery(pageBean);
    }
}
