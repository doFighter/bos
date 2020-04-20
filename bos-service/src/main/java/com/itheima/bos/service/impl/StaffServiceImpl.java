package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IStaffDao;
import com.itheima.bos.entity.Staff;
import com.itheima.bos.service.IStaffService;
import com.itheima.bos.utils.PageBean;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StaffServiceImpl implements IStaffService {
    @Autowired
    private IStaffDao staffDao;

    @Override
    public void save(Staff model) {
        staffDao.save(model);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        staffDao.pageQuery(pageBean);
    }

    /**
     *  取派员批量删除，
     *  是逻辑删除，将标志位由“0”改为“1”
     * @param ids
     */
    @Override
    public void deleteBatch(String ids) {
        Staff staff = new Staff();
        if (StringUtils.isNotBlank(ids)){
            String[] staffIds = ids.split(",");
            for (String id:staffIds){
                staff = staffDao.findById(id);
                staff.setDeltag("1");
                staffDao.update(staff);
            }
        }
    }

    @Override
    public Staff findById(String id) {
        return staffDao.findById(id);
    }

    @Override
    public void update(Staff staff) {
        staffDao.update(staff);
    }

    @Override
    public List<Staff> findListNotDelete() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Staff.class);
        // 添加过滤条件 deltag=0  未删除的
        detachedCriteria.add(Restrictions.eq("deltag","0"));

        return staffDao.findByCriteria(detachedCriteria);
    }
}
