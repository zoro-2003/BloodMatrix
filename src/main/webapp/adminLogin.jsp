<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	margin-left: 35%;
	padding: 15px;
	width: 33%;
	border-radius: 25px;
}
</style>
</head>
<body>
	<div class="header">
		<a href="#default" class="logo"><img class="logo" src="Logoo.png"></a>
		<div class="header-right">
			<a href="index.jsp">Home</a> 
			<a class="active" href="adminLogin.jsp">Admin</a>
				<a href="addNewDonor.jsp">Blood Donor Login</a>
				
				
		</div>
	</div>
<body>
	<div class="container">
		<br> <br>
		<%
		String msg=request.getParameter("msg");
		if("invalid".equals(msg)){
		%>
		<center><font color="red" size="5">Invalid Username/Password.</font></center>
		<%
		
		}%>
		<form action="adminLoginAction.jsp" method="post">
			<div class="form-group">
				<center>
					<h2>Username</h2>
				</center>
				<input type="text" placeholder="enter user name" name="username" required>
					<center><h2>Password</h2></center>
					<input type="password" placeholder="enter your password" name="password" required>
					<button type="submit" class="button">Submit</button>
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
