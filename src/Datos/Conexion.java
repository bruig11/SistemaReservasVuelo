/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import com.microsoft.sqlserver.jdbc.SQLServerException;


/**
 *
 * @author s4mu3
 */
public class Conexion {
    
     public Conexion() {
    }
      public static Connection getConexion() throws SQLException
    {
                                //parametros para establecer la conexion 
        String cadenaConexion = "jdbc:sqlserver://localhost:1433;" + //controlador jdbc, servidor y sus puertos
                                "database=GestionVuelos;"+//Base de datos a usar 
                                "user=SB;"+//usuario de conexion a sql 
                                "password=admin;"+//clave de conexion a sql     
                                "encryption=false;"+//conexion encriptada
                                "trustServerCertificate=true;";//certificado de confianza 
        try {
            //Establecer una conexion con los parametros datos
            Connection con = DriverManager.getConnection(cadenaConexion);
            return con;
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, ex.toString());
            return null;
        }
    }
   
 
}
