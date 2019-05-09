<%-- 
    Document   : view.jsp
    Created on : 26 Mar, 2019, 1:59:49 PM
    Author     : birendra
--%>

<%@page import="Modal.SignUp"%>
<%@page import="java.util.List"%>
<%@page import="Modal.Create"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html >
<head>
    <title>View Page</title>
    <link rel="stylesheet" type="text/css" href="CSS/view1.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <a class="back" href="CSS/com.html"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></a>
    <h1>Your Safety,Our Concern.</h1>
    <a href="login.html" class="a1"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
    <div class="top">
       <a href="com.html"><img src="Image/bus.png" usemap="map1" class="img1"></a>
       <input type="text" class="input1" placeholder="Type to search" style="outline: none">
       <i class="fa fa-search" aria-hidden="true"></i>
       <img src="Image/user.jpeg" class="img2"/> 
       <p class="info">
           
           <% String str = (String)request.getSession().getAttribute("name");
           String id = (String)request.getSession().getAttribute("id");
           String em = (String)request.getSession().getAttribute("em");
           %>
           Name: <%= str %><br>
           ID: <%= id%><br>
           Email ID: <%=em%>
           </p>
    </div>
    <hr/>
    <div class="mid">
        <table >
            <tr >
                <th>sl-no</th>
                <th>UserID</th>
                <th>First Name</th>
                <th>Last Name </th>
                <th>Gender</th>
                <th>Acc Type</th>
                <th>Email</th>
                <th>Ph Number</th>
                <th>PickUp Point</th>
            </tr>
            <%
                List<SignUp> record =(List<SignUp>)request.getAttribute("list");
                int i = 1;
                
                for( SignUp red : record ){
                %>
                <tr>
                    <td> <%= i %> </td>
                    <td> <%=red.getUid() %> </td>
                    <td> <%=red.getFname() %> </td>
                    <td> <%=red.getLname() %> </td>
                    <td> <%=red.getGender() %> </td>
                    <td> <%=red.getAcc() %> </td>
                    <td> <%=red.getEm() %> </td>
                    <td> <%=red.getPh() %> </td>
                    <td> <%=red.getPik() %> </td>
                </tr>
                <% i++; }%>
        </table>
    </div>
    <footer>  
      <p>Copyright ©2019 All rights reserved | This template is made with  by Biren</p>
<!--        <a href="view.html" class="ab"><i class="fa fa-chevron-circle-up" aria-hidden="true"></i>
        </a>-->
    </footer>
</body>
</html>
