<%-- 
    Document   : view.jsp
    Created on : 26 Mar, 2019, 1:59:49 PM
    Author     : birendra
--%>

<%@page import="java.util.List"%>
<%@page import="Modal.Create"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html >
<head>
    <title>View Page</title>
    <script type="text/javascript" src="jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/view.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .highLight{
            background: purple;
            font-weight: bold;
        }
        .a:hover{
            background: pink;
        }
    </style>
    <script>
        
        $(document).ready(function(){
            $("#ser").keyup(function(){
                search($(this).val());
            });
        });
        function search(text){
            if( text ){
                var content = $("table").text();
                var searchExp = new RegExp(text,"ig");
                var matchs = content.match(searchExp);
                if( matchs){
                    $("table").html(content.replace(searchExp,function(match){
                        return "<span class='highLight'>"+match+"</span>";
                    }));
                }else{
                    $(".highLight").removeClass("highLight");
                }
                
            }
        }
        
    </script>

</head>
<body>
    <a class="back" href="CSS/com.html"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></a>
    <h1>Your Safety,Our Concern.</h1>
    <a href="login.html" class="a1"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
    <div class="top">
       <a href="com.html"><img src="Image/bus.png" usemap="map1" class="img1"></a>
       <input type="text" id="ser" class="input1" placeholder="Type to search" style="outline: none">
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
                <th>Bus No</th>
                <th>Diver Name </th>
                <th>Diver ID</th>
                <th>Ph.No</th>
                <th>Route</th>
                <th>Shift</th>
            </tr>
            <%
                List<Create> record =(List<Create>)request.getAttribute("list");
                int i = 1;
                
                for( Create red : record ){
                %>
                <tr class="a">
                    <td> <%= i %> </td>
                    <td> <%=red.getBno() %> </td>
                    <td> <%=red.getDname() %> </td>
                    <td> <%=red.getDid() %> </td>
                    <td> <%=red.getDcon() %> </td>
                    <td> <%=red.getRoute() %> </td>
                    <td> <%=red.getShift() %> </td>
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