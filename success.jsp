<%-- 
    Document   : success
    Created on : 28 Mar, 2019, 11:44:17 AM
    Author     : birendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success page</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                background: lightgray;
            }
            h1{
                position: relative;
                top:150px;
                color: purple;
                font-size: 50px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>
            <% String str = (String)request.getSession().getAttribute("info");
            %>
                <%=str%>
        </h1>
        
    </body>
</html>
