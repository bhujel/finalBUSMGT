<%-- 
    Document   : admin
    Created on : 28 Mar, 2019, 9:44:23 PM
    Author     : birendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Admin Page</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/admin1.css">
        <script type="text/javascript" src="jquery-3.3.1.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/animate.css"/>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
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
                $("#d1").click(function(){
                    $("h1").toggle(2000);
                    $("#d2").toggle(2000);
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
                <p>ADMINISTRATION</p>
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
                    <i class="fa fa-th" aria-hidden="true">&nbsp;&nbsp; BusInfo</i>
                </div>
                <div class="std">
                    <i class="fa fa-users" aria-hidden="true">&nbsp;&nbsp; Student</i>
                </div>
                <div class="fal">
                    <i class="fa fa-user-circle-o" aria-hidden="true">&nbsp;&nbsp; Faculty</i>
                </div>
            </div>
                <div class="sidebar2" style="height:560px" >
                <div class="insidebar1">
                    <a href="#" id="c1" class="crt"><i class="fa fa-plus-circle" aria-hidden="true">&nbsp;&nbsp;CREATE</i></a>
                    <a href="#" id="u1" class="upd" ><i class="fa fa-pencil-square-o" aria-hidden="true">&nbsp;&nbsp;UPDATE</i></a>
                    <a href="#" id="d1" class="del"><i class="fa fa-trash-o" aria-hidden="true">&nbsp;&nbsp;DELETE</i></a>
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
                    <div id="d2" >
                        <form name="delete" action="DeleteServlet" method="post" onsubmit="return check()">
                            <input type="text" placeholder="Enter User ID" name="id" id="i"><br>
                            <p class="acc" >Account Type?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <select name="type" class="type" id="sel" >
                                <option value="Select"> Select </option>
                                <option value="Student"> Student/Faculty </option>
                                <option value="Staff">Staff</option>
                                <option value="BusInfo">BusInfo</option>
                            </select><br>
                            <input type="submit" value="DELETE">
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
                    <p id="p"></p>
               </div>
            </div>
        </div>
        <script>
            
//             var req = new XMLHttpRequest();  
//                    function sendInfo()  
//                    {  
//                        var v=document.view.type1.value;  
//                        var url="viewContent.jsp?x="+v; 
//                    
//                        try  
//                        {  
//                            req.onreadystatechange=getInfo;  
//                            req.open("POST",url,true);  
//                            req.send();  
//                        }  
//                        catch(e)  
//                        {  
//                        alert("Unable to connect to server");  
//                        }  
//                    }  
//
//                    function getInfo(){  
//                    if(req.readyState==4){  
//                    var val=req.responseText;  
//                    document.getElementById('p').innerHTML=val;  
//                    }  
//                    }  
//            
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
            function check(){

                var v2 = document.forms["delete"]["id"].value;
                if( v2 == ""){
                    alert("Enter UserId");
                    document.getElementById("i").style.borderColor="red";
                    return false;
                  }

                var v1 = document.forms["delete"]["type"].value;
                if( v1 == "Select"){
                    alert("Please select Account type");
                    document.getElementById("sel").style.borderColor="red";
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