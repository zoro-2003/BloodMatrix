<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="Project.EmailSender" %>
<%@ page import="javax.mail.*" %>
<%
String mobileNumber = request.getParameter("mobilenumber");

try {
    // Establish database connection
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE bloodrequest SET status='completed' WHERE mobilenumber=?");
    ps.setString(1, mobileNumber);
    int i = ps.executeUpdate();

    if (i > 0) {
        // Get email of the user from the database
        PreparedStatement ps2 = con.prepareStatement("SELECT email FROM bloodrequest WHERE mobilenumber=?");
        ps2.setString(1, mobileNumber);
        ResultSet rs = ps2.executeQuery();
        if (rs.next()) {
            String email = rs.getString("email");
            // Send email notification
            String subject = "Blood Request Update";
            String messageText = "Your blood request has been successfully processed. Thank you for using our service!";
            EmailSender.send(email, subject, messageText);
        }
        out.println("<script>alert('Status updated and Email sent successfully!');window.location='requestForBlood.jsp';</script>");
    } else {
        out.println("<script>alert('Status update failed!');window.location='requestForBlood.jsp';</script>");
    }
} catch (Exception e) {
    // Print the full error message to understand the issue
    e.printStackTrace();
    out.println("<script>alert('Error occurred: " + e.getMessage() + "');window.location='requestForBlood.jsp';</script>");
}
%>
