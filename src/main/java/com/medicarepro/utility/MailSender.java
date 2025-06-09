package com.medicarepro.utility;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class MailSender {

    public static void sendEmail(String toEmail, String subject, String messageText) throws MessagingException {
        final String fromEmail = "pallapusuresh2000@gmail.com"; // your Gmail
        final String password = "jtpboasrojjvmxzt";     // use app-specific password (not your Gmail password)

        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setText(messageText);

        Transport.send(message);
    }
}
