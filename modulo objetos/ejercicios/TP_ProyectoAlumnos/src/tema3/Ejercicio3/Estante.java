/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.Ejercicio3;

import tema3.Libro;

/**
 *
 * @author valen
 */
public class Estante {
    private Libro [] estante;
    private int cantLibros;
    
    public Estante (){
        estante = new Libro [20];
        cantLibros =0;
    }
    
    public int getCantLibros (){
        return this.cantLibros;
    }

    public boolean isLleno (){
        return this.cantLibros == 19;
    }
    
    public void addLibro (Libro libro){
        if (this.cantLibros != 20){
            estante[this.cantLibros] = libro;
            this.cantLibros++;
        }
    }
    
    public Libro devolver (String titulo){
        Libro libro = null;
        int i = 0;
        while ((i < this.cantLibros) && (libro == null)){
            if (estante[i].getTitulo().equals(titulo))
                libro = estante[i];
            else 
                i++;
        }
        return libro;
    }
    
}
