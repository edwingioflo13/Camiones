/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.tienda;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Tienda;
import modelo.Conexion;

/**
 *
 * @author DIEGO ACOSTA
 */
public class EliminarTienda extends HttpServlet {

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
        Tienda tienda = new Tienda();
        String id = request.getParameter("txtId");
         if (id.equals("")) {
            String message = "El campo esta vacio. Intente nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("eliminarTienda.jsp").forward(request, response);
            return;
        }
        tienda.setId(Integer.parseInt(id));
        boolean res = cn.ConsultarExisteTienda(tienda);
        System.out.println(res);
        if (!res) {
            String message = "No se han encontrado coincidencias con el id de la tienda. Intente nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("eliminarTienda.jsp").forward(request, response);
        } else {
            int resultado = cn.eliminarTienda(Integer.parseInt(id));
            if (resultado > 0) {
                String message = "La tienda ha sido borrado con exito!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("eliminarTienda.jsp").forward(request, response);
            } else {
                String message = "Ha ocurrido un error. Intente nuevamente!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("eliminarTienda.jsp").forward(request, response);
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
