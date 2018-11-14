/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.almacen;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Almacen;
import modelo.Conexion;

/**
 *
 * @author DIEGO ACOSTA
 */
@WebServlet(name = "ModificarAlmacen", urlPatterns = {"/modificar_almacen.do"})
public class ModificarAlmacen extends HttpServlet {

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

        String id = request.getParameter("txtId");
        String nombre = request.getParameter("txtNomre");
        String telefono = request.getParameter("txtTelefono");
        String direccion = request.getParameter("txtDireccion");
        
        if (id.equals("") || nombre.equals("") || telefono.equals("") || direccion.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("modificarAlmacen.jsp").forward(request, response);
            return;
        } else {
            Conexion cn = new Conexion();
            Almacen almacen = new Almacen();
            almacen.setId(request.getIntHeader("txtId"));
            almacen.setNombre(request.getParameter("txtNombre"));
            almacen.setTelefono(request.getParameter("txtTelefono"));
            almacen.setDireccion(request.getParameter("txtDireccion"));
            System.out.println(almacen.toString());
            boolean res = cn.ConsultarExisteAlmacen(almacen);
            System.out.println(res);
            if (!res) {
                String message = "No se han encontrado coincidencias con el codigo o id del almacen. Intente nuevamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("modificarAlmacen.jsp").forward(request, response);
            } else {
                int resultado = cn.modificarAlmacen(almacen);
                if (resultado > 0) {
                    String message = "El almacen ha sido modificado con exito!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("modificarAlmacen.jsp").forward(request, response);
                } else {
                    String message = "Ha ocurrido un error. Intente nuevamente!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("modificarAlmacen.jsp").forward(request, response);
                }

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
