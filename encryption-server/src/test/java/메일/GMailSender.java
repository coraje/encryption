package 메일;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class GMailSender {
	 /**
     * @param args
     */
    public static void main(String[] args) throws Exception {
        // TODO Auto-generated method stub
        String host = "smtp.gmail.com";//smtp 서버
        String subject = "테스트메일";
        String from = "jhj7774@gmail.com"; //보내는 메일
        String fromName = "히트콤";
        String to = "jubilii@naver.com";
        String content = "www.naver.com";
        try{
            // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
            Properties props = new Properties();
            
            // G-Mail SMTP 사용시
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", host);
            props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.auth", "true");
            
            MyAuthenticator auth = new MyAuthenticator("jhj7774@gmail.com", "werwolf9");
            
            Session mailSession = Session.getDefaultInstance(props, auth);
            
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
            InternetAddress[] address = {new InternetAddress(to)};
            
            msg.setRecipients(Message.RecipientType.TO, address);//받는 사람설정
            
            msg.setSubject(subject);// 제목 설정
            msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
//            msg.setContent(content,"text/html;charset=utf-8"); // 내용 설정 (HTML 형식)
            msg.setText(content);
            
            Transport.send(msg); // 메일 보내기
            
            System.out.println("메일 발송을 완료하였습니다.");
        } catch ( MessagingException ex ) {
            System.out.println("mail send error : " + ex.getMessage());
        } catch ( Exception e ) {
            System.out.println("error : " + e.getMessage());
        }
        
    }
}