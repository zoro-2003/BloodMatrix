<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.*, java.io.*" %>

<%
    String to = request.getParameter("email");
    String name = request.getParameter("name");

    final String from = "adityashirsat1170@gmail.com"; // <-- Replace with your email
    final String password = "anxt qrpp bqmp obyi"; // <-- Use App Password if using Gmail

    String subject = "Blood Donation Certificate";
    String body = "Dear " + name + ",\n\nThank you for donating blood. Please find your donation certificate attached.\n\nRegards,\nBlood Bank Team";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session mailSession = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
        }
    });

    try {
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);

        Multipart multipart = new MimeMultipart();
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setText(body);
        multipart.addBodyPart(textPart);

        MimeBodyPart attachmentPart = new MimeBodyPart();
        String certPath = (String) session.getAttribute("certPath");
        attachmentPart.attachFile(new File(certPath));
        multipart.addBodyPart(attachmentPart);

        message.setContent(multipart);
        Transport.send(message);

        out.println("E-Certificate sent successfully to " + to);
    } catch (Exception e) {
        out.println("Error sending certificate: " + e.getMessage());
    }
%>
