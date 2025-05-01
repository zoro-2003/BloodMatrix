<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
</style>
</head>
<body>

	<div class="header">
		<a href="#default" class="logo"><img class="logo" src="Logoo.png"></a>
		<div class="header-right">
			<a class="active" href="index.jsp">Home</a> <a href="adminLogin.jsp">Admin
				</a>
				 <a href="addNewDonor.jsp">Blood Donor Login</a>
				
		</div>
	</div>

	<div style="max-width: 100%">
		<img class="mySlides" src="slide1.jpg"> <img class="mySlides"
			src="slide2.png">
	</div>
	<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<script>
function validateForm() {
    const name = document.getElementById("name").value.trim();
    const mobile = document.getElementById("mobilenumber").value.trim();
    const email = document.getElementById("email").value.trim();
    const bloodgroup = document.getElementById("bloodgroup").value.trim().toUpperCase();

    const bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

    if (name.length < 5) {
        alert("Name must have at least 5 characters.");
        return false;
    }

    if (!/^\d{10}$/.test(mobile)) {
        alert("Mobile number must be exactly 10 digits.");
        return false;
    }

    if (!email.includes("@")) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (!bloodGroups.includes(bloodgroup)) {
        alert("Please enter a valid blood group (A+, A-, B+, B-, AB+, AB-, O+, O-).");
        return false;
    }

    return true; // Form is valid
}
</script>

<body>
	<br>
	<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg))
		{
		%>
	<center>
		<font color="red" size="5">Form Submitted Succefully.You Will
			Get Notified Within 2 Hours</font>
	</center>
	<% 
	}
	%>
	
	<%
	if("invalid".equals(msg))
		{
		%>
	<center>
		<font color="red" size="5">Invalid Data! Try Again!</font>
	</center>
	<% 
	}
	%>
	
	<center>
		<h1>Enter your details request your for blood</h1>
	</center>
	<form action="indexFormAction.jsp" method="post" onsubmit="return validateForm()">
    <center>
        <input type="text" name="name" id="name" placeholder="Enter name" required>
        <input type="text" name="mobilenumber" id="mobilenumber" placeholder="Enter mobile no" required>
        <input type="text" name="email" id="email" placeholder="Enter email address" required>
        <input type="text" name="bloodgroup" id="bloodgroup" placeholder="Enter blood group (e.g. A+)" required>
        <button class="button1"><span>Submit</span></button>
    </center>
</form>

	<br> 
	<br>
	</div>
	</div>

	<div class="row1">
		<div class="container">
			<br> <br>
			</tbody>
			</table>
		</div>
	</div>
	<h3>
		<center>All Right Reserved To Only Team S.A.V.S.</center>
	</h3>

</body>
</html>