package com.pinker.service;

import com.pinker.service.Impl.TopicServiceImpl;
import org.junit.jupiter.api.Test;

import java.net.*;
import java.util.Enumeration;

class TopicServiceTest {
    @Test
    void uploadTopic() throws SocketException {
        TopicService topicService= new TopicServiceImpl();

        Enumeration allNetInterfaces= NetworkInterface.getNetworkInterfaces();
        InetAddress ip=null;
        while(allNetInterfaces.hasMoreElements()){
            NetworkInterface networkInterface= (NetworkInterface) allNetInterfaces.nextElement();
            java.util.Enumeration address=networkInterface.getInetAddresses();
            while (address.hasMoreElements()){
                ip= (InetAddress) address.nextElement();
                if (ip != null&&ip instanceof Inet4Address) {
                    System.out.println("http://"+ip);
                }
            }
        }

    }


    @Test
    public void getUrlTest(){
        try {

            InetAddress is=null;
            is=InetAddress.getLocalHost();
            String ip=is.getHostAddress();
            System.out.println(ip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

    }
}