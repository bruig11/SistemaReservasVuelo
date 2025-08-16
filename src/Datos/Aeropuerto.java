/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

/**
 *
 * @author Garay_Ruiz
 */
public class Aeropuerto {
    
    int idAeropuerto; 
    String codigoAeropueto;
    String Nombre;
    String Ciudad; 
    String Pais;
    
    
    public Aeropuerto() {
    }

    public Aeropuerto(int idAeropuerto, String codigoAeropueto, String Nombre, String Ciudad, String Pais) {
        this.idAeropuerto = idAeropuerto;
        this.codigoAeropueto = codigoAeropueto;
        this.Nombre = Nombre;
        this.Ciudad = Ciudad;
        this.Pais = Pais;
    }

    public int getIdAeropuerto() {
        return idAeropuerto;
    }

    public void setIdAeropuerto(int idAeropuerto) {
        this.idAeropuerto = idAeropuerto;
    }

    public String getCodigoAeropueto() {
        return codigoAeropueto;
    }

    public void setCodigoAeropueto(String codigoAeropueto) {
        this.codigoAeropueto = codigoAeropueto;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public void setCiudad(String Ciudad) {
        this.Ciudad = Ciudad;
    }

    public String getPais() {
        return Pais;
    }

    public void setPais(String Pais) {
        this.Pais = Pais;
    }
   
    
    
}
