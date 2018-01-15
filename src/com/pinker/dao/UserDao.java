package com.pinker.dao;

import com.pinker.entity.Page;
import com.pinker.entity.pk_user;

import java.util.Date;
import java.util.List;

/**
 * Created by Aries.Gu on 2017/12/25.
 */

public interface UserDao {
//用户功能
    /*注册 添加新用户*/
    public boolean addUser(String loginName, String password, Date createtime);
    /*修改资料 更新信息*/
    public boolean updateUser(pk_user pkuser);
    /*登陆 根据登录名和密码登陆*/
    public pk_user login(String loginName, String password);
    /*修改密码*/
    public boolean updatePassword(Integer id ,String newPassword);

    /*好友推荐 寻找相同学校的人*/
    public List<pk_user> findUsersBySchool(pk_user pkuser);
    /*好友推荐 寻找相同居住地的人*/
    public List<pk_user> findUsersByResidence(pk_user pkuser);
//公用功能
    /*根据id查询用户*/
    public pk_user findByUserId(Integer id);
    /*根据姓名查询用户*/
    public  List<pk_user> findByUserName(String name);
    /*根据登陆名查询用户*/
    public pk_user findByLoginName(String name);
    /*根据id查询用户目前状态*/
    public Integer findStatusById(Integer id);
    /*根据email查询用户*/
    public  pk_user findUserByEmail(String email);
//管理员功能
    /*显示列表 查询所有用户*/
    public List<pk_user> findAll(int status);
    /*根据id删除用户*/
    public boolean freezeUserById(Integer status, Integer id);
    /*黑白名单查询页码的方法 */
    Page<pk_user> findUser(Page<pk_user> page, Integer status);
    /*黑白名单 id 分页查询*/
    Page<pk_user> findIdResult(Page<pk_user> page, Integer id,Integer status);
    /*黑白名单 用户名 分页查询*/
    Page<pk_user> findNameResult(Page<pk_user> page,  String username,Integer status);

}
