package com.pinker.servlet;

import com.pinker.entity.Page;
import com.pinker.entity.pk_user;
import com.pinker.service.Impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Aries.Gu on 2017/12/26.
 * user管理servlet
 * function：
 * 1.根据登录名和密码登陆    done
 * 2.注册 添加新用户         done
 * 3.修改资料 更新信息       done
 * 4.好友推荐 寻找相同学校的人
 * 5.好友推荐 寻找相同居住地的人
 * 6.根据id查询用户          done
 * 7.根据姓名查询用户        done
 * 8.白名单                  done
 * 9.黑名单                  done
 * 10.冻结/解冻方法          done
 */

@WebServlet(name = "UsersServlet",urlPatterns = ("/UsersServlet"))
public class UsersServlet extends BaseServlet {
    UserServiceImpl usi=new UserServiceImpl();

    /*1.登陆 根据登录名和密码登陆*/
    protected void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into logIn...");

        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");
        pk_user user = usi.login(loginname, password);
        request.getSession().setAttribute("user",user);
        request.setAttribute("loginname",loginname);

        if(user!=null && user.getStatus()==1){
            request.getRequestDispatcher("pinker/index.jsp").forward(request,response);
        }else{
            request.setAttribute("LoginErrorMsg","登录名或密码错误，请重新输入！");
            request.getRequestDispatcher("pinker/login.jsp").forward(request,response);

        }

        System.out.println(user);
    }
    /*2.注册 添加新用户*/
    protected void saveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into saveUser...");

        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        String passwordAg = request.getParameter("passwordAg");
        pk_user exsist = usi.findByLoginName(loginName);//先看账号有没有被注册
        System.out.println(exsist);
        if(exsist!=null){
            //如果账号被注册了，返回注册页面，带回错误信息
            request.setAttribute("RegErrorMsg","登录名已存在，请重新输入！");
            request.getRequestDispatcher("pinker/login.jsp").forward(request,response);
        }else {

                //条件符合，可以进行注册
                Date date = new Date();
                boolean add = usi.add(loginName, password, date);
                System.out.println("add:  "+add);
                if(add){
                    request.getRequestDispatcher("pinker/index.jsp").forward(request,response);
                }else{
                    request.setAttribute("RegErrorMsg","注册失败，请重新输入！");
                    request.getRequestDispatcher("pinker/login.jsp").forward(request,response);
                }

        }
    }
    /*3.修改资料 更新信息*/
    protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /*4.好友推荐 寻找相同学校的人*/
    protected void school(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into same school...");
    }
    /*5.好友推荐 寻找相同居住地的人*/
    protected void residence(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into same residence...");
    }
    /*6.根据id查询用户*/
    protected void findId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into findId...");

        String num = request.getParameter("byId");
        Integer byId = Integer.valueOf(num);

        pk_user byUserId = usi.findByUserId(byId);
        ArrayList<pk_user> list=new ArrayList<pk_user>();
        list.add(byUserId);

        request.setAttribute("userlist",list);
        request.getRequestDispatcher("pinker/pages/userResult.jsp").forward(request,response);
    }
    
    /*7.根据姓名查询用户*/
    protected void findName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into findName...");

        String byName = request.getParameter("byName");

        List<pk_user> list = usi.findByUserName(byName);

        request.setAttribute("userlist",list);
        request.getRequestDispatcher("pinker/pages/userResult.jsp").forward(request,response);
    }

    /*8.白名单*/
    //分页信息的方法
    protected void findUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取页面传入的当前页
        String pageNumber = req.getParameter("pageNumber");

        //设置每页显示的条数
        int pageSize=10;
        //调用finduser方法
        Page<pk_user> page = usi.findUser(pageNumber, pageSize,1);
        //将查询到的信息放进域中
        req.setAttribute("page",page);

        //转发到bookmanagger页面
        req.getRequestDispatcher("pinker/userManager.jsp").forward(req,resp);
    }
    /*9.黑名单*/
    //分页信息的方法
    protected void blackList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取页面传入的当前页
        String pageNumber = req.getParameter("pageNumber");

        //设置每页显示的条数
        int pageSize=10;
        //调用finduser方法
        Page<pk_user> page = usi.findUser(pageNumber, pageSize,0);
        //将查询到的信息放进域中
        req.setAttribute("page",page);

        //转发到bookmanagger页面
        req.getRequestDispatcher("pinker/userUnfreeze.jsp").forward(req,resp);
    }
    /*10.冻结、解冻的方法*/
    protected void freezeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into freezeUser...");
        //获取id
        String num = request.getParameter("id");
        Integer id = Integer.valueOf(num);
        System.out.println(id);
        //获取状态参数
        String num2 = request.getParameter("status");
        Integer freeze = Integer.valueOf(num2);
        //执行冻结、解冻操作
        boolean delete = usi.freeze(freeze,id);

        if(freeze==1){
            //如果从黑名单 解冻  跳转去黑名单
            response.sendRedirect(request.getContextPath()+"/UsersServlet?method=blackList");
        }else{
            //如果从白名单 冻结  跳转去白名单
            response.sendRedirect(request.getContextPath()+"/UsersServlet?method=findUser");
        }
    }
    /*11.登陆 根据登录名和密码登陆*/
    protected void ManagerlogIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into ManagerlogIn...");

        String loginname = request.getParameter("loginname");
        String password = request.getParameter("password");

        pk_user admin = usi.login(loginname, password);
        if(admin==null){
            //先看账号密码对不对
            request.setAttribute("errMsg","账号或密码错误，请重新输入！");
            request.getRequestDispatcher("pinker/ManagerLogin.jsp").forward(request,response);
        }else{
            //账号密码对了
            if(admin.getRoleId()!=2){
                //看有没有权限
                //没有权限
                request.setAttribute("errMsg","没有权限！");
                request.getRequestDispatcher("pinker/ManagerLogin.jsp").forward(request,response);
            }else{
                //没有权限，有权限就登陆
                request.setAttribute("admin",admin);
                request.getRequestDispatcher("pinker/backManager.jsp").forward(request,response);
            }
        }


    }



}
