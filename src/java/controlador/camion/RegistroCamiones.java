/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.camion;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;

import javax.faces.application.FacesMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Camion;
import modelo.Chofer;
import modelo.Conexion;

/**
 *
 * @author t4nk
 */
public class RegistroCamiones extends HttpServlet {

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
        String placa = request.getParameter("txtPlaca");
        String volumen = request.getParameter("txtVolumen");
        String peso = request.getParameter("txtPeso");
        if (placa.equals("") || volumen.equals("") || peso.equals("") ) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("RegistroCamiones.jsp").forward(request, response);
            return;
        } else {

            Conexion cn = new Conexion();
            Camion camion = new Camion();
            camion.setPlaca(request.getParameter("txtPlaca"));
            camion.setVolumen(Float.parseFloat(request.getParameter("txtVolumen")));
            camion.setPeso(Float.parseFloat(request.getParameter("txtPeso")));
            camion.setEstado(request.getParameter("txtEstado"));
            camion.getChofer().setCedula(request.getParameter("txtChofer"));
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

    public ArrayList<Chofer> consultaChofer() {
        Conexion cn = new Conexion();
        ResultSet res = cn.ConsultarTodoChofer();
        ArrayList<Chofer> choferes= new ArrayList<Chofer>();
        try {
            while (res.next()) {
                choferes.add(new Chofer(res.getString("CEDULA_CHOFER"),
                        res.getString("NOMBRE_CHOFER"), res.getString("APELLIDO_CHOFER"), res.getString("DIRECCION_CHOFER"), res.getString("LICENCIA_CHOFER"), res.getFloat("SUELDO_CHOFER")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
        }

        return choferes;
    }
    
    public ArrayList<Camion> consultaCamiones() {
        Conexion cn = new Conexion();
        ResultSet res = cn.ConsultarTodo();
        ArrayList<Camion> camiones= new ArrayList<Camion>();
        try {
            while (res.next()) {
                camiones.add(new Camion(res.getString("MATRICULA_CAMION"),
                            res.getFloat("VOLUMEN_CAMION"), res.getFloat("PESO_CAMION"), res.getString("ESTADO_CAMION"), cn.ConsultarChofer(res.getString("CEDULA_CHOFER"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
        }

        return camiones;
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
