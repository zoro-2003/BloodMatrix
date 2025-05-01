package Project;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    public static void send(String to, String subject, String messageText) throws MessagingException {
        String from = "adityashirsat1170@gmail.com"; // Your Gmail
        String password = "anxt qrpp bqmp obyi"; // Your App Password

        // Validate recipient
        if (to == null || to.isEmpty()) {
            throw new MessagingException("Recipient email address is empty");
        }

        // SMTP server configuration (TLS with port 587)
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Ensures proper TLS support

        // Auth session
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(messageText);

            Transport.send(message);
            System.out.println("Email sent successfully to " + to);
        } catch (MessagingException e) {
            System.out.println("Error sending email: " + e.getMessage());
            throw e;
        }
    }
}
