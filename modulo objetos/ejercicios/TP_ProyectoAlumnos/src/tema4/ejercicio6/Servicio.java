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
public class Servicio {
    private int [] estacionNacional;
    private int años;
    private int puntoPartida;
    
    public Servicio (int años, int punto){
        estacionNacional = new int [años];
        for (int i = 0; i < años; i++)
            estacionNacional[i] = 9999;
        this.años = años;
        this.puntoPartida = punto;
    }
        
    
    
}
