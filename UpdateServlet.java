
package Controller;

import Modal.Create;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class UpdateServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String bno = request.getParameter("bno");
            String dname = request.getParameter("nm");
            int did = Integer.parseInt(request.getParameter("did"));
            String dcon = request.getParameter("con");
            String route = request.getParameter("rot");
            String shift = request.getParameter("sh");
            
            System.out.println(shift);
            
            String str = "";
            
            Configuration cf = null;
            SessionFactory sf = null;
            Session session = null;
            
            try{
                
                cf = new Configuration();
                cf.configure("cfg_package/hibernate.cfg.xml");
                sf = cf.buildSessionFactory();
                session = sf.openSession();
                Transaction tx = session.beginTransaction();
                
                Create cr = (Create)session.get(Create.class, did);
                
                if ( cr != null ){
                     str += "Update successful";
                     
                if ( bno != null )
                     cr.setBno(bno);
                 if( dname != null )
                     cr.setDname(dname);
                 if( dcon != null )
                     cr.setDcon(dcon);
                 if( route != null )
                     cr.setRoute(route);
                 if( shift != null )
                     cr.setShift(shift);
                                            
                session.update(cr);
                
                }
                 else
                    str+= "User Doesnot Exist";
                               
                HttpSession session1 = request.getSession();
                session1.setAttribute("info",str);
                RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                rd.forward(request,response);
                 
                 tx.commit();
                
            }
            catch(Exception e ){
                
                e.printStackTrace();
                
            }
            finally{
                
                session.close();
                sf.close();
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
