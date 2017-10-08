<!--index.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/style.css" />
<!-- ..//JQuery Source\\.. -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<!-- ..//JavaScript Code for this page\\.. -->
<script type="text/javascript">

$(document).ready(function(){
	$("#login").click(function(){
		
	var uname = $("#userName").val();
	var pwd = $("#password").val();
	// Checking for blank fields.
	if( uname =='' || password ==''){
		alert("Please fill all fields...!!!!!!");
	}else {
	
		  $.post("LoginServlet",
				    {
				        "username": uname,
				        "password": pwd
				    },
				    function(responseText, status){
				    	var responseJson = eval('(' + responseText + ')');
				    	if (responseJson.success) {
				    	    window.location = responseJson.location;
				    	} else {
				    	  alert("Login Failed")
				    	}
				    	alert(data);
				    });
	}
	});
	});
 
</script>

</head>
<body>
	<div class="container">
		<div class="main">
			<form class="form" method="post" action="#">
				<h2>Create Login Form Using jQuery</h2>
				<label>User Name :</label> <input type="text" name="userName" id="userName">
				<label>Password :</label> <input type="password" name="password"
					id="password"> <input type="button" name="login" id="login"
					value="Login">
			</form>
			<a href="Register.jsp">New user Register Here</a>
		</div>
		
	</div>
</body>
</html>