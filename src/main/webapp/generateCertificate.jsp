<%@ page import="java.sql.*, Project.ConnectionProvider" %>
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
} catch(Exception e) { out.println(e); }
%>

<html>
<head>
    <style>
        .certificate {
            margin: auto;
            margin-top: 50px;
            padding: 30px;
            border: 5px solid black;
            width: 70%;
            text-align: center;
            font-family: 'Georgia', serif;
            background-color: #f9f3d2;
        }
        .btn {
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="certificate">
        <h1>Certificate of Appreciation</h1>
        <p>This certificate is proudly presented to</p>
        <h2><%= name %></h2>
        <p>For their valuable contribution of <b><%= bloodgroup %></b> blood.</p>
        <p>Thank you for saving lives!</p>

       <form action="sendCertificateAction.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>"/>
    <button type="submit" class="btn">Send Certificate via Email</button>
</form>


    </div>
</body>
</html>
