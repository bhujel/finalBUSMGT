
package Controller;

import Modal.Login;
import Modal.LoginDAO;
import Modal.SignUp;
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


public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
           
           Login l = new Login( Integer.parseInt(request.getParameter("uid")), request.getParameter("pwd"), request.getParameter("type"));
            
           LoginDAO l1 = new LoginDAO();
            
           String type = request.getParameter("type"); 
//            System.out.println(request.getParameter("uid"));
           
           Configuration cf = null;
           SessionFactory sf = null;
           Session session = null;
           
            if( l1.check(l)){
                
                try{
                
                cf = new Configuration();
                cf.configure("cfg_package/hibernate.cfg.xml");
                sf = cf.buildSessionFactory();
                session = sf.openSession();
                Transaction tx = session.beginTransaction();
                
                SignUp s = (SignUp)session.get(SignUp.class, l.getUid());
                
                String str = s.getFname()+" "+s.getLname();
                
                HttpSession session1 = request.getSession();
                session1.setAttribute("name", str);
                session1.setAttribute("id", Integer.toString(s.getUid()));
                session1.setAttribute("em", s.getEm());
                session1.setAttribute("acc", type);
                
                if( type.equals("Student")){
                
                RequestDispatcher rd = request.getRequestDispatcher("student.jsp");
                rd.forward(request,response);
                }
                else if( type.equals("Staff")){
                RequestDispatcher rd = request.getRequestDispatcher("staff.jsp");
                rd.forward(request,response);
                }
                else if( type.equals("Faculty")){
                RequestDispatcher rd = request.getRequestDispatcher("faculty.jsp");
                rd.forward(request,response);
                }
                else if( type.equals("Admin")){
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request,response);
                    }
                
                tx.commit();
                
                }
                catch(Exception e){
                    
                    e.printStackTrace();
                    
                }
                finally{
                    session.close();
                    sf.close();
                }
            }
            else{
                
//                HttpSession session1 = request.getSession();
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                rd.forward(request,response);
                
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






//HttpSession session = request.getSession();
//String name = (String)session.getAttribute("uid");