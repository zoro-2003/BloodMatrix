<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String email = request.getParameter("email");
    String address = request.getParameter("address");

    if (id == null || id.isEmpty()) {
        response.sendRedirect("editDeleteList.jsp?msg=invalid&error=Missing ID");
        return;
    }

    try (Connection con = ConnectionProvider.getCon()) {
        String query = "UPDATE donor SET name=?, father=?, mother=?, mobilenumber=?, email=?, address=? WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, father);
            ps.setString(3, mother);
            ps.setString(4, mobilenumber);
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, id);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("editDeleteList.jsp?msg=valid");
            } else {
                response.sendRedirect("editDeleteList.jsp?msg=invalid&error=Update failed");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editDeleteList.jsp?msg=invalid&error=" + e.getMessage());
    }
%>
