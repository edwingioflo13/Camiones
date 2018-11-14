/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.chofer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Chofer;
import modelo.Conexion;

/**
 *
 * @author t4nk
 */
public class EliminarChofer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conexion cn = new Conexion();
        Chofer chofer = new Chofer();
        String cedula = request.getParameter("txtCedula");
        chofer.setCedula(cedula);
        boolean res = cn.ConsultarExisteChofer(chofer);
        System.out.println(res);
        if (!res) {
            String message = "No se han encontrado coincidencias con la cedula del chofer. Intente nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("eliminarChofer.jsp").forward(request, response);
        } else {
            int resultado = cn.eliminarChofer(cedula);
            if (resultado > 0) {
                String message = "El chofer ha sido borrado con exito!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("eliminarChofer.jsp").forward(request, response);
            } else {
                String message = "Ha ocurrido un error. Intente nuevamente!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("eliminarChofer.jsp").forward(request, response);
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
