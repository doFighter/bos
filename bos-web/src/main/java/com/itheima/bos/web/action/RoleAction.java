package com.itheima.bos.web.action;

import com.itheima.bos.entity.Role;
import com.itheima.bos.service.IRoleService;
import com.itheima.bos.utils.PageBean;
import com.itheima.bos.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role> {
    // 属性驱动
    private String functionIds;
    @Autowired
    private IRoleService roleService;

    public void setFunctionIds(String functionIds) {
        this.functionIds = functionIds;
    }

    public String add(){
        roleService.save(getModel(),functionIds);
        return LIST;
    }

    public String pageQuery(){
        roleService.pageQuery(pageBean);
        this.JavaToJson(pageBean,new String[]{"functions","users"});
        return NONE;
    }
    public String listAjax(){
        List<Role> roles = roleService.findAll();
        this.JavaToJson(roles,new String[]{"functions","users"});
        return NONE;
    }
}
