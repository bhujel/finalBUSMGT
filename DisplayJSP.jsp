<%-- 
    Document   : DisplayJSP
    Created on : 26 Mar, 2019, 9:27:33 AM
    Author     : birendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            
            <tr>
                <th>Name</th>
                <th>Id</th>
                <th>Marks</th>
            </tr>
            
            <% 
                List<Student> records = request.getAttribute("List");
                for (Student s: records){
                    
                            
            %>
            
            <tr>
                <td> <% = s.getName() %></td>
                <td> <% = s.getId() %> </td>
                <td> <% = s.getMarks() %> </td>

            </tr>
            
            <%}%>
        </table>
    </body>
</html>
<!--scriplet tag-->
  <%  int x ; x = 10 ; out.println(x);%>
  
  <!--expression tag-->
  <% = student.getId() %>
  <!--declarartion tag-->
  
  