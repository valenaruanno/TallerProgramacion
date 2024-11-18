/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio2;

/**
 *
 * @author valen
 */
public class Jugador extends Empleado{
    private int numPartidos;
    private int numGoles;
    
    public Jugador (int numGoles, int numPartidos, String nombre, double sueldoBasico, int antiguedad){
        super (nombre, sueldoBasico, antiguedad);
        this.numPartidos = numPartidos;
        this.numGoles = numGoles;
    }

    public int getNumPartidos() {
        return numPartidos;
    }

    public void setNumPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public int getNumGoles() {
        return numGoles;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    public double calcularEfectividad (){
        return this.getNumGoles() / this.getNumPartidos();
    }
    
    public double calcularSueldoACobrar (){
        double diez = (this.getSueldoBasico() * 10) / 100;
        double monto = this.getSueldoBasico() + (diez * this.getAntiguedad());
        if (this.calcularEfectividad()> 0.5)
            monto += this.getSueldoBasico();
        return monto;
    }
    
    public String toString (){
        return this.getNombre() + " cobrara " + this.calcularSueldoACobrar() + " y tiene una efectividad del " + this.calcularEfectividad() + "%.";
    }
}
