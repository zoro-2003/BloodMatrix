<%@ page import="java.util.*, java.sql.*, java.io.*" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, javax.activation.*" %>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String name = "", email = "", bloodgroup = "";

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("select * from Donor where id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        bloodgroup = rs.getString("bloodgroup");
    }

    // Generate PDF
    String fileName = "certificate_" + name + ".pdf";
    String path = application.getRealPath("/") + fileName;
    Document document = new Document();
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path));
    document.open();

    // Set background certificate design
    Image bg = Image.getInstance(application.getRealPath("/") + "certificate_bg.png");
    bg.setAbsolutePosition(0, 0);
    bg.scaleAbsolute(PageSize.A4);
    document.add(bg);

    // Add dynamic name and blood group (at exact positions)
    PdfContentByte canvas = writer.getDirectContent();
    BaseFont bf = BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.WINANSI, BaseFont.EMBEDDED);
    canvas.setFontAndSize(bf, 18);

    // Name
    canvas.beginText();
    canvas.showTextAligned(Element.ALIGN_CENTER, "Name: " + name, 300, 340, 0); // adjust Y/X as needed
    canvas.endText();

    // Blood Group
    canvas.beginText();
    canvas.showTextAligned(Element.ALIGN_CENTER, "Blood Group: " + bloodgroup, 300, 315, 0);
    canvas.endText();

    // Add signature image
    Image sign = Image.getInstance(application.getRealPath("/") + "signature.png");
    sign.setAbsolutePosition(400, 100); // Adjust based on template
    sign.scaleToFit(100, 50);
    document.add(sign);

    document.close();

    // Send email with attachment
    final String from = "adityashirsat1170@gmail.com";
    final String password = "anxt qrpp bqmp obyi";

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");

    Session mailSession = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
        }
    });

    Message message = new MimeMessage(mailSession);
    message.setFrom(new InternetAddress(from));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
    message.setSubject("Your Blood Donation Certificate");

    BodyPart messageBodyPart = new MimeBodyPart();
    messageBodyPart.setText("Thank you for donating blood. Please find your certificate attached.");

    MimeBodyPart attachmentPart = new MimeBodyPart();
    DataSource source = new FileDataSource(path);
    attachmentPart.setDataHandler(new DataHandler(source));
    attachmentPart.setFileName(fileName);

    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);
    multipart.addBodyPart(attachmentPart);

    message.setContent(multipart);
    Transport.send(message);

    out.println("Certificate sent successfully to " + email);

} catch(Exception e) {
    out.println("Error: " + e.toString());
}
%>
