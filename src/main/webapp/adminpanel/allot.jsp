<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="allocate.css">    
    <title>Allocation</title>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <!-- Modal Section -->    
    <div class="bg-modal">
        <div class="modal-contents">    
            
            <h1>Employee Seat Allocation</h1>   
            <form action="allotServlet" method="post">
                <input type="text" placeholder="Employee ID" name="empid" required="required">
                <input type="text" placeholder="Floor" name="floor" required="required">
                <input type="text" placeholder="Floor Capacity" name="floorcapacity" required="required">                
                <input type="text" placeholder="Side" name="side" required="required">
                <input type="text" placeholder="Side Capacity" name="sidecapacity" required="required">                
                <input type="text" placeholder="Row" name="rownumber" required="required">
                <input type="text" placeholder="Row Capacity" name="rowcapacity" required="required">                
                <input type="text" placeholder="Seat Number" name="seatnumber" required="required">               
                <input class="button" type="submit" id="submit" value="Allocate">
            </form> 
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    var status = document.getElementById("status").value;
	if(status == "success") {
		swal("Done","Seat Allotment Completed!!","success")
	}
	if(status == "failed") {
		swal("Sorry","Error in Allocating seat!!","error")
	}
	if(status == "invalidEmployeeId") {
		swal("Sorry","Please enter correct ID!!","error")
	}
	if(status == "invalidFloor") {
		swal("Sorry","Please enter correct Floor!!","error")
	}
	if(status == "invalidSide") {
		swal("Sorry","Please enter correct Side!!","error")
	}
	if(status == "invalidRowNumber") {
		swal("Sorry","Please enter correct Row!!","error")
	}
	if(status == "invalidSeatNumber") {
		swal("Sorry","Please enter correct Seat number!!","error")
	}
	if(status == "invalidFloorCapacity") {
		swal("Sorry","Please enter correct Floor Capacity!!","error")
	}
	</script>   
        </div>
    </div>
</body>
</html>