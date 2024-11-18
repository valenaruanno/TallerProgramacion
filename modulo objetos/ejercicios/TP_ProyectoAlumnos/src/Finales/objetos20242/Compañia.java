/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales.objetos20242;

/**
 *
 * @author valen
 */
public class Compañia {
    private Poliza [][] compañia = new Poliza [2][10];
    private int [] vectorDimL = new int [10];
    private int dimF = 2;

    public Compañia() {
        for (int i = 0; i < vectorDimL.length; i++)
            vectorDimL[i]= 0;
    }
    
    public Poliza getCompañia (int f, int c){
        return this.compañia[f][c];
    }
    
    public void agregarPoliza (Poliza unaPoliza, int unRubro){
        if (vectorDimL[unRubro - 1] < this.dimF){
            compañia [vectorDimL[unRubro - 1]][unRubro - 1] = unaPoliza;
            vectorDimL[unRubro - 1] += 1;
        } else 
            System.out.println("No hay mas espacio en el rubro");
    }
    
    public String infoCliente (int unDni){
        String aux = "";
        for (int c = 0; c < 10; c++){
            for (int f = 0; f < vectorDimL[c]; f++){
                if (compañia [f][c].getCli().getDni() == unDni)
                    aux += compañia[f][c].toString();
            }
        }
        return aux;
    }
    
    public void aumentarCuotas (double unPorcentaje, int unRubro){
        for (int i = 0; i < vectorDimL[unRubro]; i++)
            compañia [i][unRubro].setValorCuota(compañia [i][unRubro].getValorCuota() * unPorcentaje);
    }
    
    public int cantidadAVencer (int mes, int año){
        int cant = 0;
        for (int c = 0; c < 10; c++){
            for (int f = 0; f < vectorDimL [c]; f++){
                if ((compañia[f][c].getFechaF().getMes() == mes) && (compañia[f][c].getFechaF().getAño() == año))
                    cant++;
            }
        }
        return cant;
    }
}