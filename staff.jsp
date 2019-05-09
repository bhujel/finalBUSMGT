<%-- 
    Document   : staff
    Created on : 30 Mar, 2019, 5:00:21 PM
    Author     : birendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Staff Page</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/admin1.css">
        <script type="text/javascript" src="jquery-3.3.1.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/animate.css"/>
        <style>
            h1{
                position: relative;
                font-size: 50px;
                color: white;
                text-align: center;
                top:30%;
            }
        </style>
        <script>
            $(document).ready(function(){
                $("#c1").click(function(){
                    $("h1").toggle(2000);
                    $("#c2").toggle(2000);
                });
                
                $("#u1").click(function(){
                    $("h1").toggle(2000);
                    $("#u2").toggle(2000);
                });
                $("#e1").click(function(){
                    $("h1").toggle(2000);
                    $("#e2").toggle(2000);
                });
                $("#v1").click(function(){
                    $("h1").toggle(2000);
                    $("#v2").toggle(2000);
                });
            });
        </script>
    </head>
    <body>
        <div class="nav">
            <div id="ad">
                <p>STAFF</p>
                <i class="fa fa-angle-double-right" aria-hidden="true"></i>
            </div>
            <div id="logout">
                <a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
            </div>
        </div>
        <div class="container">
            <div class="sidebar1">
                <div class="profile">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <p>
                        <% String str = (String)request.getSession().getAttribute("name");
                        String id = (String)request.getSession().getAttribute("id");
                        String em = (String)request.getSession().getAttribute("em");
                        %>
                        Name: <%= str %><br>
                        ID: <%=id %><br>
                        Email: <%=em%>
                    </p>
                </div>
                <div class="db">
                    <i class="fa fa-th" aria-hidden="true">&nbsp;&nbsp; DashBoard</i>
                </div>
                <div class="std">
                    <i class="fa fa-users" aria-hidden="true">&nbsp;&nbsp; Student</i>
                </div>
                <div class="fal">
                    <i class="fa fa-user-circle-o" aria-hidden="true">&nbsp;&nbsp; Faculty</i>
                </div>
            </div>
            <div class="sidebar2" style="height:560px">
                <div class="insidebar1">
                    <a href="#" id="c1" class="crt"><i class="fa fa-plus-circle" aria-hidden="true">&nbsp;&nbsp;CREATE</i></a>
                    <a href="#" id="u1" class="upd" ><i class="fa fa-pencil-square-o" aria-hidden="true">&nbsp;&nbsp;UPDATE</i></a>
                    <a href="#" id="e1" class="del"><i class="fa fa-pencil-square-o" aria-hidden="true">&nbsp;&nbsp;EDIT</i></a>
                    <a href="#" id="v1" class="vi"><i class="fa fa-eye" aria-hidden="true">&nbsp;&nbsp;VIEW</i></a>
                </div>
                <hr size="2" color="white" width="99%">
                <div class="insidebar2">
                    <div id="c2" >
                        <form name="createForm" action="CreateServlet" method="post" onsubmit="return create()">
                            <input type="text" placeholder="Enter Bus No" id="bno" name="bno"><br>
                            <input type="text" placeholder="Enter Driver Name" id="nm" name="nm"><br>
                            <input type="text" placeholder="Enter Driver ID" id="did" name="did"><br>
                            <input type="text" placeholder="Enter Driver Contact" id="con" name="con"><br>
                            <input type="text" placeholder="Enter Route" id="rot" name="rot"><br>
                            <input type="text" placeholder="Enter Shift" name="sh"><br>
                            <input type="submit" value="CREATE">
                        </form>
                    </div>
                    <div id="u2" >
                        <form name="update" action="UpdateServlet" method="post" onsubmit="return update1()">
                           <input type="text" placeholder="Enter Bus No" name="bno"><br>
                            <input type="text" placeholder="Enter Driver Name" name="nm"><br>
                            <input type="text" placeholder="Enter Driver ID" name="did" id="d"><br>
                            <input type="text" placeholder="Enter Driver Contact" name="con"><br>
                            <input type="text" placeholder="Enter Route" name="rot"><br>
                            <input type="text" placeholder="Enter Shift" name="sh"><br>
                            <input type="submit" value="UPDATE">
                        </form>
                    </div>
                    <div id="e2" >
                        <form name="edit" action="UpdateServlet" method="post" onsubmit=" return edit()" >
                           <input type="text" placeholder="Enter Bus No" name="bno"><br>
                            <input type="text" placeholder="Enter Driver Name" name="nm"><br>
                            <input type="text" placeholder="Enter Driver ID" name="did" id="d"><br>
                            <input type="text" placeholder="Enter Driver Contact" name="con"><br>
                            <input type="text" placeholder="Enter Route" name="rot"><br>
                            <input type="text" placeholder="Enter Shift" name="sh"><br>
                            <input type="submit" value="EDIT">
                        </form>
                    </div>
                    <div id="v2" >
                        <form name="view" action="ViewServlet" method="post" onsubmit="return view1()">
                            <p class="acc" >Account Type?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <select name="type1" class="type1" id="sel1">
                                <option value="Select"> Select </option>
                                <option value="Student/Staff"> Student/Staff </option>
                                <option value="BusInfo">BusInfo</option>
                            </select><br>
                            <input type="submit" value="VIEW">
                        </form>
                    </div>
                    <h1>Wel-Come To <br>Bus Management System</h1>
               </div>
            </div>
        </div>
        <script>
            function create(){

                var v1 = document.getElementById("bno").value;
                if( v1 == ""){
                    alert("Enter BusNo");
                    document.getElementById("bno").style.borderColor="red";
                    return false;
                  }
                var v2 = document.getElementById("nm").value;
                if( v2 == ""){
                    alert("Enter Driver Name");
                    document.getElementById("nm").style.borderColor="red";
                    return false;
                  }
                var v3 = document.getElementById("did").value;
                if( v3 == ""){
                    alert("Enter Driver Id");
                    document.getElementById("did").style.borderColor="red";
                    return false;
                  }

                var v4 = document.getElementById("con").value;
                if( v4 == ""){
                    alert("Enter Driver Contact");
                    document.getElementById("con").style.borderColor="red";
                    return false;
                  }
                  var v5 = document.getElementById("rot").value;
                if( v5 == ""){
                    alert("Enter Driver Contact");
                    document.getElementById("rot").style.borderColor="red";
                    return false;
                  }
                  return true;

            }
            function update1(){
                
                var v1 = document.forms["update"]["did"].value;
                if ( v1 == ""){
                    
                   alert("User ID cannot be empty");
                    document.getElementById("d").style.borderColor="red";
                    return false; 
                    
                }
                return true;
                
            }
            function edit(){
                
                var v1 = document.forms["edit"]["did"].value;
                if ( v1 == ""){
                    
                   alert("User ID cannot be empty");
                    document.getElementById("d").style.borderColor="red";
                    return false; 
                    
                }
                return true;
                
            }
            function view1(){
                
                var v1 = document.forms["view"]["type1"].value;
                if( v1 == "Select"){
                    alert("Please select Account type");
                    document.getElementById("sel1").style.borderColor="red";
                    return false;
                  }
                  return true;
                
            }
        </script>
                        
    </body>
</html>
