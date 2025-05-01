<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String bloodgroup = request.getParameter("bloodgroup");
    String address = request.getParameter("address");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Validate required fields
        if (id == null || name == null || mobilenumber == null || bloodgroup == null || address == null) {
            throw new Exception("Required fields are missing.");
        }

        con = ConnectionProvider.getCon(); // Get database connection
        ps = con.prepareStatement("INSERT INTO donor (id, name, father, mother, mobilenumber, gender, email, bloodgroup, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, father);
        ps.setString(4, mother);
        ps.setString(5, mobilenumber);
        ps.setString(6, gender);
        ps.setString(7, email);
        ps.setString(8, bloodgroup);
        ps.setString(9, address);

        ps.executeUpdate(); // Execute the query

        // Redirect to success message
        response.sendRedirect("addNewDonor.jsp?msg=valid");

    } catch (Exception e) {
        // Log the error to server logs for debugging
        e.printStackTrace();

        // Redirect with an error message
        response.sendRedirect("addNewDonor.jsp?msg=invalid&error=" + e.getMessage());

    } finally {
        // Cleanup resources
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
