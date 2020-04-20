package com.itheima.bos.entity;


import java.io.Serializable;

public class Customer implements Serializable {

  private String id;
  private String name;
  private String station;
  private String telephone;
  private String address;
  private String decidedzoneId;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getStation() {
    return station;
  }

  public void setStation(String station) {
    this.station = station;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getDecidedzoneId() {
    return decidedzoneId;
  }

  public void setDecidedzoneId(String decidedzoneId) {
    this.decidedzoneId = decidedzoneId;
  }


}
