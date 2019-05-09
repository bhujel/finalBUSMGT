
package Controller;

import Modal.Create;
import Modal.CreateDAO;
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


public class CreateServlet extends HttpServlet {

    
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
            
            String str = "";
            
            Configuration cf = null;
            SessionFactory sf = null;
            Session se = null;
            System.out.println(route);
            
            try{
            
            cf = new Configuration();
            cf.configure("cfg_package/hibernate.cfg.xml");
            
            sf = cf.buildSessionFactory();
            
            se = sf.openSession();
            
            Transaction tx = se.beginTransaction();
            
            Create c = (Create)se.get(Create.class, did);
            
            if( c == null ){
                
            str += "Creation Successful";    
            Create cr = new Create(bno, dname, did, dcon, route, shift);
            
            CreateDAO crd = new CreateDAO();
            
            crd.Create1(cr);
            }
            else
                str+= "UserID Already Exist";
            
            HttpSession session = request.getSession();
            session.setAttribute("info",str);
            RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
            rd.forward(request,response);
            
            tx.commit();
            }
            catch(Exception e ){
                e.printStackTrace();
            }
            finally{
                
                se.close();
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
