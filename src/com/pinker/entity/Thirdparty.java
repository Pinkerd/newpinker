package com.pinker.entity;

public class Thirdparty {
  private String sourcesite;
  private String loginname;
  private Integer userid;
  private String userName;

  public Thirdparty(String sourcesite, String loginname, Integer userid, String userName) {
    this.sourcesite = sourcesite;
    this.loginname = loginname;
    this.userid = userid;
    this.userName = userName;
  }

  @Override
  public String toString() {
    return "Thirdparty{" +
            "sourcesite='" + sourcesite + '\'' +
            ", loginname='" + loginname + '\'' +
            ", userid=" + userid +
            ", userName='" + userName + '\'' +
            '}';
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getSourcesite() {
    return sourcesite;
  }

  public Thirdparty() {
  }

  public Thirdparty(String sourcesite, String loginname, Integer userid) {

    this.sourcesite = sourcesite;
    this.loginname = loginname;
    this.userid = userid;
  }

  public void setSourcesite(String sourcesite) {
    this.sourcesite = sourcesite;
  }

  public String getLoginname() {
    return loginname;
  }

  public void setLoginname(String loginname) {
    this.loginname = loginname;
  }

  public Integer getUserid() {
    return userid;
  }

  public void setUserid(Integer userid) {
    this.userid = userid;
  }
}
