<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<form action="loginServlet" method="post">
        <h1>Login</h1>
        <div class="textbox1">
            <input type="text" placeholder="ITT/EMP/0000" name="empid" required="required">
        </div>
        <div class="textbox1">
            <input type="password" placeholder="Password (8 characters)" name="password" pattern=".{8}" required="required">
        </div>
        <br>
        <button class="loginbtn" type="submit" id="submit" value="Login">Login</button>          
    </form>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed") {
		swal("Sorry","Try again with correct Employee Id and Password!!","error")
	}
	if(status == "invalidId") {
	swal("Sorry","Please enter Employee ID!!","error")
	}
	if(status == "invalidPassword") {
	swal("Sorry","Please enter Password!!","error")		
	}

</script>
</body>
</html>
