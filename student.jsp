<%-- 
    Document   : student
    Created on : 30 Mar, 2019, 3:13:18 PM
    Author     : birendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Page</title>
    <link rel="stylesheet" type="text/css" href="CSS/ham1.css">
    <link rel="stylesheet" type="text/css" href="CSS/com.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".menu-icon").click(function(){
                $(".menu-icon").toggleClass("active");
            })
            
            $(".menu-icon").click(function(){
                $(".sidebar").toggleClass("active");
            })
//            $('#num').click( function(){
//                prompt("Enter Bus Number");
//                $(this).attr("href","view.html");
//            });
//            $('#route').click( function(){
//                prompt("Enter Bus Route");
//                $(this).attr("href","view.html");
//            });
//            $("#s").mouseenter(function(){
//                $("#s").addClass("animated bounce");
//            });
        });
        </script>
    
</head>
<body>
    <section class="sec1">
        <div class="slider">
                <div class="menu-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                        </div>    
                        <div class="sidebar">
                              
                    <div class="menu-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                        </div>    
                            <img class="user" src="Image/user.jpeg">
                            <p><% String str = (String)request.getSession().getAttribute("acc");%>
                                Account Type : <%=str%>
                            </p>
                            <p>
                                <% String id = (String)request.getSession().getAttribute("name"); %>
                                
                                Name : <%=id%>
                            </p>
                            <p>
                                <% String em = (String)request.getSession().getAttribute("id");%>
                                User ID : <%=em%>
                            </p>
                            <p class="view">View</p>
                            <ul class="menu">
                                <li> <a href="BusNo.html" id="num" target="_self">By Bus Number</a></li>
                                <li> <a href="Route.html" id="route" target="_self" > By Route</a></li>
                                <li> <a href="ViewAll.html" target="_self"> View All </a></li>
                            </ul>
                        </div>
            <div class="load">
                <img class="bus" src="Image/bus.png">
                <div class="nav">
                    <div class="container">
                        <a href="#">Home</a>
                    </div>
                    <div class="container">
                        <a href="#">About Us</a>
                    </div>
                    <div class="container">
                        <a href="#contact">Contact</a>
                    </div>
                    <div class="container">
                        <a href="#notice">Notice</a>
                    </div>
                    <div class="container">
                        <a href="login.html">Logout</a>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="principal">
                    <h1>Website</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus perspiciatis atque adipisci dolores voluptatem doloribus veritatis molestiae, ipsum eaque expedita itaque? Fugiat omnis error cumque cupiditate incidunt, corporis facilis. Odio!</p>
                </div>
            </div>
        </div>
        
    </section>
    <section class="sec2">
        <div class="mid">
            <div class="sub1" style="background-color:rgb(131, 163, 173)" id="s">
                <img class="img" src="Image/i1.png"/>
                <div class="sub2">
                    <h1>Students</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa iusto consectetur odio voluptates. Repellendus quaerat tenetur qui quae adipisci quibusdam sint odio</p>
                </div>
            </div>
            <div class="sub1" style="background-color:rgb(84, 189, 84)">
                <img class="img" src="Image/i2.png"/>
                <div class="sub2" id="s1">
                    <h1>Faculty</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa iusto consectetur odio voluptates. Repellendus quaerat tenetur qui quae adipisci quibusdam sint odio</p>
                </div>
            </div>
            <div class="sub1" style="background-color:purple" id="s2">
                <img class="img" src="Image/i3.png"/>
                <div class="sub2">
                    <h1>Driver</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa iusto consectetur odio voluptates. Repellendus quaerat tenetur qui quae adipisci quibusdam sint odio</p>
                </div>
            </div>
            <div class="sub1" style="background-color:red" id="s3">
                <img class="img" src="Image/i4.png"/>
                <div class="sub2">
                    <h1>Staff</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa iusto consectetur odio voluptates. Repellendus quaerat tenetur qui quae adipisci quibusdam sint odio</p>
                </div>
            </div>
        </div>
    </section>
    <section class="sec4" >
       <!-- <img class="sec4_img" src="Image/imag4.jpg"/> -->
       <div class="sec4_Main">
           <div class="left" id="notice">
                <h1>Notice</h1>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Excepturi adipisci laboriosam fugiat tenetur hic deserunt, error voluptate saepe inventore sed repellendus quae temporibus harum magnam expedita dolor totam velit eum!</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores rem saepe veniam odit consectetur perferendis ex? Alias aut quos doloribus perspiciatis, magni eos, vero quam laboriosam unde incidunt sunt error?</p>
            </div>
           <div class="right">
               <h1>Map</h1>
               <p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3424.334201426884!2d76.87006231466631!3d30.877310585702315!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ff55d9e0ed113%3A0x34a6cadf9a13d341!2sChitkara+University!5e0!3m2!1sen!2suk!4v1551017694066" width="650" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
               </p>
           </div>
       </div>
    </section>
    <section class="sec3" id="contact">
        <div class="foo">
            <h1>CONTACTS</h1>
            <p><i class="fa fa-map-marker" aria-hidden="true"></i> hdlsn ljsaln jlahs ljds</p>
            <p><i class="fa fa-phone" aria-hidden="true"></i> 29-1232326</p>
            <p><i class="fa fa-envelope" aria-hidden="true"></i>usui7@gmail.com</p>
        </div>
        <div class="foo">
            <h1>LINKS</h1>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home" aria-hidden="true"></i>Home</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-users" aria-hidden="true"></i>About Us</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-newspaper-o" aria-hidden="true"></i>Notice</p>
        </div>
        <div class="foo">
             <h1>SUBSCRIBE US!</h1>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" placeholder="Enter Email Address"><br>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>Subscribe</button>
        <br>
        <h1>Connect with Us</h1>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b class="contacts"><i class="fa fa-twitter-square" aria-hidden="true"></i><i class="fa fa-facebook-square" aria-hidden="true"></i><i class="fa fa-instagram" aria-hidden="true"></i></b>
            </div>
    </section>
    <footer>
            Copyright ©2019 All rights reserved | This template is made with  by Biren
    </footer>
</body>
</html>
