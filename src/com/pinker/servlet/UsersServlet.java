package com.pinker.servlet;

import com.pinker.entity.Page;
import com.pinker.entity.pk_user;
import com.pinker.service.Impl.UserServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Aries.Gu on 2017/12/26.
 * user管理servlet
 * function：
 * 1.根据登录名和密码登陆          done
 * 2.注册 添加新用户               done
 * 3.修改资料 更新信息             done
 * 4.好友推荐 寻找相同学校的人     unused
 * 5.好友推荐 寻找相同居住地的人   unused
 * 6.根据id查询用户                done
 * 7.根据姓名查询用户              done
 * 8.白名单                        done
 * 9.黑名单                        done
 * 10.冻结/解冻方法                done
 * 11.管理员登陆                   done
 * 12.退出登陆                     done
 * 13.修改密码                     done
 * 14.根据id查询当前用户的状态     done
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
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
            request.setAttribute("LoginErrorMsg","登录名或密码错误，请重新输入！");
            request.getRequestDispatcher("pinker/login.jsp").forward(request,response);
        }
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
        System.out.println("jump into updateUser...");
        try {
        Integer id = Integer.valueOf(request.getParameter("id")); //id  Integer
        String loginName = request.getParameter("loginName");   //loginName String
        String password = request.getParameter("password");     //password String
        String username = request.getParameter("username");     //username String
        String email = request.getParameter("email");           //email String
        Integer roleId = Integer.valueOf(request.getParameter("roleId"));   //roleId Integer
        Integer status = Integer.valueOf(request.getParameter("status"));   //status Integer
        String create = request.getParameter("createtime");
        Date createtime = new SimpleDateFormat("yyyy-MM-dd").parse(create);//createtime Date
        Date lastlogin=new Date();                                  // lastlogin Date
        String residence = request.getParameter("residence");   //residence String
        String school = request.getParameter("school");             //school String
        String gender = request.getParameter("gender");             //gender String
        String birth = request.getParameter("birthday");
        Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birth);    //birthday Date
        String constellation = request.getParameter("constellation");           //constellation String
            String header = request.getParameter("header");
            String pswQ1 = request.getParameter("pswQ1");
        String pswA1 = request.getParameter("pswA1");
        String pswQ2 = request.getParameter("pswQ2");
        String pswA2 = request.getParameter("pswA2");
        String pswQ3 = request.getParameter("pswQ3");
        String pswA3 = request.getParameter("pswA3");
        String introduction = request.getParameter("introduction");
            pk_user user = new pk_user(id, loginName, password, username, email, roleId, status, createtime, lastlogin, residence, school, gender, birthday, constellation, introduction, header, pswQ1, pswA1, pswQ2, pswA2, pswQ3, pswA3);
            System.out.println(user);
            boolean update = usi.update(user);
            if(update){
                pk_user byUserId = usi.findByUserId(id);
                request.setAttribute("user",byUserId);
                request.getRequestDispatcher("pinker/PersonPage.jsp").forward(request,response);
            }
        } catch (Exception e) {
            System.out.println("时间转换出错");
            e.printStackTrace();
        }

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
        Integer byId = Integer.valueOf(request.getParameter("byId"));
        pk_user byUserId = usi.findByUserId(byId);
        ArrayList<pk_user> list=new ArrayList<pk_user>();
        list.add(byUserId);
        request.setAttribute("userlist",list);
        request.getRequestDispatcher("pinker/userResult.jsp").forward(request,response);
    }
    
    /*7.根据姓名查询用户*/
    protected void findName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jump into findName...");
        String byName = request.getParameter("byName");
        List<pk_user> list = usi.findByUserName(byName);
        request.setAttribute("userlist",list);
        request.getRequestDispatcher("pinker/userResult.jsp").forward(request,response);
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
    /*11.管理员登陆 根据登录名和密码登陆*/
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
    /*12.退出登录*/
    protected void loginOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("jump into loginOut...");
        req.getSession().removeAttribute("user");
        resp.getWriter().write("ok");
    }
    /*13.修改密码*/
    protected void updatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("jump into updatePassword...");

        Integer id = Integer.valueOf(req.getParameter("id"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String newPasswordAg = req.getParameter("newPasswordAg");

        /*先验证用户的旧密码对不对，对的话能进行修改*/
        pk_user user = usi.findByUserId(id);

        if(user.getPassword().equals(oldPassword)){
            boolean change = usi.updatePassword(id, newPassword);
            if(change){
                System.out.println("修改成功，开始转发");
                pk_user byUserId = usi.findByUserId(id);
                req.setAttribute("user",byUserId);
                req.getRequestDispatcher("pinker/PersonPage.jsp").forward(req,resp);
            }
        }

    }
    /*14.根据用户id查询当前账号状态*/
    protected void findStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("jump into findStatus...");

        Integer id = Integer.valueOf(req.getParameter("id"));
        usi.findStatusById(id);
    }
}
