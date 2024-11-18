/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio5;

import tema4.Cuadrado;
import tema4.Rectangulo;
import tema4.ejercicio4.VisorFiguras;

/**
 *
 * @author valen
 */
public class mainVisorFigurasModificado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        VisorFigurasModificado visor = new VisorFigurasModificado();

        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        visor.guardar(c1);
        Rectangulo r = new Rectangulo(20,10,"Azul","Celeste");
        visor.guardar(r);
        Cuadrado c2 = new Cuadrado(30,"Rojo","Naranja");
        visor.guardar(c2);
        //visor.guardar(c1);
        //visor.guardar(c2);
        //visor.guardar(r);
        visor.mostrar();
        System.out.println(visor.getGuardadas());
        System.out.println(visor.quedaEspacio());
    }
    
}
