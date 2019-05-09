<%@page import="org.hibernate.Criteria"%>
<%@page import="Modal.Create"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="CSS/view.css">-->
        <title>view Bus</title>
    </head>
    <body>
        <%
            String val = request.getParameter("x");
            
            System.out.println(val);
            
                Configuration cf = null;
                SessionFactory sf = null;
                Session ses = null;
                List <Create> record = null;
                try
                {
                    cf = new Configuration();
                    cf.configure("cfg_package/hibernate.cfg.xml");
                    sf = cf.buildSessionFactory();
                    ses = sf.openSession();
                    Transaction tx = ses.beginTransaction();
                   
                    Criteria criteria = ses.createCriteria(Create.class);
                
                    record = criteria.list();

                    
                    out.print("<center><table id='btable'>");
                    out.print("<tr><th>Sl.No</th><th>Bus Number</th><th>Diver ID</th><th>Diver Name</th><th>Route</th><th>Shift</th></tr>");

                    int i = 1;
                    for(Create ab : record )
                    {
                        out.print("<tr id='a'> <td>"+i+"</td> <td>"+ab.getBno()+"</td> <td>"+ab.getDid()+"</td> <td>"+ab.getDname()+"</td> <td>"+ab.getRoute() +"</td><td>"+ab.getShift()+"</td></tr>");
                        i++;
                    }
                    
                    out.print("</table></center>");
                    tx.commit();
                }
                catch(Exception ee)
                {
                    System.out.println(ee);
                }
                finally
                {
                    ses.close();
                    sf.close();
                }
                
        %>
    </body>
</html>