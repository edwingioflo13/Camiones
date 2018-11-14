/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.almacen;

import java.io.IOException;
import java.io.PrintWriter;
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

        String codigo = request.getParameter("txtCodigo");
        String placa = request.getParameter("txtPlaca");
        String volumen = request.getParameter("txtVolumen");
        String peso = request.getParameter("txtPeso");
        String estado = request.getParameter("txtEstado");
        if (codigo.equals("") || placa.equals("") || volumen.equals("") || peso.equals("") || estado.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("registroAlmacen.jsp").forward(request, response);
            return;
        } else {

            Conexion cn = new Conexion();
            Camion camion = new Camion();
            camion.setPlaca(request.getParameter("txtPlaca"));
            camion.setVolumen(Float.parseFloat(request.getParameter("txtVolumen")));
            camion.setPeso(Float.parseFloat(request.getParameter("txtPeso")));
            camion.setEstado(request.getParameter("txtEstado"));
            System.out.println(camion.toString());
            boolean res = cn.ConsultarExiste(camion);
            if (!res) {
                cn.insertar(camion);
                String message = "El camion ha sido registrado exitosamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("RegistroCamiones.jsp").forward(request, response);
            } else {
                String message = "El codigo o placa ya se encuentra regitrados en el sistema!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("RegistroCamiones.jsp").forward(request, response);
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
