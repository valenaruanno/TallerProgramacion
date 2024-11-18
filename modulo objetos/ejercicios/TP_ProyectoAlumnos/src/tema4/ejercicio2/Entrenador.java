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
public class Entrenador extends Empleado{
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad (){
        return this.getCampeonatosGanados() / this.getAntiguedad();
    }
    
    public double calcularSueldoACobrar (){
        double diez = (this.getSueldoBasico() * 10) / 100;
        double monto = this.getSueldoBasico() + (diez * this.getAntiguedad());
            if (this.getCampeonatosGanados() >= 1 && this.getCampeonatosGanados() <= 4)
                monto += 5000;
            else {
                if (this.getCampeonatosGanados() >= 5 && this.getCampeonatosGanados() <= 10)
                    monto += 30000;
                else 
                    monto += 50000;
            }
        return monto;
    }
    
    public String toString (){
        return this.getNombre() + " cobrara " + this.calcularSueldoACobrar() + " y tiene una efectividad del " + this.calcularEfectividad() + "%.";
    }
    
}
