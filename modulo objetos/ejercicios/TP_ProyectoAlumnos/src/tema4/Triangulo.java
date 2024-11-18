/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author valen
 */
public class Triangulo extends Figura {

    private int lado1;
    private int lado2;
    private int lado3;
    
    public Triangulo (int lado1, int lado2, int lado3, String colorLinea, String colorRelleno){
        super (colorRelleno, colorLinea);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }
    
    
    public double calcularArea() {
        double s = (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
        return Math.sqrt(s * (s - this.getLado1()) * (s - this.getLado2()) * (s - this.getLado3())); 
    }

    public double calcularPerimetro() {
        return this.getLado1() + this.getLado2() + this.getLado3();
    }
    
    public String toString(){
        String aux =  "Lado 1: " + this.getLado1() +
                      "Lado 2: " + this.getLado2() +
                      "Lado 3: " + this.getLado3() +
                      super.toString();
             return aux;
    }
    public void despintar (){
        this.setColorLinea("negra");
        this.setColorRelleno("blanco");
    }
}
