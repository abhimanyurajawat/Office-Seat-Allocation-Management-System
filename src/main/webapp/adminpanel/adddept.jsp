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
    <form action="addDeptServlet" method="post">
        <h1>Add Department</h1>
        <div class="textbox">
            <input type="text" placeholder="Department name" name=department required="required">
        </div>                              
        <div class="textbox">
            <input type="text" placeholder="Project" name=project required="required">
        </div>
        <div class="textbox">
            <input type="text" placeholder="Project Manager" name=project_manager required="required">
        </div>
        <div class="textbox">
            <input type="text" placeholder="Technology" name=technology required="required">
        </div>
        <button class="registerbtn" type="submit" value="Add Department">Add Department</button>        
    </form>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("status").value;
if(status == "success") {
	swal("Done","Department Added!!","success")
}
if(status == "failed") {
	swal("Sorry","Error in adding Department!!","error")
}
if(status == "invalidDeptName") {
	swal("Sorry","Please enter Department name!!","error")
}
if(status == "invalidProject") {
	swal("Sorry","Please enter Project name!!","error")
}
if(status == "invalidProjectManager") {
	swal("Sorry","Please enter name of Project Manager!!","error")
}
if(status == "invalidTech") {
	swal("Sorry","Please enter Technology!!","error")
}
</script>
</body>
</html>
