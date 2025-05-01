<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
    String id = request.getParameter("id");

    if (id == null || id.isEmpty()) {
        response.sendRedirect("editDeleteList.jsp?msg=invalid&error=Missing ID");
        return;
    }

    try (Connection con = ConnectionProvider.getCon()) {
        String query = "DELETE FROM donor WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, id);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("editDeleteList.jsp?msg=delete");
            } else {
                response.sendRedirect("editDeleteList.jsp?msg=invalid&error=Delete failed");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editDeleteList.jsp?msg=invalid&error=" + e.getMessage());
    }
%>
