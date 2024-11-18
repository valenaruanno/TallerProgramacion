/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.ejercicio5;

import tema4.Figura;

/**
 *
 * @author valen
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;

    public VisorFigurasModificado(){
        this.guardadas = 0;
        vector = new Figura [this.capacidadMaxima];
    }

    public void guardar(Figura f){
        if (this.guardadas < 5){
            vector[this.guardadas] = f;
            this.guardadas++;
        } else 
            System.out.println("No queda espacio");
                
    }
    
    public boolean quedaEspacio(){
            return this.guardadas < 5;
   }

    public void mostrar(){
            for (int i = 0; i < this.guardadas; i++)
                System.out.println (vector[i].toString());
    }
    public int getGuardadas() {
        return guardadas;
    }

}
