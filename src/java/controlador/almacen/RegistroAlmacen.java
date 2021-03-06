/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.almacen;

import controlador.camion.ConsultarCamiones;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/**
 *
 * @author t4nk
 */
public class RegistroAlmacen extends HttpServlet {

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
        String nombre = request.getParameter("txtNombre");
        String telefono = request.getParameter("txtTelefono");
        String direccion = request.getParameter("txtDireccion");
        if (id.equals("") || nombre.equals("") || telefono.equals("") || direccion.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("registroAlmacen.jsp").forward(request, response);
            return;
        } else {

            Conexion cn = new Conexion();
            Almacen almacen = new Almacen();
            almacen.setId(Integer.valueOf(request.getParameter("txtId")));
            almacen.setNombre(request.getParameter("txtNombre"));
            almacen.setTelefono(request.getParameter("txtTelefono"));
            almacen.setDireccion(request.getParameter("txtDireccion"));
            System.out.println(almacen.toString());
            
            boolean res = cn.ConsultarExisteAlmacen(almacen);
            if (!res) {
                cn.insertarAlmacen(almacen);
                String message = "El almacen ha sido registrado exitosamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroAlmacen.jsp").forward(request, response);
            } else {
                String message = "El id ya se encuentra regitrados en el sistema!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroAlmacen.jsp").forward(request, response);
            }
        }
    }
    
    public ArrayList<Almacen> consultaAlmacen() {
        Conexion cn = new Conexion();
        ResultSet res = cn.ConsultarTodoAlmacen();
        ArrayList<Almacen> almacenes= new ArrayList<Almacen>();
        try {
            while (res.next()) {
                almacenes.add(new Almacen(res.getInt("ID_ALMACEN"),
                            res.getString("NOMBRE_ALMACEN"), res.getString("TELEFONO_ALMACEN"), res.getString("DIRECCION_ALMACEN")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return almacenes;
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
