
package Controller;

import Modal.Create;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;


public class SerachServlet2 extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
//            String ser = request.getParameter("input");
            
            Configuration cf = null;
            SessionFactory sf = null;
            Session session = null;
            Transaction tx = null;
            
             List <Create> record = null;
            
            try{
                
                cf = new Configuration();
                cf.configure("cfg_package/hibernate.cfg.xml");
                sf = cf.buildSessionFactory();
                session = sf.openSession();
                tx = session.beginTransaction();
                
                Criteria criteria = session.createCriteria(Create.class);
                
//                criteria.add(Restrictions.eq("bno",ser));

                record = criteria.list();
                
                request.setAttribute("list", record);
                
                RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
                
                rd.forward(request, response);
                
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
