<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Main Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="main.css">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <header>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><img src="images/logo1-1500w.jpg" alt="" width="130px" height="25px"></a>
                </div>
                <ul class="nav navbar-nav">                    
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Add Information <span class="caret"></span></a>
                    <ul class="dropdown-menu">   
                        <li><a href="addemp.jsp">Add Employee Details</a></li>                     
                        <li><a href="adddept.jsp">Add Department</a></li>
                        <li><a href="addfloor.jsp">Add Floor</a></li>
                    
                    </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">View Seats <span class="caret"></span></a>
                   	<ul class="dropdown-menu">     
                    	<li><a href="viewseat.jsp">Floor-Wise</a></li>                      
                        <li><a href="viewseatbyside.jsp">Side-Wise</a></li>
                        <li><a href="viewseatbyrow.jsp">Row-Wise</a></li> 
                    </ul>                                      
                   </li>                    
                    <li><a href="allot.jsp">Allocation</a></li>
                    <li><a href="deallot.jsp">Deallocation</a></li>
                                       
                </ul>
                <ul class="nav navbar-nav navbar-right">				      				      
                      <li><a><span class="glyphicon glyphicon-user"><%=session.getAttribute("name") %></span></a></li>                      
			   </ul>
            </div>
        </nav>
    </header>
    <form action="addEmpServlet" method="post">
        <h1>Add Employee Details</h1>
        <div class="textbox">
            <input type="text" placeholder="Name" name="name" required="required">
        </div>
        <div class="textbox">
            <input type="text" placeholder="Employee Id" name="empid" required="required">
        </div>
        <div class="textbox">
            <input type="email" placeholder="Email" name="email" required="required">
        </div>              
        <div class="textbox">
            <input type="text" placeholder="Project" name="project" required="required">
        </div>
        <button class="registerbtn" type="submit" value="Add Details">Add Details</button>        
    </form>
    
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "success") {
		swal("Done","Details Added Successfully!!","success")
	}
	if(status == "failed") {
		swal("Sorry","Error while adding Details!!","error")
	}
	if(status == "invalidName") {
		swal("Sorry","Please enter Name!!","error")
	}
	if(status == "invalidId") {
		swal("Sorry","Please enter Id!!","error")
	}
	if(status == "invalidEmail") {
		swal("Sorry","Please enter Email!!","error")
	}
	if(status == "invalidProject") {
		swal("Sorry","Please enter Phone!!","error")
	}	

</script>
</body>
</html>