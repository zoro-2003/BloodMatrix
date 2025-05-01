<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units = request.getParameter("units");

try {
    int units1 = Integer.parseInt(units);
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

    if ("inc".equals(incdec)) {
        st.executeUpdate("UPDATE stock SET units = units + " + units1 + " WHERE bloodgroup = '" + bloodgroup + "'");
    } else {
        st.executeUpdate("UPDATE stock SET units = units - " + units1 + " WHERE bloodgroup = '" + bloodgroup + "'");
    }

    response.sendRedirect("manageStock.jsp?msg=valid");
} catch (Exception e) {
    e.printStackTrace(); // helpful during dev
    response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>
