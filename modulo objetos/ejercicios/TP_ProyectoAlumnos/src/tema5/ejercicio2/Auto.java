/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.ejercicio2;

/**
 *
 * @author valen
 */
public class Auto {
    private String nombre;
    private int patente;

    public Auto(String nombre, int patente) {
        this.nombre = nombre;
        this.patente = patente;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPatente() {
        return patente;
    }

    private void setPatente(int patente) {
        this.patente = patente;
    }
    
    public String toString (){
        return "El nombre del dueño del auto es " + this.getNombre() + " y la patente del auto es " + this.getPatente();
    }
    
    
}
