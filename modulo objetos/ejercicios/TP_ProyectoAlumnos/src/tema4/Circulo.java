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
public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularPerimetro (){
        return 2 * Math.PI * this.getRadio();
    }
    
    public double calcularArea (){
        return Math.PI * (this.getRadio() * this.getRadio());
    }
    
    public String toString(){
        String aux =  "Radio: " + this.getRadio() +
                      super.toString();
             return aux;
    }
    
}
