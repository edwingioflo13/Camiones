/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.pedido;

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
import modelo.Pedido;
import modelo.Conexion;
import modelo.Tienda;
import modelo.Viaje;

/**
 *
 * @author DIEGO ACOSTA
 */
public class ConsultaPedidos extends HttpServlet {
  
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
        ResultSet res = cn.ConsultarTodoPedido();
        ArrayList<Pedido> pedido = new ArrayList<Pedido>();
        if (res == null) {
            String error = "No existen datos";
            request.getSession().setAttribute("error", error);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            try {
                while (res.next()) {
                    Almacen almacen = new Almacen();
                    Tienda tienda = new Tienda();
                    Viaje viaje = new Viaje();
                    almacen = cn.ConsultarAlmacen(res.getInt("ID_ALMACEN"));
                    tienda = cn.ConsultarTienda(res.getInt("ID_TIENDA"));
                    viaje.setId(res.getInt("ID_VIAJE"));
                    pedido.add(new Pedido(res.getInt("ID_PEDIDO"),
                            almacen, tienda, viaje, 
                            res.getFloat("PESO_PEDIDO"), res.getFloat("VOLUMEN_PEDIDO"), res.getDate("FECHAENVIO_PEDIDO"), res.getDate("FECHAENTREGA_PEDIDO")));
                }
                request.getSession().setAttribute("pedido", pedido);
                request.getRequestDispatcher("consultaPedido.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
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

