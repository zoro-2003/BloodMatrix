<%@ page
	import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
<%@ page import="Project.ConnectionProvider"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,
	input[type="number"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	padding: 15px;
	width: 60%;
	border-radius: 25px;
	margin-left: 20%;
}

  
h2, h1 {
	margin-left: 20%;
}

hr {
	width: 60%;
}
</style>
</head>
<body>
<div class="header">
<a href="#default" class="logo"><img class="logo" src="Logoo.png"></a>
<div class="header-right">
    <a href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin</a>
    <a href="addNewDonor.jsp" class="active">Blood Donor Login</a>
    </div>
    </div>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center ><font color="red" size="5">Successfully added</font></center>
<% }%>


<%
if("invalid".equals(msg))
{
%>
<center ><font color="red" size="5">Something Went Wrong! Try Again</font></center>
<% }%>


	<%
	int id = 1;
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select max(id) from Donor");
		if (rs.next()) {
			id = rs.getInt(1)+1;
	

		}
	%>
	<%
	} catch (Exception e) {
	}
	%>
	<div class="container">
		<h1 style="color: red;">
			Donor Id:
			<%
		out.println(id);
		%>
		</h1>
	</div>
	<div class="container">
		<form action="addNewDonorAction.jsp" method="post">
			<input type="hidden" name="id" value="<%out.println(id);%>"></input>
			<h2>Name:</h2>
			<input type="text" placeholder="Enter Name" name="name"></input>
			<hr>
			<h2>Father Name</h2>
			<input type="text" placeholder="Enter Father Name" name="father"></input>
			<hr>
			<h2>Mother Name</h2>
			<input type="text" placeholder="Enter Mother Name" name="mother"></input>
			<hr>
			<h2>Mobile Number</h2>
			<input type="number" placeholder="Enter Mobile Number"
				name="mobilenumber"></input>
			<hr>
			<h2>Gender</h2>
			<select name="gender">
				<option value="male">male</option>
				<option value="female">female</option>
				<option value="other">others</option>
			</select>
			<hr>
			<h2>Email</h2>
			<input type="email" placeholder="Enter Email " name="email"></input>
			<hr>
			<h2>blood Group</h2>
			<select name="bloodgroup">
				<option value="A+">A+</option>
				<option value="A-">A-</option>
				<option value="B+">B+</option>
				<option value="B-">B-</option>
				<option value="AB+">AB+</option>
				<option value="AB-">AB-</option>
				<option value="O+">O+</option>
				<option value="O-">O-</option>
			</select>
			<hr>
			<h2>Address</h2>
			<input type="text" placeholder="Enter  Address" name="address"></input>
			<br>
			<br>
			<center>
				<button type="submit" class="button">SAVE</button>
			</center>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<h3>
		<center>All Right Reserved To Only Team S.A.V.S.</center>
	</h3>

</body>
</html>