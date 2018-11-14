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
            String query = "INSERT INTO CAMION(MATRICULA_CAMION, CEDULA_CHOFER, VOLUMEN_CAMION, PESO_CAMION, ESTADO_CAMION)"
                    + "VALUES('" + c.getPlaca() + "','" + c.getChofer().getCedula() + "'," + c.getVolumen() + "," + c.getPeso() + ",'" + c.getEstado() + "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int insertarAlmacen(Almacen c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO ALMACEN(ID_ALMACEN, NOMBRE_ALMACEN, TELEFONO_ALMACEN, DIRECCION_ALMACEN)"
                    + "VALUES(" + c.getId() + ",'" + c.getNombre() + "','" + c.getTelefono() + "','" + c.getDireccion() + "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int insertarTienda(Tienda c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO TIENDA(ID_TIENDA, NOMBRE_TIENDA, TELEFONO_TIENDA, DIRECCION_TIENDA)"
                    + "VALUES(" + c.getId() + ",'" + c.getNombre() + "','" + c.getTelefono() + "','" + c.getDireccion() + "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int insertarChofer(Chofer c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO CHOFER(CEDULA_CHOFER, NOMBRE_CHOFER, APELLIDO_CHOFER, DIRECCION_CHOFER, LICENCIA_CHOFER, SUELDO_CHOFER)"
                    + "VALUES('" + c.getCedula() + "','" + c.getNombre() + "','" + c.getApellido() + "','" + c.getDireccion() + "','" + c.getLicencia() + "'," + c.getSueldo() + ")";
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

    public ResultSet ConsultarTodoAlmacen() {
        try {
            String query = "SELECT * FROM ALMACEN";
            state = cnn.createStatement();
            res = state.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public ResultSet ConsultarTodoTienda() {
        try {
            String query = "SELECT * FROM TIENDA";
            state = cnn.createStatement();
            res = state.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public ResultSet ConsultarTodoChofer() {
        try {
            String query = "SELECT * FROM CHOFER";
            state = cnn.createStatement();
            res = state.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public boolean ConsultarExiste(Camion c) {
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

    public boolean ConsultarExisteAlmacen(Almacen c) {
        try {
            String query = "SELECT * FROM almacen where id_almacen='" + c.getId() + "'";
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

    public boolean ConsultarExisteChofer(Chofer c) {
        try {
            String query = "SELECT * FROM CHOFER where CEDULA_CHOFER='" + c.getCedula() + "'";
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

    public boolean ConsultarExisteTienda(Tienda c) {
        try {
            String query = "SELECT * FROM tienda where id_tienda='" + c.getId() + "'";
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

    public int modificar(Camion c) {
        int bandera = 0;
        try {
            String query = "UPDATE CAMION SET"
                    + " VOLUMEN_CAMION = '" + c.getVolumen() + "',"
                    + " PESO_CAMION = '" + c.getPeso() + "',"
                    + " ESTADO_CAMION = '" + c.getEstado() + "' WHERE MATRICULA_CAMION = '" + c.getPlaca() + "';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int modificarAlmacen(Almacen c) {
        int bandera = 0;
        try {
            String query = "UPDATE ALMACEN SET"
                    + " ID_ALMACEN = '" + c.getId() + "',"
                    + " NOMBRE_ALMACEN = '" + c.getNombre() + "',"
                    + " TELEFONO_ALMACEN = '" + c.getTelefono() + "',"
                    + " DIRECCION_ALMACEN = '" + c.getDireccion() + "' WHERE ID_ALMACEN = '" + c.getId() + "';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int modificarTienda(Tienda c) {
        int bandera = 0;
        try {
            String query = "UPDATE TIENDA SET"
                    + " ID_TIENDA = '" + c.getId() + "',"
                    + " NOMBRE_TIENDA = '" + c.getNombre() + "',"
                    + " TELEFONO_TIENDA = '" + c.getTelefono() + "',"
                    + " DIRECCION_TIENDA = '" + c.getDireccion() + "' WHERE ID_TIENDA = '" + c.getId() + "';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int modificarChofer(Chofer c) {
        int bandera = 0;
        try {
            String query = "UPDATE CHOFER SET"
                    + " NOMBRE_CHOFER = '" + c.getNombre() + "',"
                    + " APELLIDO_CHOFER = '" + c.getApellido() + "',"
                    + " DIRECCION_CHOFER = '" + c.getDireccion() + "',"
                    + " SUELDO_CHOFER = " + c.getSueldo() + ","
                    + " LICENCIA_CHOFER = '" + c.getLicencia() + "' WHERE CEDULA_CHOFER = '" + c.getCedula() + "';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int eliminar(String cod) {
        int bandera = 0;
        try {
            String query = "DELETE FROM camion WHERE CODIGO_CAMION = '" + cod + "'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int eliminaraAlmacen(String cod) {
        int bandera = 0;
        try {
            String query = "DELETE FROM almacen WHERE ID_ALMACEN = '" + cod + "'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int eliminarTienda(String cod) {
        int bandera = 0;
        try {
            String query = "DELETE FROM tienda WHERE ID_TIENDA = '" + cod + "'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int eliminarChofer(String cedula) {
        int bandera = 0;
        try {
            String query = "DELETE FROM CHOFER WHERE CEDULA_CHOFER = '" + cedula + "'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    // ----------------------- USUARIO -----------------------------------------
    public int insertarUsuario(Usuario c) {
        int bandera = 0;
        try {
            String query = "INSERT INTO USUARIO(ID_USUARIO, PASS_USUARIO, NOMBRE_USUARIO, APELLIDO_USUARIO)"
                    + "VALUES('" + c.getId() + "','" + c.getPass() + "','" + c.getNombre() + "','" + c.getApellido() + "')";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public ResultSet ConsultarTodoUsuario() {
        try {
            String query = "SELECT * FROM USUARIO";
            state = cnn.createStatement();
            res = state.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public boolean ConsultarExisteUsuario(Usuario c) {
        try {
            String query = "SELECT * FROM USUARIO where ID_USUARIO='" + c.getId() + "'";
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

    public int modificarUsuario(Usuario c) {
        int bandera = 0;
        try {
            String query = "UPDATE USUARIO SET"
                    + " PASS_USUARIO = '" + c.getPass() + "',"
                    + " NOMBRE_USUARIO = '" + c.getNombre() + "',"
                    + " APELLIDO_USUARIO = '" + c.getApellido() + "' "
                    + " WHERE ID_USUARIO = '" + c.getId() + "';";
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }

    public int eliminarUsuario(String id) {
        int bandera = 0;
        try {
            String query = "DELETE FROM USUARIO WHERE ID_USUARIO = '" + id + "'";
            System.out.println(query);
            state = cnn.createStatement();
            bandera = state.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bandera;
    }
    // -------------------------------------------------------------------------
}
