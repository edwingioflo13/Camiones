/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author t4nk
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    Connection cnn;
    Statement state;
    ResultSet res;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/camiones?zeroDateTimeBehavior=convertToNull", "root", "");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int insertar(Camion c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO CAMION(MATRICULA_CAMION, VOLUMEN_CAMION, PESO_CAMION, ESTADO_CAMION)"
                    + "VALUES('" + c.getPlaca() + "'," + c.getVolumen() + "," + c.getPeso() + ",'" + c.getEstado() + "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int insertarA(Almacen c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO ALMACEN(ID_ALMACEN, NOMBRE_ALMACEN, TELEFONO_ALMACEN, DIRECCION_ALMACEN)"
                    + "VALUES('" + c.getId() + "'," + c.getNombre()+ "," + c.getTelefono() + ",'" + c.getDireccion()+ "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }
    
    public ResultSet ConsultarTodo() {
        try {
            String query = "SELECT * FROM camion";
            state = cnn.createStatement();
            res = state.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public boolean ConsultarExiste(Camion c){
        try {
            String query = "SELECT * FROM camion where MATRICULA_CAMION='" + c.getPlaca() + "'";
            state = cnn.createStatement();
            res = state.executeQuery(query);
            while (res.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
  
      public boolean ConsultarExisteA(Almacen c){
        try {
            String query = "SELECT * FROM almacen where id_almacen='" + c.getDireccion() + "'";
            state = cnn.createStatement();
            res = state.executeQuery(query);
            while (res.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int modificar(Camion c)
    {
        int bandera = 0;
        try
        {
            String query = "UPDATE CAMION SET" 
                    + " VOLUMEN_CAMION = '"+c.getVolumen()+"',"
                    + " PESO_CAMION = '"+c.getPeso()+"',"
                    + " ESTADO_CAMION = '"+c.getEstado()+"' WHERE MATRICULA_CAMION = '" +c.getPlaca()+"';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        }
        catch(SQLException ex)
        {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }
    
    public int eliminar(String cod)
    {
        int bandera = 0;
        try
        {
            String query = "DELETE FROM camion WHERE CODIGO_CAMION = '"+cod+"'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        }
        catch(SQLException ex)
        {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }



}
