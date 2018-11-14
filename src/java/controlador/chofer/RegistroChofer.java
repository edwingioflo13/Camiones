/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.chofer;

import controlador.camion.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class RegistroChofer extends HttpServlet {

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
        String cedula = request.getParameter("txtCedula");
        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String direccion = request.getParameter("txtDireccion");
        String licencia = request.getParameter("txtLicencia");
        String sueldo = request.getParameter("txtSueldo");
        if (cedula.equals("") || nombre.equals("") || apellido.equals("") || direccion.equals("") || licencia.equals("") || sueldo.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("registroChofer.jsp").forward(request, response);
            return;
        } else {
            Conexion cn = new Conexion();
            Chofer chofer = new Chofer();
            chofer.setCedula(cedula);
            chofer.setNombre(nombre);
            chofer.setApellido(apellido);
            chofer.setDireccion(direccion);
            chofer.setLicencia(licencia);
            chofer.setSueldo(Float.parseFloat(sueldo));
            System.out.println(chofer.toString());
            boolean res = cn.ConsultarExisteChofer(chofer);
            if (!res) {
                cn.insertarChofer(chofer);
                String message = "El chofer ha sido registrado exitosamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroChofer.jsp").forward(request, response);
            } else {
                String message = "El chofer ya se encuentra regitrado en el sistema!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("registroChofer.jsp").forward(request, response);
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
