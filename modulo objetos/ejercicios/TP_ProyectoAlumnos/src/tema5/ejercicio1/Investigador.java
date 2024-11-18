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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int tamaño = 2;
    private Subsidio [] vector = new Subsidio [tamaño]; //acoto la cantidad de subsidios de 5 a 2

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    private void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    private void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getVector() {
        return vector;
    }

    private void setVector(Subsidio[] vector) {
        this.vector = vector;
    }
    
    public void agregarSubsidio (Subsidio unSubsidio){
         for (int i = 0; i < vector.length; i++){
            if (vector[i] == null)
                vector[i] = unSubsidio;
        }
    }
    
    public double dineroOtorgado (){
        double total = 0;
        for (int i = 0; i < vector.length; i++)
            total += vector[i].getMonto();
        return total;
    }
    
    public String toString (){
        return this.getNombre() + ", " + this.getCategoria() + ", " + this.getEspecialidad() + ", " + this.dineroOtorgado() + ".";
    }
}
