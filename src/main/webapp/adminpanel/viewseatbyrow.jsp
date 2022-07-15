<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="allot.css">    
    <title>Seats</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section --> 
    <div class="bg-modal">   
        <div class="modal-contents">    
            
            <h1>View Seats Row-wise</h1>   
            <form action="viewseatbyrow" method="post">
                <input type="text" placeholder="Floor number" name="floor" required="required">
                
	            	<input type="text" placeholder="Side" name="side" required="required">	
	            
	            	<input type="text" placeholder="Row" name="rownumber" required="required">
	            				  
                <input class="button" type="submit" id="submit" value="Check">
                
                
            </form>    
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script>
    var status = document.getElementById("status").value;
	if(status == "success") {
		swal("Done","Here is the seatings!!","success")
	}
	if(status == "failed") {
		swal("Sorry","Unable to check seats!!","error")
	}
	</script>
	
	
        </div>
    </div>
</body>
</html>