/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.ejercicio1;

/**
 *
 * @author valen
 */
public class mainEjercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Subsidio sub1 = new Subsidio (2000, "Utileria");
        Subsidio sub2 = new Subsidio (2000, "Hoteleria");
        sub2.setOtorgado(true);
        Investigador inv1 = new Investigador ("Valentin Aruanno", 1, "Jardinero");
        inv1.agregarSubsidio(sub2);
        inv1.agregarSubsidio(sub1);
        
        Subsidio sub3 = new Subsidio (4000, "ss");
        Subsidio sub4 = new Subsidio (4000, "ss");
        sub3.setOtorgado(true);
        Investigador inv2 = new Investigador ("Abril Manzur", 2, "Arquitecta");
        inv2.agregarSubsidio(sub3);
        inv2.agregarSubsidio(sub4);
        
        Subsidio sub5 = new Subsidio (6000, "ss");
        Subsidio sub6 = new Subsidio (6000, "ss");
        sub5.setOtorgado(true);
        Investigador inv3 = new Investigador ("Carolina Di Masi", 3, "Abogada");
        inv3.agregarSubsidio(sub5);
        inv3.agregarSubsidio(sub6);
        
        Proyecto pr = new Proyecto ("Restructuracion",201,"Diego Aruanno");
        pr.agregarInvestigador(inv3);
        pr.agregarInvestigador(inv2);
        pr.agregarInvestigador(inv1);
        
        System.out.println(pr.toString());
    }
    
}
