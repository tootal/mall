package util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.Security;
import java.util.Date;

public class SendEmail {
    public static void send(String to, String text) throws MessagingException {
        Session session = Session.getInstance(MallProp.getProp(), new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MallProp.get("mail.username"), MallProp.get("mail.password"));
            }
        });
//        session.setDebug(true);
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(MallProp.get("mail.username")));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject("头头商城 发货提醒");
        msg.setText(text, "UTF-8");
        msg.setSentDate(new Date());
        msg.saveChanges();
        Transport.send(msg);
    }

    public static void main(String[] args) throws MessagingException {
        send("tootal@yeah.net", "测试一下哈哈！");
    }
}
