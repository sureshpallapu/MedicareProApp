<%@ page
	import="jakarta.mail.*, jakarta.mail.internet.*, java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

// SMTP credentials
final String senderEmail = "pallapusuresh2000@gmail.com"; // your Gmail
final String senderPassword = "jtpboasrojjvmxzt"; // app password (NOT Gmail login password)

// SMTP Server Settings
Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");

// Create a mail session
Session mailSession = Session.getInstance(props, new Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(senderEmail, senderPassword);
	}
});

try {
	// ✅ Send Email to Admin
	Message adminMsg = new MimeMessage(mailSession);
	adminMsg.setFrom(new InternetAddress(senderEmail));
	adminMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("pallapusuresh2000@gmail.com"));
	adminMsg.setSubject("New Enquiry from " + name);
	adminMsg.setText("Name: " + name + "\nEmail: " + email + "\nSubject: " + subject + "\nMessage:\n" + message);

	Transport.send(adminMsg);

	// ✅ Auto-reply to User
	Message userMsg = new MimeMessage(mailSession);
	userMsg.setFrom(new InternetAddress(senderEmail));
	userMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	userMsg.setSubject("Thank You for Contacting MediCarePro");
	userMsg.setText("Dear " + name
	+ ",\n\nThank you for contacting MediCarePro.We have received your enquiry and will get back to you shortly.\n\nBest regards,\nMediCarePro Team");

	Transport.send(userMsg);

	out.println("<h3 style='color:green;'>Your enquiry has been submitted successfully!</h3>");

} catch (Exception e) {
	e.printStackTrace(new java.io.PrintWriter(out)); // ✅ Correct way
	out.println("<h3 style='color:red;'>Failed to send enquiry. Please try again later.</h3>");
}
%>
