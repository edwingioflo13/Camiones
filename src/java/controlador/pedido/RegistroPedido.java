/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.pedido;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Chofer;
import modelo.Conexion;
import modelo.Pedido;

/**
 *
 * @author t4nk
 */
public class RegistroPedido extends HttpServlet {

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
        String volumen = request.getParameter("txtVolumen");
        String peso = request.getParameter("txtPeso");
        if (peso.equals("") || volumen.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("recepcionPedidos.jsp").forward(request, response);
            return;
        } else {
            Conexion cn = new Conexion();
            Pedido pedido = new Pedido();
            pedido.getAlmacen().setId(Integer.valueOf(request.getParameter("txtAlmacen")));
            pedido.getTienda().setId(Integer.valueOf(request.getParameter("txtTienda")));
            pedido.setPeso(Float.valueOf(peso));
            pedido.setVolumen(Float.valueOf(volumen));
            pedido.setEntrega(new Date());
            System.out.println(pedido.toString());
            cn.insertarPedido(pedido);
            String message = "El paquete ha sido registrado exitosamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("recepcionPedidos.jsp").forward(request, response);

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
