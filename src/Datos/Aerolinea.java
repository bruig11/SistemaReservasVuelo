/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

/**
 *
 * @author Garay_Ruiz
 */
public class Aerolinea {

    int idAeroline;
    String nombreAerolinea;
    String codigoAerolinea; 
    String reserva; 
    String detalleReserva;
    String facturacion; 
         
    
    //CONSTRUCTOR 
    public Aerolinea() {
    }

    public Aerolinea(int idAeroline, String nombreAerolinea, String codigoAerolinea, String reserva, String detalleReserva, String facturacion) {
        this.idAeroline = idAeroline;
        this.nombreAerolinea = nombreAerolinea;
        this.codigoAerolinea = codigoAerolinea;
        this.reserva = reserva;
        this.detalleReserva = detalleReserva;
        this.facturacion = facturacion;
    }

    
    //Getter and Setter 
    
    public int getIdAeroline() {
        return idAeroline;
    }

    public void setIdAeroline(int idAeroline) {
        this.idAeroline = idAeroline;
    }

    public String getNombreAerolinea() {
        return nombreAerolinea;
    }

    public void setNombreAerolinea(String nombreAerolinea) {
        this.nombreAerolinea = nombreAerolinea;
    }

    public String getCodigoAerolinea() {
        return codigoAerolinea;
    }

    public void setCodigoAerolinea(String codigoAerolinea) {
        this.codigoAerolinea = codigoAerolinea;
    }

    public String getReserva() {
        return reserva;
    }

    public void setReserva(String reserva) {
        this.reserva = reserva;
    }

    public String getDetalleReserva() {
        return detalleReserva;
    }

    public void setDetalleReserva(String detalleReserva) {
        this.detalleReserva = detalleReserva;
    }

    public String getFacturacion() {
        return facturacion;
    }

    public void setFacturacion(String facturacion) {
        this.facturacion = facturacion;
    }
  
}
