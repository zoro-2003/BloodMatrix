<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, Project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor Certificates</title>
    <style>
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 12px;
            text-align: center;
        }
        .btn {
            padding: 8px 15px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Donor Certificate Panel</h2>
    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Blood Group</th><th>Email</th><th>Generate</th>
        </tr>
        <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Donor");
            while(rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt("id") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("bloodgroup") %></td>
            <td><%=rs.getString("email") %></td>
            <td>
                <form action="generateCertificate.jsp" method="post">
                    <input type="hidden" name="id" value="<%=rs.getInt("id") %>">
                    <button class="btn" type="submit">Generate Certificate</button>
                </form>
            </td>
        </tr>
        <%
            }
        } catch(Exception e) { out.println(e); }
        %>
    </table>
</body>
</html>