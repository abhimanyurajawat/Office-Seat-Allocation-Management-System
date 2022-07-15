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
    <title>De-Allocation</title>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section -->    
    <div class="bg-modal">
        <div class="modal-contents">    
            
            <h1>Deallocation</h1>   
            <form action="deallotServlet" method="post">
                <input type="text" placeholder="Employee Id" name="empid" required="required">                
                <input class="button" type="submit" id="submit" value="DeAllocate">
            </form>   
            
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    var status = document.getElementById("status").value;
	if(status == "success") {
		swal("Done","Seat Released!!","success")
	}
	if(status == "failed") {
		swal("Sorry","Error in Deallocating seat!!","error")
	}	
	</script>  
        </div>
    </div>
</body>
</html>