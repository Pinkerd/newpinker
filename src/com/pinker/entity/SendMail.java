package com.pinker.entity;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by Aries.Gu on 2018/1/15.
 */

public class SendMail extends Thread {


        //用于给用户发送邮件的邮箱
        private String from = "ff978043238@sohu.com";
        //邮箱的用户名
        private String username = "978043238";
        //邮箱的密码
        private String password = "gpf6899667";
        //发送邮件的服务器地址
        private String host = "smtp.qq.com";
        private pk_user user;
        public  void Sendmail(pk_user user){
            this.user = user;
        }
        /* 重写run方法的实现，在run方法中发送邮件给指定的用户
        * @see java.lang.Thread#run()
        */
        @Override
        public void run() {
            try{
                /*设置属性、账号密码*/
                Properties prop = new Properties();
                prop.setProperty("mail.host", host);
                prop.setProperty("mail.transport.protocol", "smtp");
                prop.setProperty("mail.smtp.auth", "true");
                Session session = Session.getInstance(prop);
                session.setDebug(true);
                Transport ts = session.getTransport();
                ts.connect(host, username, password);
                Message message = createEmail(session,user);
                ts.sendMessage(message, message.getAllRecipients());
                ts.close();
            }catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        /**
         * 创建要发送的邮件
         */
        public Message createEmail(Session session,pk_user user) throws Exception{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setSubject("密码找回邮件");
            String info = user.getUsername()+"用户您好，正在通过邮件找回密码！\r\n 请妥善保管，如有问题请联系网站客服!!";
            message.setContent(info, "text/html;charset=UTF-8");
            message.saveChanges();
            return message;
        }
    }
