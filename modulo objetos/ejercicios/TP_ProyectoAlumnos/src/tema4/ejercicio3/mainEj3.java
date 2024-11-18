/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio3;

import tema2.Persona;

/**
 *
 * @author valen
 */
public class mainEj3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Persona per = new Persona ("Valentin Aruanno", 46004657, 19);
        Trabajador tra = new Trabajador ("Abril Manzur", 47089490, 18, "Arquitecta");
        
        System.out.println(per.toString());
        System.out.println(tra.toString());
    }
    
}
