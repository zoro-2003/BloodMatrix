<%@ page import="javax.mail.*,javax.mail.internet.*,java.util.*" %>
<%
String to = request.getParameter("email");
String name = request.getParameter("name");

String subject = "Blood Donation Certificate";
String messageContent = "Dear " + name + ",\n\nThank you for donating blood. Attached is your certificate.\n\n-Team S.A.V.S.";

Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.ssl.protocols", "TLSv1.2");


Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("adityashirsat1170@gmail.com", "anxt qrpp bqmp obyi");  // App password
    }
});

try {
    Message message = new MimeMessage(mailSession);
    message.setFrom(new InternetAddress("adityashirsat1170@gmail.com"));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
    message.setSubject(subject);
    message.setText(messageContent);

    Transport.send(message);
    out.println("<center><h2>Email Sent Successfully!</h2></center>");
} catch (Exception e) {
    out.println("<center><h2>Failed to Send Email.</h2></center>");
    out.println(e);
}
%>
