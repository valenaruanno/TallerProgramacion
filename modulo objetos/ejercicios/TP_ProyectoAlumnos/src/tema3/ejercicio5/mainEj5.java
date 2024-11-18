/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.ejercicio5;

/**
 *
 * @author valen
 */
public class mainEj5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Circulo cir = new Circulo (10,"Rojo","Azul");   
        System.out.println(cir.calcularPerimetro());
        System.out.println(cir.calcularArea());
    }
    
}
