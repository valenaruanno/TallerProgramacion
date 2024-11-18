/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.ejercicio4;

/**
 *
 * @author valen
 */
public class mainEj4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Hotel h = new Hotel (4);
        h.añadirClienteHabitacion(1, "Abril Manzur", 47089490, 18);
        h.añadirClienteHabitacion(2, "Carolina Di Masi", 21828530, 52);
        h.añadirClienteHabitacion(3, "Diego Aruanno", 20796234, 54);
        System.out.println("------------------------------------------Imprimo el hotel-------------------------------------------------");
        h.toStringHotel();
        System.out.println("------------------------------------------Imprimo el hotel con aumento-------------------------------------------------");
        h.aumento(2000);
        h.toStringHotel();
    }
    
}
