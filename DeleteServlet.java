/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modal.Create;
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


public class DeleteServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int uid = Integer.parseInt(request.getParameter("id"));
            String acc = request.getParameter("type");
            
//            System.out.println(uid + "  "+ acc );
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
                
                if ( acc.equalsIgnoreCase("BusInfo")){
                
                Create cr = null;
                
                cr = (Create)session.get(Create.class,uid);
                
                if ( cr == null )
                    str += "User Doesnot Exist";
                else{
                    
                    str += "Deletion Successful";
                
                    session.delete(cr);
                }
                
                }
                else{
                    
                    SignUp s = new SignUp();
                    
                    s = (SignUp)session.get(SignUp.class, uid);
                    
                    if ( s == null )
                    str += "User Doesnot Exist";
                else{
                    
                    str += "Deletion Successful";
                
                    session.delete(s);
                }
                   
                }
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
