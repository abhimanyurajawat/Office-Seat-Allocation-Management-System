<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="allot.css">    
    <title>Row-wise Checking</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section -->    
    <div class="bg-modal">
        <div class="modal-contents">    
            
            <h1>Row-wise Check On <%= session.getAttribute("rownumber") %> Side</h1>  
            <br>             
            <form action="viewseatbyrow" method="post">            
            <h3>Total Seats : <%=session.getAttribute("rowcapacity") %></h3>
            <h3>Occupied Seats : <%=session.getAttribute("count(empid)") %></h3>
            
			<%
				Integer occupiedSeats = Integer.valueOf((String)session.getAttribute("count(empid)"));
				Integer RowCapacity = Integer.valueOf((String)session.getAttribute("rowcapacity"));
				int totalAvailableSeats =  RowCapacity - occupiedSeats ;
				
				
			%>
			<h3 id=>Available Seats : <%= totalAvailableSeats %></h3>
            </form>             
    
        </div>
    </div>
</body>
</html>