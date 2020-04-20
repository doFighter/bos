package com.itheima.bos.service.impl;

import com.itheima.bos.dao.IDecidedzoneDao;
import com.itheima.bos.dao.INoticebillDao;
import com.itheima.bos.dao.IWorkbillDao;
import com.itheima.bos.entity.*;
import com.itheima.bos.service.ICustomerService;
import com.itheima.bos.service.INoticebillService;
import com.itheima.bos.utils.BOSUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@Service
@Transactional
public class NoticebillServiceImpl implements INoticebillService {

    @Autowired
    private INoticebillDao noticebillDao;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private IDecidedzoneDao decidedzoneDao;
    @Autowired
    private IWorkbillDao workbillDao;
    @Override
    public void save(Noticebill model) {
        User user = BOSUtils.getLoginUser();
        model.setUser(user);// 将当前用户设置进model中
        noticebillDao.save(model);
        // 获取取件地址
        String pickaddress = model.getPickaddress();
        // 根据取件地址查询定区id
        String decidedzoneId = customerService.findDecidedzoneIdByAddress(pickaddress);
        if (decidedzoneId != null){
            // 查询到了定区id，可以进行自动分单
            Decidedzone decidedzone = decidedzoneDao.findById(decidedzoneId);
            Staff staff = decidedzone.getStaff();
            model.setStaff(staff);// 业务通知单关联取派员对象
            // 设置分单类型为自动分单
            model.setOrdertype(Noticebill.ORDERTYPE_AUTO);
            // 为取派员产生一个工单
            Workbill workbill = new Workbill();
            workbill.setAttachbilltimes(0);// 设置追单次数
            workbill.setBuildtime(new Timestamp(System.currentTimeMillis()));// 工单的创建时间
            workbill.setNoticebill(model);// 工单关联通知单
            workbill.setPickstate(Workbill.PICKSTATE_NO);// 取件状态
            workbill.setRemark(model.getRemark());// 备注信息
            workbill.setStaff(staff); // 关联取派员
            workbill.setType(Workbill.TYPE_1);// 工单类型
            workbillDao.save(workbill);// 保存工单
        }else {
            // 没有查到定区id
            model.setOrdertype(Noticebill.ORDERTYPE_MAN);
        }
    }
}
