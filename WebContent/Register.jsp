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
	$("#register").click(function(){

	var uname = $("#uname").val();
	var pwd = $("#password").val();
	
	  var gender1 = [];
      $.each($("input[name='gender']:checked"), function(){            
    	  gender1.push($(this).val());
      });
     gender1.join(", ");
  
	
	
	  var lang1 = [];
      $.each($("input[name='lang']:checked"), function(){            
    	  lang1.push($(this).val());
      });
      lang1.join(", ");
      debugger;
 
	var lang1 = $("#lang").val();
	// Checking for blank fields.
	if( uname =='' || password ==''){
		alert("Please fill all fields...!!!!!!");
	}else {
	
		  $.post("RegisterServlet",
				    {
				        username: uname,
				        password: pwd,
				        gender: gender1,
				        lang: lang1
				    },
				    function(data, status){
				        alert("Data: " + data + "\nStatus: " + status);
				    });
	}
	});
	});
 
</script>

</head>

<head>
<body>
	<div class="container">
		<div class="main">
			<form class="form" method="post" action="#">
				<h2>Create Registration Form Using jQuery</h2>
				<label>Name :</label> <input type="text" name="uname" id="uname">
				<label>Password :</label> <input type="password" name="password" id="password"> 
				<label>Sex :</label>
				<input type="radio" name="gender"  id="gender" value="male" checked> Male
				<input type="radio" name="gender" id="gender" value="female"> Female<br> <br>
				<label>Languages  :</label>
				<input type="checkbox" name="lang"   id="lang"  value="C">C
				<input type="checkbox" name="lang"  id="lang"  value="C++">C++
				<input type="checkbox" name="lang"  id="lang"  value="Java">Java
				<input type="checkbox" name="lang"  id="lang"  value=".NET">.NET<br><br>
				<input type="button" name="register" id="register" value="Register">

			</form>
		</div>
	</div>

</body>
</html>
