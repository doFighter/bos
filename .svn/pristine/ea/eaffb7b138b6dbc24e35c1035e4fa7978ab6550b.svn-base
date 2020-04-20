package com.itheima.bos.web.action;


import com.itheima.bos.entity.Customer;
import com.itheima.bos.entity.Noticebill;
import com.itheima.bos.entity.User;
import com.itheima.bos.service.ICustomerService;
import com.itheima.bos.service.INoticebillService;
import com.itheima.bos.utils.BOSUtils;
import com.itheima.bos.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class NoticebillAction extends BaseAction<Noticebill> {

    @Autowired
    private INoticebillService noticebillService;
    @Autowired
    private ICustomerService customerService;


    /**
     *  根据手机号查询数据
     * @return
     */
    public String findByTelephone(){
        String telephone = getModel().getTelephone();
        List<Customer> customers = customerService.findByTelephone(telephone);
        Customer customer;
        if (customers.size()>0){
            customer = customers.get(0);
        }else {
            customer = null;
        }
        this.JavaToJson(customer,new String[]{});
        return NONE;
    }

    /**
     *  根据客户地址查询定区id
     * @return
     */
    public String findByaddress(){
        return NONE;
    }
    /**
     *  保存一个业务通知单，并自动分单
     *
     * @return
     */
    public String add(){
        noticebillService.save(getModel());
        return "noticebill_add";
    }


}
