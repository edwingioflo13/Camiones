/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.usuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Conexion;
import modelo.Usuario;

/**
 *
 * @author t4nk
 */
public class ModificarUsuario extends HttpServlet {

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
        String apellido = request.getParameter("txtApellido");
        String pass = request.getParameter("txtPass");
        if (id.equals("") || nombre.equals("") || apellido.equals("") || pass.equals("")) {
            String message = "Existen campos vacios. Intente Nuevamente";
            request.setAttribute("message", message);
            request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
            return;
        } else {
            Conexion cn = new Conexion();
            Usuario usuario= new Usuario();
            usuario.setId(id);
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setPass(cn.sha256(pass));
            System.out.println(usuario.toString());
            boolean res = cn.ConsultarExisteUsuario(usuario);
            System.out.println(res);
            if (!res) {
                String message = "No se han encontrado coincidencias con el ID del usuario. Intente nuevamente";
                request.setAttribute("message", message);
                request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
            } else {
                int resultado = cn.modificarUsuario(usuario);
                if (resultado > 0) {
                    String message = "El usuario ha sido modificado con exito!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
                } else {
                    String message = "Ha ocurrido un error. Intente nuevamente!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
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
