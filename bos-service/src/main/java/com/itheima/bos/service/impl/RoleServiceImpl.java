package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IRoleDao;
import com.itheima.bos.entity.Function;
import com.itheima.bos.entity.Role;
import com.itheima.bos.service.IRoleService;
import com.itheima.bos.utils.PageBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleDao roleDao;
    /**
     *  添加角色方法,并关联权限
     * @param model
     * @param functionIds
     */
    public void save(Role model, String functionIds) {
        roleDao.save(model);
        if (StringUtils.isNotBlank(functionIds)){
            String[] fIds = functionIds.split(",");
            for (String functionId:fIds){
                // 手动构造一个权限对象，该对象处于托管状态
                Function function = new Function(functionId);
                // 角色关联权限
                model.getFunctions().add(function);
            }
        }
        roleDao.save(model);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        roleDao.pageQuery(pageBean);
    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }
}
