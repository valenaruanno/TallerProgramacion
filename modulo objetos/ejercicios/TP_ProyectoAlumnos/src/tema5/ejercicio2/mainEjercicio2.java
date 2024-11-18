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
public class mainEjercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Estacionamiento es = new Estacionamiento ("Don pepe","493","8:00","21:00",2,2);
        
        Auto a1 = new Auto ("Diego",1);
        Auto a2 = new Auto ("Carolina",2);
        Auto a3 = new Auto ("Abril",3);
        Auto a4 = new Auto ("Valentin",4);
        
        es.estacionar(a1, 1, 1);
        es.estacionar(a2, 1, 2);
        es.estacionar(a3, 2, 1);
        es.estacionar(a4, 2, 2);
        
        es.buscarAuto(1);
        System.out.println(es.buscarCantidad(2));
        
        System.out.println(es.toString());
    }
    
}
