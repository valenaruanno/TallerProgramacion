/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales;

/**
 *
 * @author valen
 */
public class mainFinal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Cliente c = new Cliente (46004,"Aruanno", "Valentin");
        Cliente c1 = new Cliente (46005,"Aruanno", "Valentin");
        Cliente c2= new Cliente (46006,"Aruanno", "Valentin");
        Cliente c3 = new Cliente (46007,"Aruanno", "Valentin");
        Cliente c4 = new Cliente (46008,"Aruanno", "Valentin");
        
        Poliza p1 = new Poliza (20, 10, 28, 8, 2024, 30, 8, 2024, c);
        Poliza p2 = new Poliza (20, 10, 28, 8, 2024, 30, 8, 2024, c1);
        Poliza p3 = new Poliza (20, 10, 28, 8, 2024, 30, 8, 2024, c2);
        Poliza p4 = new Poliza (20, 10, 28, 8, 2024, 30, 8, 2024, c3);
        Poliza p5 = new Poliza (20, 10, 28, 8, 2024, 30, 8, 2024, c4);
        
        Compania com = new Compania (3, 2);
        com.agregarPolizaz(p1, 0);
        com.agregarPolizaz(p2, 0);
        com.agregarPolizaz(p3, 1);
        com.agregarPolizaz(p4, 1);
        com.agregarPolizaz(p5, 2);
        
        System.out.println(com.imprimirCompania());
        System.out.println("---------------------------------------------------------------------------------------");
        System.out.println(com.infoCliente(46004));
        com.aumentarCostos(1.11, 2);
        System.out.println("---------------------------------------------------------------------------------------");
        System.out.println(com.cantidadAVencer(8, 2024));
        System.out.println("---------------------------------------------------------------------------------------");
        System.out.println(com.imprimirCompania());
    }
    
}
