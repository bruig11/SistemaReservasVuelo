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
public class Vuelo {

    int idVuelo;
    int idAerolinea;
    int idAeropuertoOrigen;
    int idAeropuertoDestino;
    int NumeroVuelo;
    java.sql.Date fechaSalida;
    String horaSalida;
    java.sql.Date fecha;
    String horaLlegada;
    String PrecioBase;
    String AsientosDisponibles;
    String Estado;

    public Vuelo() {
    }

    public Vuelo(int idVuelo, int idAerolinea, int idAeropuertoOrigen, int idAeropuertoDestino, 
            int NumeroVuelo, Date fechaSalida, String horaSalida, Date fecha, 
            String horaLlegada, String PrecioBase, String AsientosDisponibles, String Estado) {
        
        this.idVuelo = idVuelo;
        this.idAerolinea = idAerolinea;
        this.idAeropuertoOrigen = idAeropuertoOrigen;
        this.idAeropuertoDestino = idAeropuertoDestino;
        this.NumeroVuelo = NumeroVuelo;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.fecha = fecha;
        this.horaLlegada = horaLlegada;
        this.PrecioBase = PrecioBase;
        this.AsientosDisponibles = AsientosDisponibles;
        this.Estado = Estado;
    }

    public int getIdVuelo() {
        return idVuelo;
    }

    public void setIdVuelo(int idVuelo) {
        this.idVuelo = idVuelo;
    }

    public int getIdAerolinea() {
        return idAerolinea;
    }

    public void setIdAerolinea(int idAerolinea) {
        this.idAerolinea = idAerolinea;
    }

    public int getIdAeropuertoOrigen() {
        return idAeropuertoOrigen;
    }

    public void setIdAeropuertoOrigen(int idAeropuertoOrigen) {
        this.idAeropuertoOrigen = idAeropuertoOrigen;
    }

    public int getIdAeropuertoDestino() {
        return idAeropuertoDestino;
    }

    public void setIdAeropuertoDestino(int idAeropuertoDestino) {
        this.idAeropuertoDestino = idAeropuertoDestino;
    }

    public int getNumeroVuelo() {
        return NumeroVuelo;
    }

    public void setNumeroVuelo(int NumeroVuelo) {
        this.NumeroVuelo = NumeroVuelo;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(String horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    public String getPrecioBase() {
        return PrecioBase;
    }

    public void setPrecioBase(String PrecioBase) {
        this.PrecioBase = PrecioBase;
    }

    public String getAsientosDisponibles() {
        return AsientosDisponibles;
    }

    public void setAsientosDisponibles(String AsientosDisponibles) {
        this.AsientosDisponibles = AsientosDisponibles;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

}
