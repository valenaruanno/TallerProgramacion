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
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto [][] lugares;
    private int pisos;
    private int plazas;

    public Estacionamiento (String nombre, String direccion){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.lugares = new Auto [5] [10];
        this.pisos = 5;
        this.plazas = 10;
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos = pisos;
        this.plazas = plazas;
        this.lugares = new Auto [pisos][plazas];
    }
    
    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    private void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    private void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getLugares() {
        return lugares;
    }

    private void setLugares(Auto[][] lugares) {
        this.lugares = lugares;
    }

    public int getPisos() {
        return pisos;
    }

    private void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    private void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    
    public void estacionar (Auto auto, int piso, int plaza){
        this.lugares [piso - 1][plaza - 1] = auto;
    }
    
    public void buscarAuto (int patente){
        boolean listo = false;
        int filas = 0;
        int colum = 0;
        while ((filas < this.getPisos()) && (!listo)){
            while ((colum < this.getPlazas()) && (!listo)){
                if (lugares [filas][colum].getPatente() == patente)
                    listo = true;
                else 
                    colum++;
            }
            if (!listo)
                filas++;
        }
        if (listo)
            System.out.println("El auto con la patente ingresada se encuentra en el piso " + filas + ", plaza " + colum);
        else 
            System.out.println("Auto inexistente");
    }
    
    public String toString (){
        String aux = "";
        for (int f = 0; f < this.getPisos(); f++){ 
            for (int p = 0; p < this.getPlazas(); p++){
                int fila = f +1;
                aux += "Piso " + fila;
                int piso = p + 1;
                if (lugares [f][p] != null)
                    aux += " Plaza " + piso + ": " + lugares[f][p].toString() + ". ";
                else 
                    aux += " Plaza " + piso + ": libre. ";
            }
        }
        return aux;
    }
    
    public int buscarCantidad (int y){
        int cant = 0;
        for (int f = 0; f < this.getPisos(); f++){
            if (lugares [f][y - 1] != null)
                cant++;
        }
        return cant;   
    }
}
