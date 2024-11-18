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
public class Proyecto {
    private String nombre;
    private int cod;
    private String nombreDirec;
    private int tamaño = 3;
    private int cant = 0;
    private Investigador [] vector = new Investigador [tamaño]; //acoto la cantidad de investigadores de 50 a 3

    public Proyecto(String nombre, int cod, String nombreDirec) {
        this.nombre = nombre;
        this.cod = cod;
        this.nombreDirec = nombreDirec;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCod() {
        return cod;
    }

    private void setCod(int cod) {
        this.cod = cod;
    }

    public String getNombreDirec() {
        return nombreDirec;
    }

    private void setNombreDirec(String nombreDirec) {
        this.nombreDirec = nombreDirec;
    }
    
    public Investigador[] getVector() {
        return vector;
    }

    private void setVector(Investigador[] vector) {
        this.vector = vector;
    }
    
    public void agregarInvestigador (Investigador unInvestigador){
        if (cant < tamaño){
            vector[cant] = unInvestigador;
            cant++;
        }
    }
    
    public void otorgarTodos (String nombre_completo){
        Investigador inv = null;
        int i = 0;
        while ((i < vector.length) && (inv == null)){
            if (vector[i].getNombre().equals(nombre_completo))
                inv = vector[i];
        }
        if (inv != null){
            Subsidio [] sub = inv.getVector();
            for (int s = 0; s < inv.getVector().length; s++){
                if (sub[s].isOtorgado() == false)
                    sub[s].setOtorgado(true);
            }
        }
    }
    
    public double dineroTotalOtorgado (){
        double tot = 0;
        for (int i = 0; i < vector.length; i++){
            if (vector[i] != null)
                tot += vector[i].dineroOtorgado();
        }
        return tot;
    }
    public String toString (){
        String aux = this.getNombre() + ", " + this.getCod() + ", " + this.nombreDirec + ", " + this.dineroTotalOtorgado() + ". Investigadores: ";
        for (int i = 0; i < vector.length; i++){
            aux += vector[i].toString();
        }   
        return aux;
    }
}
