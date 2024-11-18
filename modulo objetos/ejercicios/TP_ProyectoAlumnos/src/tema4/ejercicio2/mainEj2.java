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
public class mainEj2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Jugador ju = new Jugador (10,10,"Valentin", 1000, 10);
        Entrenador en = new Entrenador (3, "Abril",1200,3);
        
        System.out.println(ju.toString());
        System.out.println(en.toString());
    }
    
}
