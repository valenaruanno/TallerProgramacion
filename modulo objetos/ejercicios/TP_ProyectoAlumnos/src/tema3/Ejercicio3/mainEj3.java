/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ejercicio3;

import tema3.Autor;
import tema3.Libro;

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
        Estante es = new Estante ();
        Autor aut = new Autor ("valentin","bibliografia","origen");
        Libro libro = new Libro ("Mujercitas","aaa",2014, aut,"aaa",200);
        Libro libro1 = new Libro ("Hola","aaa",2014, aut,"aaa",200);
        Libro libro2 = new Libro ("Chau","aaa",2014, aut,"aaa",200);
        es.addLibro(libro);
        es.addLibro(libro1);
        es.addLibro(libro2);
        if (es.devolver("Mujercitas") != null)
            System.out.println("El autor del libro Mujercitas es " + es.devolver("Mujercitas").getPrimerAutor().getNombre());
        else 
            System.out.println("No existe Mujercitas");
    }
    
}
