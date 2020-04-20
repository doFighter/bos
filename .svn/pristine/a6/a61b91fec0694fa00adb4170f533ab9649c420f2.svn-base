package com.itheima.bos.service;

import com.itheima.bos.entity.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> findAll();

    List<Customer> findListNotAssociation();

    List<Customer> findListHasAssociation(String decidedzoneId);

    void assigncustomerstodecidedzone(String id, List<String> customerIds);

    List<Customer> findByTelephone(String telephone);

    String findDecidedzoneIdByAddress(String address);
}
