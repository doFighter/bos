package com.itheima.bos.service.impl;

import com.itheima.bos.dao.ICustomerDao;
import com.itheima.bos.entity.Customer;
import com.itheima.bos.service.ICustomerService;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private ICustomerDao customerDao;

    /**
     *  查询所有
     * @return
     */
    @Override
    public List<Customer> findAll() {

        return customerDao.findAll();
    }

    /**
     *  查询未被绑定
     * @return
     */
    @Override
    public List<Customer> findListNotAssociation() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        detachedCriteria.add(Restrictions.isNull("decidedzoneId"));

        return customerDao.findByCriteria(detachedCriteria);
    }

    @Override
    public List<Customer> findListHasAssociation(String decidedzoneId) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        detachedCriteria.add(Restrictions.eq("decidedzoneId",decidedzoneId));

        return customerDao.findByCriteria(detachedCriteria);
    }

    @Override
    public void assigncustomerstodecidedzone(String id, List<String> customerIds) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        detachedCriteria.add(Restrictions.eq("decidedzoneId",id));
        List<Customer> customers = customerDao.findByCriteria(detachedCriteria);
        for (Customer customer:customers){
            customer.setDecidedzoneId(null);
            customerDao.update(customer);
        }

        for (String customerId:customerIds){
            Customer customer = customerDao.findById(customerId);
            customer.setDecidedzoneId(id);
            customerDao.update(customer);
        }
    }

    @Override
    public List<Customer> findByTelephone(String telephone) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        detachedCriteria.add(Restrictions.eq("telephone",telephone));
        return customerDao.findByCriteria(detachedCriteria);
    }

    @Override
    public String findDecidedzoneIdByAddress(String address) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Customer.class);
        detachedCriteria.add(Restrictions.eq("address",address));
        List<Customer> customers = customerDao.findByCriteria(detachedCriteria);
        Customer customer = customers.get(0);
        return customer.getDecidedzoneId();
    }
}
