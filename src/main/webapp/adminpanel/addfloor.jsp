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
    <link rel="stylesheet" href="addfloor.css">  
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
    <form action="addFloorServlet" method="post">
        <h1>Add Floor</h1>
        <div class="textbox">
            <input type="number" placeholder="Floor number" name="floor" min="1" max="5" required="required">
        </div>
        <div class="textbox">
            <input type="number" id="quantity" min="0" max="100" placeholder="Floor Capacity" name="floorcapacity" required="required">
        </div>  
        <div class="textbox">
            <input type="text" placeholder="Side 1" name="sidel" required="required">
        </div>
        <div class="textbox">
            <input type="number" id="quantity" min="0" max="60" placeholder="Side 1 Capacity" name="sidecapacityl" required="required">
        </div>
        <div class="textbox">
            <input type="number" placeholder="Total Rows in Side 1" name="totalrowsl" min="1" max="4" required="required">
        </div>
        <div class="textbox">
            <input type="number" id="quantity" min="0" max="14" placeholder="Row Capacity of Side 1" name="rowcapacityl" required="required">
        </div> 
        <div class="textbox">
            <input type="text" placeholder="Side 2" name="sider" required="required">
        </div>
        <div class="textbox">
            <input type="number" id="quantity" min="0" max="60" placeholder="Side 2 Capacity" name="sidecapacityr" required="required">
        </div>
        <div class="textbox">
            <input type="number" placeholder="Total Rows in Side 2" name="totalrowsr" min="1" max="4" required="required">
        </div>
        <div class="textbox">
            <input type="number" id="quantity" min="0" max="14" placeholder="Row Capacity of Side 2" name="rowcapacityr" required="required">
        </div>                    
        <input class="registerbtn" type="submit" value="Add Floor">        
    </form>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    var status = document.getElementById("status").value;
	if(status == "success") {
		swal("Done","Floor Added!!","success")
	}
	if(status == "failed") {
		swal("Sorry","Error in adding Floor!!","error")
	}
	if(status == "invalidFloorNumber") {
		swal("Sorry","Please enter correct Floor!!","error")
	}
	if(status == "invalidFloorCapacity") {
		swal("Sorry","Please enter valid floor capacity!!","error")
	}	
	</script>
</body>
</html>
