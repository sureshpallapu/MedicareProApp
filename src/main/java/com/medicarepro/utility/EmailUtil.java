package com.medicarepro.utility;

import jakarta.mail.*;


import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailUtil {
	public static void sendEmail(String toEmail, String subject, String messageText) throws MessagingException {
		final String fromEmail = "pallapusuresh2000@gmail.com";
		final String password = " jtpboasrojjvmxzt"; // Use App Password if 2FA is on

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // or your SMTP server
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		Message msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(fromEmail));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		msg.setSubject(subject);
		msg.setText(messageText);

		Transport.send(msg);
	}
}
