/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio6;

/**
 *
 * @author valen
 */
public class Estacion {
    private String nombre;
    private String latitud;
    private String longitud;
    private double [][] estacionNacional;
    private int años;
    private int puntoPartida;

    public Estacion(String nombre, String latitud, String longitud, int años, int punto) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        estacionNacional = new double [12][años];
        for (int m = 0; m < 12; m++){
            for (int i = 0; i < años; i++)
                estacionNacional [m][i] = 9999;
        }
        this.años = años;
        this.puntoPartida = punto;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLatitud() {
        return latitud;
    }

    private void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    private void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public double[][] getEstacionNacional() {
        return estacionNacional;
    }

    private void setEstacionNacional(double[][] estacionNacional) {
        this.estacionNacional = estacionNacional;
    }

    public int getAños() {
        return años;
    }

    private void setAños(int años) {
        this.años = años;
    }

    public int getPuntoPartida() {
        return puntoPartida;
    }

    private void setPuntoPartida(int puntoPartida) {
        this.puntoPartida = puntoPartida;
    }
    
    
    public void registrarTemperatura (int año, int mes, double valor){
       this.estacionNacional [mes][año] = valor; 
    }
    
    public double retornarTemperatura (int año, int mes){
        return this.estacionNacional [mes] [año];
    }
    
    public String maxTemperatura (){
        double max = -1;
        int mesMax = 0;
        int añoMax = 0;
        for (int m = 0; m < 12; m++){
            for (int a = 0; a < this.años; a++){
                if (this.estacionNacional [m][a] > max){
                    max = this.estacionNacional [m][a];
                    mesMax = m;
                    añoMax = a;
                }    
            }
        }
        
        return "El mes y el año en que se registraron mayores temperaturas fue el " + mesMax + "/ " + añoMax;
    }
    
    
}
