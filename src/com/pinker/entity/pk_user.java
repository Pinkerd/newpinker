package com.pinker.entity;

import java.util.Date;

/**
 * Created by Aries.Gu on 2017/12/25.
 *
 * 用户（用户名，密码，邮箱，安全问题，问题答案，用户角色，账号状态，
 *       创建时间，居住地，学校，性别，生日，星座，头像，个人说明）
 */

public class pk_user {
    private  Integer id;                  //id
    private  String loginName;          //登陆账号
    private  String password;           //密码
    private  String username;           //用户名
    private  String  email;              //邮箱
    private  Integer roleId;               //角色ID
    private  Integer status;               //状态
    private  Date createtime;           //创建时间
    private  Date lastlogin;            //最后登陆
    private  String residence;          //居住地
    private  String school;              //学校
    private  String gender;              //性别
    private  Date birthday;              //生日
    private  String constellation;      //星座
    private  String introduction;       //个人说明
    private  String header;              //头像
    private  String pswQ1;               //密码提示问题1
    private  String pswA1;               //密码提示答案1
    private  String pswQ2;               //密码提示问题1
    private  String pswA2;               //密码提示答案1
    private  String pswQ3;               //密码提示问题1
    private  String pswA3;               //密码提示答案1


    public pk_user() {
    }

    public pk_user(Integer id, String loginName, String password,
                   String username, String email, Integer roleId,
                   Integer status, Date createtime, Date lastlogin,
                   String residence, String school, String gender,
                   Date birthday, String constellation, String introduction,
                   String header, String pswQ1, String pswA1, String pswQ2,
                   String pswA2, String pswQ3, String pswA3) {
        this.id = id;
        this.loginName = loginName;
        this.password = password;
        this.username = username;
        this.email = email;
        this.roleId = roleId;
        this.status = status;
        this.createtime = createtime;
        this.lastlogin = lastlogin;
        this.residence = residence;
        this.school = school;
        this.gender = gender;
        this.birthday = birthday;
        this.constellation = constellation;
        this.introduction = introduction;
        this.header = header;
        this.pswQ1 = pswQ1;
        this.pswA1 = pswA1;
        this.pswQ2 = pswQ2;
        this.pswA2 = pswA2;
        this.pswQ3 = pswQ3;
        this.pswA3 = pswA3;
    }

    @Override
    public String toString() {
        return "pk_user{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", roleId=" + roleId +
                ", status=" + status +
                ", createtime=" + createtime +
                ", lastlogin=" + lastlogin +
                ", residence='" + residence + '\'' +
                ", school='" + school + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", constellation='" + constellation + '\'' +
                ", introduction='" + introduction + '\'' +
                ", header='" + header + '\'' +
                ", pswQ1='" + pswQ1 + '\'' +
                ", pswA1='" + pswA1 + '\'' +
                ", pswQ2='" + pswQ2 + '\'' +
                ", pswA2='" + pswA2 + '\'' +
                ", pswQ3='" + pswQ3 + '\'' +
                ", pswA3='" + pswA3 + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(Date lastlogin) {
        this.lastlogin = lastlogin;
    }

    public String getResidence() {
        return residence;
    }

    public void setResidence(String residence) {
        this.residence = residence;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getConstellation() {
        return constellation;
    }

    public void setConstellation(String constellation) {
        this.constellation = constellation;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getPswQ1() {
        return pswQ1;
    }

    public void setPswQ1(String pswQ1) {
        this.pswQ1 = pswQ1;
    }

    public String getPswA1() {
        return pswA1;
    }

    public void setPswA1(String pswA1) {
        this.pswA1 = pswA1;
    }

    public String getPswQ2() {
        return pswQ2;
    }

    public void setPswQ2(String pswQ2) {
        this.pswQ2 = pswQ2;
    }

    public String getPswA2() {
        return pswA2;
    }

    public void setPswA2(String pswA2) {
        this.pswA2 = pswA2;
    }

    public String getPswQ3() {
        return pswQ3;
    }

    public void setPswQ3(String pswQ3) {
        this.pswQ3 = pswQ3;
    }

    public String getPswA3() {
        return pswA3;
    }

    public void setPswA3(String pswA3) {
        this.pswA3 = pswA3;
    }
}
