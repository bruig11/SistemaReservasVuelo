/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.Date;
/**
 *
 * @author Garay_Ruiz
 */
public class Reserva {

    int idReserva;
    int idCliente; 
    int idVuelo; 
    java.sql.Date fechaReserva; 
    String CodigoConfirmacion; 
    String EstadoReserva; 
    String NumeroAsiento; 
    float precioTotal; 
    
    public Reserva() {
    }

    public Reserva(int idReserva, int idCliente, int idVuelo, Date fechaReserva, String CodigoConfirmacion, String EstadoReserva, String NumeroAsiento, float precioTotal) {
        this.idReserva = idReserva;
        this.idCliente = idCliente;
        this.idVuelo = idVuelo;
        this.fechaReserva = fechaReserva;
        this.CodigoConfirmacion = CodigoConfirmacion;
        this.EstadoReserva = EstadoReserva;
        this.NumeroAsiento = NumeroAsiento;
        this.precioTotal = precioTotal;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdVuelo() {
        return idVuelo;
    }

    public void setIdVuelo(int idVuelo) {
        this.idVuelo = idVuelo;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public String getCodigoConfirmacion() {
        return CodigoConfirmacion;
    }

    public void setCodigoConfirmacion(String CodigoConfirmacion) {
        this.CodigoConfirmacion = CodigoConfirmacion;
    }

    public String getEstadoReserva() {
        return EstadoReserva;
    }

    public void setEstadoReserva(String EstadoReserva) {
        this.EstadoReserva = EstadoReserva;
    }

    public String getNumeroAsiento() {
        return NumeroAsiento;
    }

    public void setNumeroAsiento(String NumeroAsiento) {
        this.NumeroAsiento = NumeroAsiento;
    }

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }

    
    
}
