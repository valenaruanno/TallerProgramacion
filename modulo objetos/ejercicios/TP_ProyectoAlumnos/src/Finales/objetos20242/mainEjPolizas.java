/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales.objetos20242;

/**
 *
 * @author valen
 */
public class mainEjPolizas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Cliente c1 = new Cliente (46004, "Valentin", "Aruanno"); 
        Cliente c2 = new Cliente (47089, "Abril", "Aruanno"); 
        Cliente c3 = new Cliente (21828, "Carolina", "Aruanno"); 
        Cliente c4 = new Cliente (20796, "Diego", "Aruanno"); 
        Cliente c5 = new Cliente (00000, "Pepe", "Aruanno"); 
        
        Fecha f1 = new Fecha (1,2,2024);
        Fecha f2 = new Fecha (10,10,2024);
        
        Poliza p1 = new Poliza (2000, 100, f1, f2, c1);
        Poliza p2 = new Poliza (3000, 100, f1, f2, c2);
        Poliza p3 = new Poliza (4000, 100, f1, f2, c3);
        Poliza p4 = new Poliza (5000, 100, f1, f2, c4);
        Poliza p5 = new Poliza (6000, 100, f1, f2, c5);
        
        Compañia c = new Compañia ();
        
        c.agregarPoliza(p1, 1);
        c.agregarPoliza(p2, 2);
        c.agregarPoliza(p3, 3);
        c.agregarPoliza(p4, 4);
        c.agregarPoliza(p5, 5);
        
        int dni = 46004;
        System.out.println("---------------------------------------- Info Cliente -----------------------------------------");
        System.out.println(c.infoCliente(dni));
        System.out.println("---------------------------------------- Aumento Cuota -----------------------------------------");
        c.aumentarCuotas(1.11, 3);
        System.out.println("Valor de la cuota seguro de vida 3. " + c.getCompañia(0, 3));
        System.out.println("---------------------------------------- Poliza a vencer -----------------------------------------");
        System.out.println(c.cantidadAVencer(10, 2024));
    }
    
}
