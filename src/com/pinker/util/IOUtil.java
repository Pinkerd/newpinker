package com.pinker.util;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class IOUtil {


    /**
     * 按照图片路径读取图片并显示到页面
     * @param imgPath
     * @param request
     * @param response
     */
    public static void readImg(String imgPath, HttpServletRequest request, HttpServletResponse response){
        ServletOutputStream out = null;
        FileInputStream ips = null;
        try {
            //获取图片存放路径
            ips = new FileInputStream(new File(imgPath));
            response.setContentType("multipart/form-data");
            out = response.getOutputStream();
            //读取文件流
            int len = 0;
            byte[] buffer = new byte[1024 * 10];
            while ((len = ips.read(buffer)) != -1){
                out.write(buffer,0,len);
            }
            out.flush();
        }catch (Exception e){
            System.out.println("使用默认头像");
        }finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ips.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
