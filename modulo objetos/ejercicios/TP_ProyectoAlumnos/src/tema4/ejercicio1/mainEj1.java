/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio1;

import tema3.ejercicio1.Triangulo;
import tema3.ejercicio5.Circulo;

/**
 *
 * @author valen
 */
public class mainEj1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Triangulo tri = new Triangulo (10, 10, 10, "rojo", "azul");
        Circulo cir = new Circulo (5, "azul", "rojo");
        
        System.out.println("Representacion del circulo: " + cir.toString());
       
        System.out.println("Representacion del triangulo" + tri.toString());
        
        tri.despintar();
        
    }
    
}
