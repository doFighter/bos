package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IFunctionDao;
import com.itheima.bos.entity.Function;
import com.itheima.bos.entity.User;
import com.itheima.bos.service.IFunctionService;
import com.itheima.bos.utils.BOSUtils;
import com.itheima.bos.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FunctionServiceImpl implements IFunctionService {
    @Autowired
    private IFunctionDao functionDao;

    /**
     *  查询所有权限方法
     * @return
     */
    @Override
    public List<Function> findAll() {
        return functionDao.findAll();
    }

    /**
     *  保存权限数据
     * @param model
     */
    @Override
    public void save(Function model) {
        Function parentFunction = model.getParentFunction();
        if (parentFunction !=null && parentFunction.getId().equals("")){
            model.setParentFunction(null);
        }
        functionDao.save(model);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        functionDao.pageQuery(pageBean);
    }

    /**
     *  根据登录人员查询页面菜单
     * @return
     */
    public List<Function> findMenu() {
        List<Function> functions =null;
        User user = BOSUtils.getLoginUser();
        if (user.getUsername().equals("admin")){
            functions = functionDao.findAllMenu();
        }else {
            // 普通用户根据用户名称来查询
            functions = functionDao.findMenuByUserId(user.getId());
        }
        return functions;
    }


}
