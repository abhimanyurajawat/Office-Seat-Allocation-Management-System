<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="allot.css">    
    <title>Side-wise Checking</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section -->    
    <div class="bg-modal">
        <div class="modal-contents">    
            
            <h1>Side-wise Check On <%= session.getAttribute("side") %> Side</h1>  
            <br>             
            <form action="viewSeatServletSide" method="post">            
            <h3>Total Seats : <%=session.getAttribute("sidecapacity") %></h3>
            <h3>Occupied Seats : <%=session.getAttribute("count(empid)") %></h3>
            
			<%
				Integer occupiedSeats = Integer.valueOf((String)session.getAttribute("count(empid)"));
				Integer SideCapacity = Integer.valueOf((String)session.getAttribute("sidecapacity"));
				int totalAvailableSeats =  SideCapacity - occupiedSeats;
				
				if(totalAvailableSeats==0) {
					 System.out.print("Full !!, Please check another side");
				}
				
				
			%>
			<h3 id=>Available Seats : <%= totalAvailableSeats %></h3>
			<h3><% %></h3>
            </form>             
    
        </div>
    </div>
</body>
</html>