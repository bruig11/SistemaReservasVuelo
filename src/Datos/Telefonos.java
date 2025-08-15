/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

/**
 *
 * @author Garay_Ruiz
 */
public class Telefonos {
    
    int idTelefono; 
    String Cliente;
    String telefono;
    
    public Telefonos(){
        
    }
    
                
    public Telefonos(int idTelefono, String Cliente, String telefono) {
        this.idTelefono = idTelefono;
        this.Cliente = Cliente;
        this.telefono = telefono;
    }

    public int getIdTelefono() {
        return idTelefono;
    }

    public void setIdTelefono(int idTelefono) {
        this.idTelefono = idTelefono;
    }

    public String getCliente() {
        return Cliente;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
            
}
