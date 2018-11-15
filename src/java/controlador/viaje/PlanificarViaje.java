/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.viaje;

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
import modelo.Camion;
import modelo.Conexion;
import modelo.Pedido;
import modelo.Tienda;
import modelo.Viaje;

/**
 *
 * @author t4nk
 */
public class PlanificarViaje extends HttpServlet {

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
        try {
            String almacen1 = request.getParameter("txtAlmacen");
            String tienda1 = request.getParameter("txtTienda");
            String camion1 = request.getParameter("txtCamion");
            Conexion cn = new Conexion();
            ResultSet res = cn.ConsultarFiltroPedido(Integer.valueOf(almacen1), Integer.valueOf(tienda1));
            ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
            while (res.next()) {
                Almacen almacen = new Almacen();
                Tienda tienda = new Tienda();
                Viaje viaje = new Viaje();
                almacen.setId(res.getInt("ID_ALMACEN"));
                tienda.setId(res.getInt("ID_TIENDA"));
                pedidos.add(new Pedido(res.getInt("ID_PEDIDO"),
                        almacen, tienda, viaje,
                        res.getFloat("PESO_PEDIDO"), res.getFloat("VOLUMEN_PEDIDO"), res.getDate("FECHAENVIO_PEDIDO"), res.getDate("FECHAENTREGA_PEDIDO")));
            }
            int numero = (int) (Math.random() * 400) + 1;
            while (cn.ConsultarEnvioPedido(numero)) {
                numero = (int) (Math.random() * 400) + 1;
            }
            Viaje viaje = new Viaje(numero, almacen1 + "-" + tienda1);
            Camion camion = new Camion();
            camion = cn.ConsultarCamion(camion1);
            viaje.setCamion(camion);
            float peso = camion.getPeso();
            float volumen = camion.getVolumen();
            viaje.setPlacaCamion(camion.getPlaca());

            viaje.setNombreTienda(cn.ConsultarTienda(Integer.valueOf(tienda1)).getNombre());
            viaje.setNombreAlmacen(cn.ConsultarAlmacen(Integer.valueOf(almacen1)).getNombre());
            cn.insertarViaje(viaje);
            float peso1 = 0;
            float volumen1 = 0;
            int contador = 0;
            for (int i = 0; i < pedidos.size(); i++) {
                if (pedidos.get(i).getPeso() < peso && pedidos.get(i).getVolumen() < volumen) {
                    peso1 = peso1 + pedidos.get(i).getPeso();
                    volumen1 = volumen1 + pedidos.get(i).getVolumen();
                    contador++;
                    peso = peso - pedidos.get(i).getPeso();
                    volumen = volumen - pedidos.get(i).getVolumen();
                    cn.enviarPedido(pedidos.get(i).getId(), viaje.getId());
                }
            }
            if (contador == 0) {
                String message = "Actualmente no cuenta con paquetes o con la capacidad minima para llevar un pedido. Verifique la informacion.";
                request.setAttribute("message", message);
                request.getRequestDispatcher("planificadorViajes.jsp").forward(request, response);
            }
            viaje.setPeso(peso1);
            viaje.setVolumen(volumen1);
            cn.modificarViaje(viaje);
            String message = "El viaje se ha planificado exitosamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("planificadorViajes.jsp").forward(request, response);

        } catch (SQLException ex) {
            String message = "Ha ocurrido un error, intente de nuevo!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("planificadorViajes.jsp").forward(request, response);
            Logger.getLogger(PlanificarViaje.class.getName()).log(Level.SEVERE, null, ex);
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
