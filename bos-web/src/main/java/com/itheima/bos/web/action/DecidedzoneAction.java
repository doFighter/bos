package com.itheima.bos.web.action;

import com.itheima.bos.entity.Decidedzone;
import com.itheima.bos.service.IDecidedzoneService;
import com.itheima.bos.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 *  定区管理
 */

@Controller
@Scope("prototype")
public class DecidedzoneAction extends BaseAction<Decidedzone> {
    // 属性驱动，接收多个分区 id
    private String[] subareaid;

    public void setSubareaid(String[] subareaid) {
        this.subareaid = subareaid;
    }

    @Autowired
    private IDecidedzoneService decidedzoneService;

    /**
     *  添加定区
     */
    public String add(){
        decidedzoneService.save(getModel(),subareaid);
        return LIST;
    }

    /**
     *  定区查询方法
     * @return
     */
    public String pageQuery(){
        decidedzoneService.pageQuery(pageBean);
        this.JavaToJson(pageBean,new String[]{"currentPage","pageSize","detachedCriteria","subareas","decidedzones"});
        return NONE;
    }
}
