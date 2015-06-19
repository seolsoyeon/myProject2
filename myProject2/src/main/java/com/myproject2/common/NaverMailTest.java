package com.myproject2.common;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class NaverMailTest {
	public StringBuffer send(String email) throws MessagingException{
        // 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = "r_turn";
        final String password = "1q2w3e";
        int port=465;
    
        //비밀번호 변경된 번호

        Random rnd =new Random();
        StringBuffer buf =new StringBuffer();
         
        for(int i=0;i<8;i++){
            if(rnd.nextBoolean()){
                buf.append((char)((int)(rnd.nextInt(26))+97));
            }else{
                buf.append((rnd.nextInt(10))); 
            }
        }

        System.out.println("random : "+buf);
        
        //DB가서 업데이트 한다.
        
        
        // 메일 내용
        String recipient = email; //여기 받는놈
        String subject = "비밀번호 메일입니다. ";
        String body =("임시 비밀번호 입니다. : " +buf.toString()
        					 +"\n"+" 비밀번호를 꼭 변경해주세요."
        					+"\n"+"비밀번호 변경하러 가기 - "+"http://localhost:9000/pro1/jsp/main.jsp");
        
        
        
        
         
        Properties props = System.getProperties();
        
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
          
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug thefarseer@naver.com
          
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("r_turn@naver.com"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
        
        return buf;
    }

}