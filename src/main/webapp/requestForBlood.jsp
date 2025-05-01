<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even) { background-color: #f2f2f2; }
#customers tr:hover { background-color: #ddd; }

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>
<table id="customers">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Email</th>
<th>Blood Group</th>
<th>Done</th>
<th>Delete</th>
</tr>

<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM bloodrequest WHERE status='pending'");
    while (rs.next()) {
        String name = rs.getString(1);
        String mobileNumber = rs.getString(2);
        String email = rs.getString(3);
        String bloodGroup = rs.getString(4);

        // Validate the data to ensure no null values are displayed
        if (name != null && mobileNumber != null && email != null && bloodGroup != null) {
%>
<tr>
<td><%= name %></td>
<td><%= mobileNumber %></td>
<td><%= email %></td>
<td><%= bloodGroup %></td>
<td><a href="requestForBloodDone.jsp?mobilenumber=<%= mobileNumber %>">Done</a></td>
<td><a href="requestForBloodDelete.jsp?mobilenumber=<%= mobileNumber %>">Delete</a></td>
</tr>
<%
        }
    }
} catch (Exception e) {
    System.out.println("Error fetching blood requests: " + e);
}
%>

</table>
</center>
<br><br><br><br>
<h3><center>All Right Reserved To Only Team S.A.V.S.</center></h3>
</body>
</html>
