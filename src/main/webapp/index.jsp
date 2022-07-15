<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="modal.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">     
    <title>ITTSAS</title>
</head>
<body>
        <header>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <div class="container-fluid">               
                    <div class="container">
                        <a class="navbar-brand" href="intimetec.com">
                            <img src="images/logo1-1500w.jpg" width="120" height="28">
                        </a>
                    </div>                                                               
                    <div class="collapse navbar-collapse" id="mynavbar">
                        
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link">AddInfo</a>
                            </li>                            
                            <li class="nav-item">
                                <a class="nav-link">Allocation</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Deallocation</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">ViewSeats</a> 
                            </li>                            
                            <li>
                                <a href="login.jsp"><button class="btn1" type="submit">Login</button></a>  
                            </li>
                        </ul>                      
                    </div>                        
                </div>
            </nav>
        </header>          

        <main class="min-h-screen">
            <section class="section1">
                <div class="flex">
                    <div class="topleft flex justify-center flex-col px-1">
                        <img src="images/download.png" alt="image" class="logo">
                        <h1 class="my-1">Seat Allocation System</h1>
                        <p class="para1">Automated Systematic way to arrange employee seats <br> with ease and safe access to information</p>
                    </div>
                    <div class="topright flex flex-col justify-center px-1">
                        <img class="seating" src="images/seats.jpg">
                    </div>
                    <p class="para2">It provides a convenient and much flexible software system to Operations Executives <br> for a better and efficient seating management of employees in a company</p>
                </div>
            </section>
            <hr>
            <section class="section2 my-2">
                <h3 class="text-center">Our Services</h3>
                <p>Performs operations in few clicks on a single screen <br> and provides a good interface</p>
                <div class="flex">
                    <div class="midleft flex justify-center flex-col px-1">
                        <a class="benefits" href="#"><i class="fa-solid fa-crosshairs"></i></a>
                        <h5>More Efficient</h5>
                        <p>Takes less time and <br> works fast</p>
                    </div>
                    <div class="midmid flex justify-center flex-col px-1">
                        <a class="benefits" href="#"><i class="fa-brands fa-usps"></i></a>
                        <h5>Productive</h5>
                        <p>Flexible, easy to use features makes<br> it more user friendly</p>
                    </div>
                    <div class="midright flex justify-center flex-col px-1">
                        <a class="benefits" href="#"><i class="fa-solid fa-person-skating"></i></a>
                        <h5>Scalable</h5>
                        <p>Highly desirable for <br> future extensions</p>
                    </div>
                </div>
            </section>
            <hr>
            <section class="section3 my-2">
                <h3 class="text-center">How we work ?</h3>
                <p>We allocate seats on the basis of project assigned to employees<br> and the availability of seats in office</p>
                <div class="flex">
                    <div class="bottomleft flex justify-center flex-col px-1">
                        <a class="phase" href="#"><i class="fa-duotone fa-1"></i></a>
                        <h5>Add Employees</h5>
                        <p>Registration by using few <br> details of employees</p>
                    </div>                    
                    <div class="bottomsecond flex justify-center flex-col px-1">
                        <a class="phase" href="#"><i class="fa-duotone fa-2"></i></a>
                        <h5>View Seats</h5>
                        <p>Floor wise checking of <br> seat availability</p>
                    </div>
                    <div class="bottomthird flex justify-center flex-col px-1">
                        <a class="phase" href="#"><i class="fa-duotone fa-3"></i></a>
                        <h5>Analyzing</h5>
                        <p>Analyze through given task and <br> project manager assigned</p>
                    </div>
                    <div class="bottomright flex justify-center flex-col px-1">
                        <a class="phase" href="#"><i class="fa-duotone fa-4"></i></a>
                        <h5>Seat allotment</h5>
                        <p>Allocation of seats by using <br> employee details</p>
                    </div>
                </div>
            </section>
        </main> 
        <footer class="footer">                
            <div class="outer-footer social-links">Copyright &copy; In Time Tec. | All Rights Reserved
                <ul>
                    <li class="social-items"><a href="https://www.facebook.com/InTimeTec/"><i class="fa-brands fa-facebook-square"></i></a></li>
                    <li class="social-items"><a href="https://www.twitter.com/intime_tec"><i class="fa-brands fa-twitter-square"></i></a></li>
                    <li class="social-items"><a href="https://www.instagram.com/intimetec_/"><i class="fa-brands fa-instagram-square"></i></a></li>
                    <li class="social-items"><a href="https://www.linkedin.com/company/in-time-tec"><i class="fa-brands fa-linkedin"></i></a></li>
                </ul>
            </div>
        </footer>    
    <div class="arrow-btn">
        <a href="#"><span class="fas fa-angle-up"></span></a>
    </div>    
</body>
</html>