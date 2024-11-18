/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.ejercicio4;

import tema2.Persona;

/**
 *
 * @author valen
 */
public class Habitacion extends Persona {
     private boolean ocupada;
     private double costo;

    public Habitacion(boolean ocupada, double costo) {
        this.ocupada = ocupada;
        this.costo = costo;
    }
    

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    
    public void añadirCliente (String nombre, int dni, int edad){
        super.setNombre(nombre);
        super.setDNI(dni);
        super.setEdad(edad);
        this.ocupada = true;
    }
    
    public String toString (){
        return "cliente " + super.getNombre() + ", dni " + super.getDNI() + ", edad " + super.getEdad();
    }
}
