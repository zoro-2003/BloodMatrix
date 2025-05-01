<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.io.*, java.util.*" %>

<%
    String name = request.getParameter("name");
    String bloodGroup = request.getParameter("bloodGroup");

    String path = application.getRealPath("/") + "generated_certificates/";
    new File(path).mkdirs();
    String fileName = "Certificate_" + name.replaceAll(" ", "_") + ".pdf";
    String filePath = path + fileName;

    Document document = new Document(PageSize.A4);
    PdfWriter.getInstance(document, new FileOutputStream(filePath));
    document.open();

    // Background image (optional)
    Image bg = Image.getInstance(application.getRealPath("/") + "images/certificate_bg1.png");
    bg.scaleAbsolute(PageSize.A4);
    bg.setAbsolutePosition(0, 0);
    document.add(bg);

    // Logo
    Image logo = Image.getInstance(application.getRealPath("/") + "images/bloodmatrix_logo.png");
    logo.scaleToFit(80, 80);
    logo.setAbsolutePosition(50, 750);
    document.add(logo);

    // Fonts
    Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 22, Font.BOLD);
    Font contentFont = new Font(Font.FontFamily.TIMES_ROMAN, 14);

    // Title
    Paragraph title = new Paragraph("Certificate of Blood Donation", titleFont);
    title.setAlignment(Element.ALIGN_CENTER);
    title.setSpacingBefore(100);
    document.add(title);

    // Content
    Paragraph para = new Paragraph("\n\nThis certifies that\n\n", contentFont);
    para.setAlignment(Element.ALIGN_CENTER);
    document.add(para);

    Paragraph namePara = new Paragraph("Name: " + name + "\nBlood Group: " + bloodGroup, contentFont);
    namePara.setAlignment(Element.ALIGN_CENTER);
    document.add(namePara);

    Paragraph thanks = new Paragraph("\n\nThank you for your valuable blood donation.\nYou have contributed to saving a life.", contentFont);
    thanks.setAlignment(Element.ALIGN_CENTER);
    document.add(thanks);

    // Signature
    Image sign = Image.getInstance(application.getRealPath("/") + "images/signature.png");
    sign.scaleToFit(100, 50);
    sign.setAbsolutePosition(400, 100);
    document.add(sign);

    Paragraph footer = new Paragraph("\n\nBloodMatrix Team", contentFont);
    footer.setAlignment(Element.ALIGN_RIGHT);
    footer.setSpacingBefore(50);
    document.add(footer);

    document.close();

    out.println("Certificate Generated: <a href='generated_certificates/" + fileName + "' target='_blank'>Download</a>");
%>
