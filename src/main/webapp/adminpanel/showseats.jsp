<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="allot.css">    
    <title>Floor-wise Checking</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section -->    
    <div class="bg-modal">
        <div class="modal-contents">    
            
            <h1>Floor-wise Check On <%= session.getAttribute("floor") %> Floor</h1>  
            <br>             
            <form action="viewSeatServlet" method="post">            
            <h3>Total Seats : <%=session.getAttribute("floorcapacity") %></h3>
            <h3>Occupied Seats : <%=session.getAttribute("count(empid)") %></h3>
            
			<%
				Integer occupiedSeats = Integer.valueOf((String)session.getAttribute("count(empid)"));
				Integer floorCapacity = Integer.valueOf((String)session.getAttribute("floorcapacity"));
				int totalAvailableSeats =  floorCapacity - occupiedSeats;	
				
			%>
			<h3 id=>Available Seats : <%= totalAvailableSeats %></h3>
            </form>             
    
        </div>
    </div>
</body>
</html>