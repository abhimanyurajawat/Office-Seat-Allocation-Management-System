<% 
	if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Main Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link rel="stylesheet" href="main.css"> 
    <link rel="stylesheet" href="style.css"> 
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
                    <a class="navbar-brand" href="intimetec.com"><img src="images/logo1-1500w.jpg" alt="logo" width="130px" height="25px"></a>
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
                      <li><a href="logout" class="glyphicon glyphicon-log-out">Logout</a></li>
			   </ul>
            </div>
        </nav>
    </header>   
    <main class="min-h-screen">
    	<section class="section1">
    	<div class="justify-center">
    		<h1>Welcome <span  style= "color: rgb(255, 129, 3)"><%=session.getAttribute("name") %>,</span></h1>
    		<h3>Select functionalities from the above options in order to perform various operations on employee seat managing.</h3>
    		<div class="flex">
                    <div class="topleft flex justify-center flex-col px-1">
                        <img src="images/seat1.jpg" alt="image" class="seatings">                        
                    </div>                                        
            </div>            
    	</div>
    	</section>    	
    	<section class="section3 my-2">
    		<h4 class="justify-center">
			"A convenient and easy way to manage employee seating through our online and automated system 'ITT-SAS'. It provides View Seats, Seat Allotment, Seat De-allotment and Rearrangement like features, also one can add new joinees, new departments and new floors for better and easy use."
			</h4>
    	</section>		    
    </main>
</body>
</html>
    