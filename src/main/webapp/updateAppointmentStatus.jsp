<%@ page import="java.sql.*" %>
<jsp:useBean class="Project.ConnectionProvider" />

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String status = request.getParameter("status");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("UPDATE appointments SET status=? WHERE id=?");
        ps.setString(1, status);
        ps.setInt(2, id);
        ps.executeUpdate();
        response.sendRedirect("viewAppointments.jsp");
    } catch(Exception e) {
        out.println(e);
    }
%>
