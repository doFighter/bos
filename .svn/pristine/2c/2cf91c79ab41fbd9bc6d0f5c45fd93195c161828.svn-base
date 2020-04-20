package com.itheima.bos.web.action;

import com.itheima.bos.entity.Customer;
import com.itheima.bos.service.ICustomerService;
import com.itheima.bos.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class CustomerAction extends BaseAction<Customer> {
    @Autowired
    private ICustomerService customerService;

    /**
     *  获取未关联的客户
     * @return
     */
    public String findListNotAssociation(){
        List<Customer> customers = customerService.findListNotAssociation();
        this.JavaToJson(customers,new String[]{});
        return NONE;
    }


    /**
     *  获取已关联的客户
     * @return
     */
    public String findListHasAssociation(){
        String id = getModel().getId();
        List<Customer> customers = customerService.findListHasAssociation(id);
        this.JavaToJson(customers,new String[]{});
        return NONE;
    }

    // 属性驱动
    private List<String> customerIds;

    public void setCustomerIds(List<String> customerIds) {
        this.customerIds = customerIds;
    }

    /**
     *  进行客户关联
     * @return
     */
    public String assigncustomerstodecidedzone(){
        customerService.assigncustomerstodecidedzone(getModel().getId(),customerIds);
        return LIST;
    }



}
