/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.tienda;

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
import modelo.Almacen;
import modelo.Tienda;
import modelo.Conexion;

/**
 *
 * @author DIEGO ACOSTA
 */
public class RegistroTienda extends HttpServlet {

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
            request.getRequestDispatcher("registroTienda.jsp").forward(request, response);
            return;
        } else {

            Conexion cn = new Conexion();
            Tienda tienda = new Tienda();
            tienda.setId(Integer.valueOf(request.getParameter("txtId")));
            tienda.setNombre(request.getParameter("txtNombre"));
            tienda.setTelefono(request.getParameter("txtTelefono"));
            tienda.setDireccion(request.getParameter("txtDireccion"));
            System.out.println(tienda.toString());
            
            boolean res = cn.ConsultarExisteTienda(tienda);
            if (!res) {
                cn.insertarTienda(tienda);
                String message = "La tienda ha sido registrado exitosamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroTienda.jsp").forward(request, response);
            } else {
                String message = "El id ya se encuentra regitrados en el sistema!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroTienda.jsp").forward(request, response);
            }
        }
    }
    
    public ArrayList<Tienda> consultaTienda() {
        Conexion cn = new Conexion();
        ResultSet res = cn.ConsultarTodoTienda();
        ArrayList<Tienda> tiendas= new ArrayList<Tienda>();
        try {
            while (res.next()) {
                tiendas.add(new Tienda(res.getInt("ID_TIENDA"),res.getString("NOMBRE_TIENDA"),res.getString("TELEFONO_TIENDA"),
                            res.getString("DIRECCION_TIENDA")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tiendas;
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

