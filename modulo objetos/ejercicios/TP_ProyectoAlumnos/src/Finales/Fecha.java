/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales;

/**
 *
 * @author valen
 */
public class Fecha {
    private int dia;
    private int mes;
    private int anio;

    public Fecha(int dia, int mes, int anio) {
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getDia() {
        return dia;
    }

    private void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    private void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    private void setAnio(int anio) {
        this.anio = anio;
    }
    
    public String toString (){
        return this.dia + "/" + this.mes + "/" + this.anio;
    }
}
