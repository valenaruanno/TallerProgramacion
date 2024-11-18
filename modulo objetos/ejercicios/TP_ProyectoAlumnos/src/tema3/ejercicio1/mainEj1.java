/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.ejercicio1;
import PaqueteLectura.Lector;
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
        double lado1 = Lector.leerDouble();
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        String colorLinea = Lector.leerString();
        String colorRelleno = Lector.leerString();
        Triangulo trin = new Triangulo (lado1, lado2, lado3, colorRelleno, colorLinea);
        
        System.out.println("El perimetro del triangulo es: " + trin.calcularPerimetro());
        System.out.println("El area del triangulo es: " + trin.calcularArea());
    }
    
}
