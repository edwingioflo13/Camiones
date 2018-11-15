/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.camion;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Camion;
import modelo.Conexion;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 *
 * @author t4nk
 */
public class ReporteCamion extends HttpServlet {

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
        ResultSet res = cn.ConsultarTodo();
        ArrayList<Camion> camiones = new ArrayList<Camion>();
        try {
            while (res.next()) {
                Camion cam = new Camion(res.getString("MATRICULA_CAMION"),
                        res.getFloat("VOLUMEN_CAMION"), res.getFloat("PESO_CAMION"), res.getString("ESTADO_CAMION"), cn.ConsultarChofer(res.getString("CEDULA_CHOFER")));
                cam.setNombreChofer(cam.getChofer().getNombre() + " " + cam.getChofer().getApellido());
                System.out.println(cam.toString());
                camiones.add(cam);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConsultarCamiones.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            /* User home directory location */
            String userHomeDirectory = System.getProperty("user.home");
            /* Output file location */
            String outputFile = userHomeDirectory + File.separatorChar + "reporteCamion.pdf";


            /* Convert List to JRBeanCollectionDataSource */
            JRBeanCollectionDataSource itemsJRBean = new JRBeanCollectionDataSource(camiones, false);
            //System.out.println("entroo" + lcproProcomFacadeRemote.findAll().get(0).getProMision());
            /* Map to hold Jasper report Parameters */
            Map<String, Object> parameters = new HashMap<String, Object>();
            parameters.put("ItemDataSource", itemsJRBean);
            /*
            FacesContext context = FacesContext.getCurrentInstance();
            ServletContext servletContext = (ServletContext) context.getExternalContext().getContext();
            HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
             */
            // busca el reporte y trae su path absoluto
            String pathReporte = "D:\\Proyectos\\GitHub\\Camiones\\web\\camion.jasper";
            System.out.println(pathReporte);

            //reportesGenerales.setVerDialogPDF(true);

            /* Using compiled version(.jasper) of Jasper report to generate PDF */
            //JasperPrint jasperPrint = JasperFillManager.fillReport("C://PROYECTO_FINAL_F/logistico/trunk/transporte/src/main/webapp/reportes/despachoCombustible.jasper", parameters, new JREmptyDataSource());
            JasperPrint jasperPrint = JasperFillManager.fillReport(pathReporte, parameters, new JREmptyDataSource());

            /* outputStream to create PDF */
            OutputStream outputStream = new FileOutputStream(new File(outputFile));
            /* Write content to PDF file */
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);

            System.out.println("File Generated");
            /* ReportesGeneralesBean reportes = new ReportesGeneralesBean();
            reportes.setVerDialogPDF(true);*/
            String message = "Se ha generado el reporte exitosamente!!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("reporteCamion.jsp").forward(request, response);
        } catch (JRException ex) {
            ex.printStackTrace();
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
