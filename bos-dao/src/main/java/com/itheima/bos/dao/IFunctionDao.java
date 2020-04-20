package com.itheima.bos.dao;

import com.itheima.bos.dao.base.IBaseDao;
import com.itheima.bos.entity.Function;

import java.util.List;

public interface IFunctionDao extends IBaseDao<Function> {
    List<Function> findFunctionListByUserId(String id);

    List<Function> findAllMenu();

    List<Function> findMenuByUserId(String id);
}
