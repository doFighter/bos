package com.itheima.bos.web.action;

import com.itheima.bos.entity.Staff;
import com.itheima.bos.service.IStaffService;
import com.itheima.bos.utils.PageBean;
import com.itheima.bos.web.action.base.BaseAction;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.List;

/**
 *  取派员管理
 *
 */
@Controller
@Scope("prototype")
public class StaffAction extends BaseAction<Staff> {

    @Autowired
    private IStaffService staffService;

    /**
     *  添加取派员
     */
    public String add(){
        staffService.save(getModel());
        return LIST;
    }

    /**
     *  分页查询方法
     */

    // 查询方法
    public String pageQuery() throws IOException {
        // 创建离线提交查询对象


        staffService.pageQuery(pageBean);
        // 使用 json-lib 将 PageBean 对象转为 json ，通过输出流写回页面中
//        JSONObject 将单一对象转为json
//        JSONArray   将数组或者集合转为json
        this.JavaToJson(pageBean,new String[] {"decidedzones","currentPage","detachedCriteria","pageSize"});

        return NONE;
    }


    /**
     *  批量删除取派员
     */
    // 接收传输过来的参数
    private String ids;

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }
    @RequiresPermissions("staff-delete") // 配置使用该方法必须具有 staff-delete 权限
    public String deleteBatch(){
        staffService.deleteBatch(ids);
        return LIST;
    }

    /**
     *  修改取派员信息
     * @return
     */
    public String edit(){
        // 查询数据库，查找该id的用户内容
        Staff staff = staffService.findById(getModel().getId());
        // 使用model对象覆盖staff
        staff.setName(getModel().getName());
        staff.setHaspda(getModel().getHaspda());
        staff.setTelephone(getModel().getTelephone());
        staff.setStandard(getModel().getStandard());
        staff.setStation(getModel().getStation());

        // 更新
        staffService.update(staff);

        return LIST;
    }

    /**
     *  查询所有未删除的取派员数据，返回 json
     * @return
     */
    public String listAjax(){
        List<Staff> staffList = staffService.findListNotDelete();
        this.JavaToJson(staffList,new String[]{"telephone","haspda","deltag","station","standard","decidedzones"});
        return NONE;
    }

}
