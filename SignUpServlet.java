
package Controller;

import Modal.SignUp;
import Modal.SignUpDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SignUpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
                 int uid = Integer.parseInt(request.getParameter("ui"));
                 String fname = request.getParameter("fn");
                 String lname = request.getParameter("ln");
                 String pwd = request.getParameter("psw");
                 String ph = request.getParameter("ph");
                 String em = request.getParameter("em");
                 String pik = request.getParameter("pik");
                 String gender = request.getParameter("gender");
                 String acc = request.getParameter("type");
//                 String add = request.getParameter("add");
             
            SignUp s = new SignUp(uid, fname, lname, pwd, ph, em, pik, gender, acc);
            
            SignUpDAO s1 = new SignUpDAO();
            
            s1.Save(s);
            
            HttpSession session = request.getSession();
                RequestDispatcher rd = request.getRequestDispatcher("login.html");
                rd.forward(request,response);
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
