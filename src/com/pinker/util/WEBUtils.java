package com.pinker.util;


import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.*;
import java.util.Enumeration;

public class WEBUtils {

    public static <T>T para2bean(HttpServletRequest request, Class<T> clazz){
        T t=null;
        try {
            t=clazz.newInstance();
            BeanUtils.populate(t,request.getParameterMap());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }



    public static String getServerUrl(HttpServletRequest request) {
        String url=request.getServerName();
        int serverPort= request.getServerPort();
        String contextPath=request.getContextPath();

        InetAddress is=null;
        String ip=null;
        try {
            is=InetAddress.getLocalHost();
            ip=is.getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }


        return  "http://"+ip+":"+serverPort+contextPath;
    }
}
