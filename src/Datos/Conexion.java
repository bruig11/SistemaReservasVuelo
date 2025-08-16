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
   
      public static int siguienteReserva() throws SQLException{
    int resultado = 0;
    try {
        //declarar la conexion a sql server
        Statement sql = (Statement) Conexion.getConexion().createStatement();
        //variable con la sentencia o script sql
         String Consulta = 
                           "Select Max(idReserva) as Id " +
                           " From Reserva ";
     ResultSet rs = sql.executeQuery(Consulta);
     while (rs.next()){
         //resultado = Integer.valueOf(rs.getString(1));//es mejor este 
         resultado = (rs.getInt(1)) + 1;//este es bueno pero
     }
      }catch(SQLServerException e){
                 JOptionPane.showMessageDialog(null, e.toString());
            
                        
                        }
    
        
        
        return resultado;
      }
      
      public static int insertReserva(Reserva miReserva) throws SQLException{
    int filasAfectadas = 0;
    Statement sql = (Statement) Conexion.getConexion().createStatement();
    String insertar = " insert into Reserva " +
                      "values(" + miReserva.getIdReserva() + ", " +
                      miReserva.getIdCliente() + ", " +
                      miReserva.getIdVuelo() + ", " +
                      " '" + miReserva.getFechaReserva() + "' , " +
                      " '" + miReserva.getCodigoConfirmacion() + "' , " +
                      " '" + miReserva.getEstadoReserva() + "' , " +
                      " '" + miReserva.getNumeroAsiento() + "' , " +
                      miReserva.getPrecioTotal() + ")";
    filasAfectadas = sql.executeUpdate(insertar);
    
    return filasAfectadas;
}
      // Método para obtener una reserva
public static Reserva obtenerReserva(String Id) throws SQLException{
    try {
        Statement sql = (Statement) Conexion.getConexion().createStatement();
        String Consulta = " select * " +
                         " From Reserva " +
                         " Where idReserva = " + Id;
        ResultSet rs = sql.executeQuery(Consulta);
        
        Reserva Encontrada = new Reserva();
        while (rs.next()){
            Encontrada.setIdReserva(rs.getInt(1));
            Encontrada.setIdCliente(rs.getInt(2));
            Encontrada.setIdVuelo(rs.getInt(3));
            Encontrada.setFechaReserva(rs.getDate(4));
            Encontrada.setCodigoConfirmacion(rs.getString(5));
            Encontrada.setEstadoReserva(rs.getString(6));
            Encontrada.setNumeroAsiento(rs.getString(7));
            Encontrada.setPrecioTotal(rs.getFloat(8));
        }
        return Encontrada;
            
    }catch(SQLServerException e){
        JOptionPane.showMessageDialog(null, e.toString());
        return null;
    }
}

// Método para actualizar reserva
public static int updateReserva(Reserva miReserva) throws SQLException{
    int filasAfectadas = 0;
    Statement sql = (Statement) Conexion.getConexion().createStatement();
    String update = " Update Reserva " +
                    " set idCliente = " + miReserva.getIdCliente() + ", " +
                    " idVuelo = " + miReserva.getIdVuelo() + ", " +
                    " fechaReserva = '" + miReserva.getFechaReserva() + "', " +
                    " codigoConfirmacion = '" + miReserva.getCodigoConfirmacion() + "', " +
                    " estadoReserva = '" + miReserva.getEstadoReserva() + "', " +
                    " numeroAsiento = '" + miReserva.getNumeroAsiento() + "', " +
                    " precioTotal = " + miReserva.getPrecioTotal() +
                    " where idReserva = " + miReserva.getIdReserva(); 
                     
    filasAfectadas = sql.executeUpdate(update);
    
    return filasAfectadas;
}  
public static int deleteReserva(int Id) throws SQLException{
    int filasAfectadas = 0;
    Statement sql = (Statement) Conexion.getConexion().createStatement();
    String delete = " Delete From Reserva " +
                    " where idReserva = " + Id; 
                     
    filasAfectadas = sql.executeUpdate(delete);

    return filasAfectadas;
}
public static ResultSet listarReservas() throws SQLException{
    try {
        //declarar la conexion a sql server
        Statement sql = (Statement) Conexion.getConexion().createStatement();
        //variable con la sentencia o script sql
         String Consulta = " select R.idReserva as ID, " +
                           " C.nombre + ' ' + C.apellido1 as Cliente, " +
                           " V.numeroVuelo as Vuelo, " +
                           " R.fechaReserva as Fecha, " +
                           " R.codigoConfirmacion as Codigo, " +
                           " R.estadoReserva as Estado, " +
                           " R.numeroAsiento as Asiento, " +
                           " R.precioTotal as Precio " +
                           " From Reserva R " + 
                           " Join Cliente C on (R.idCliente = C.idCliente) " +
                           " JOIN Vuelo V on (R.idVuelo = V.idVuelo) " +
                           " Order by R.idReserva desc " ;
     //Ejecutar la consulta t llenar una estructura con el o los resultados obtenidos 
     ResultSet rs = sql.executeQuery(Consulta);
        return rs;
            
    }catch(SQLException e){  // Cambié SQLServerException por SQLException
             JOptionPane.showMessageDialog(null, e.toString());
                     return null;
 }
}
public static String nomCliente(int Id) throws SQLException{
    String resultado = "";
    
    //SQL REQUIERE TRY CATCH
    try {
        //declarar la conexion a sql server
        Statement sql = (Statement) Conexion.getConexion().createStatement();
        //variable con la sentencia o script sql
         String Consulta = " select (nombre + ' ' + apellido1 + ' ' + apellido2) as Cliente " +
                           " From Cliente " +
                           " Where idCliente = " + Id ; 
     //Ejecutar la consulta t llenar una estructura con el o los resultados obtenidos 
     ResultSet rs = sql.executeQuery(Consulta);
     while (rs.next()){
         //resultado = Integer.valueOf(rs.getString(1));//es mejor este 
         resultado = rs.getString(1);//este es bueno pero
     }
        
            
    }catch(SQLServerException e){
             JOptionPane.showMessageDialog(null, e.toString());
        
                    
                    }
    
    
    return resultado;
}
public static String numeroVuelo(int Id) throws SQLException{
    String resultado = "";
    
    //SQL REQUIERE TRY CATCH
    try {
        //declarar la conexion a sql server
        Statement sql = (Statement) Conexion.getConexion().createStatement();
        //variable con la sentencia o script sql
         String Consulta = " Select numeroVuelo " +
                           " From Vuelo " +
                           " Where idVuelo = " + Id ; 
     //Ejecutar la consulta t llenar una estructura con el o los resultados obtenidos 
     ResultSet rs = sql.executeQuery(Consulta);
     while (rs.next()){
         //resultado = Integer.valueOf(rs.getString(1));//es mejor este 
         resultado = rs.getString(1);//este es bueno pero
     }
        
            
    }catch(SQLServerException e){
             JOptionPane.showMessageDialog(null, e.toString());
        
                    
                    }
    
    
    return resultado;
}
    
}
