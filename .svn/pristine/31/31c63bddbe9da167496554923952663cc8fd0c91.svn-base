package com.itheima.bos.web.action;

import com.itheima.bos.entity.Function;
import com.itheima.bos.service.IFunctionService;
import com.itheima.bos.web.action.base.BaseAction;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.List;

@Controller
@Scope("prototype")
public class FunctionAction extends BaseAction<Function> {
    @Autowired
    private IFunctionService functionService;
    /**
     *  查询所有权限，返回 json 数据
     * @return
     */
    public String listAjax(){
        List<Function> functions = functionService.findAll();
        this.JavaToJson(functions,new String[]{"parentFunction","roles"});

        return NONE;
    }

    /**
     *  保存数据
     * @return
     */
    public String add(){
        functionService.save(getModel());
        return LIST;
    }

    /**
     * 查询数据
     * @return
     */
    public String pageQuery(){
        String page = getModel().getPage();
        pageBean.setCurrentPage(Integer.parseInt(page));
        functionService.pageQuery(pageBean);
        this.JavaToJson(pageBean,new String[]{"parentFunction","roles","children"});
        return NONE;
    }

    /**
     *  根据登录人员查询页面菜单
     * @return
     */
    public String findMenu(){
        List<Function> functions =functionService.findMenu();
        this.JavaToJson(functions,new String[]{"parentFunction","roles","children"});
        return NONE;
    }
}
