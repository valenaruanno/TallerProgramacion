/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales;

/**
 *
 * @author valen
 */
public class Compania {
    private Poliza [][] polizasCompania;
    private int dimF = 0;
    private int dimC = 0;
    private int dimensionF = 0;
    private int dimensionC = 0;
    // private int [] dimension; 
    
    public Compania (int cantRubros, int cantPolizasPorSeguro){
        polizasCompania = new Poliza [cantRubros][cantPolizasPorSeguro];
        this.dimensionF = cantRubros;
        this.dimensionC = cantPolizasPorSeguro;
    }

    public Poliza[][] getPolizasCompania() {
        return polizasCompania;
    }

    public void setPolizasCompania(Poliza[][] polizasCompania) {
        this.polizasCompania = polizasCompania;
    }   

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimC() {
        return dimC;
    }

    public void setDimC(int dimC) {
        this.dimC = dimC;
    }

    public int getDimensionF() {
        return dimensionF;
    }

    public void setDimensionF(int dimensionF) {
        this.dimensionF = dimensionF;
    }

    public int getDimensionC() {
        return dimensionC;
    }

    public void setDimensionC(int dimensionC) {
        this.dimensionC = dimensionC;
    }
    
    
    public void agregarPolizaz (Poliza unaPoliza, int unRubro){
        if (dimC < this.dimensionC){
            polizasCompania [unRubro][dimC] = unaPoliza;
            dimC++;
        } else {
            System.out.println("No se pudo agregar la poliza por que no quedan mas espacios para el rubro seleccionado");
            this.dimensionF++;
            dimF++;
        }
    }
    
    public String infoCliente (int unDni){
        String aux = "Las polizas que tiene el cliente son: ";
        for (int f = 0; f < this.dimensionF; f++){
            for (int c = 0; c < this.dimensionC; c++){
                if (polizasCompania [f][c].getCli().getDni() == unDni)
                    aux += polizasCompania [f][c].toString() + ". ";
            }
        }
        
        return aux;
    }
    
    public void aumentarCostos (double unPorcentaje, int unRubro){
        for (int c = 0; c < this.dimensionC; c++)
            this.polizasCompania[unRubro][this.dimensionC].setCuota(this.polizasCompania[unRubro][this.dimensionC].getCuota() * unPorcentaje);
    }
    
    public int cantidadAVencer (int mes, int año){
        int cant = 0;
        for (int f = 0; f < this.dimensionF; f++){
            for (int c = 0; c < this.dimensionC; c++){
                if (polizasCompania[f][c].getFechaFin().getMes() == mes && polizasCompania[f][c].getFechaFin().getAnio() == año)
                    cant++;
            }    
        }
        return cant;
    }
    
    
    public String imprimirCompania (){
        String aux = "";
        for (int f = 0; f < this.dimensionF; f++){
            for (int c = 0; c < this.dimensionC; c++)
                aux += polizasCompania [f][c].getCli().getDni() + "| ";
        }
        return aux;
    }
}

//<