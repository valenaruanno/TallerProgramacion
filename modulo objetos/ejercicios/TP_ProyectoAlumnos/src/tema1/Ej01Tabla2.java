/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        //System.out.println("2x" + "5" + "="+ tabla2[5]);
        
        int num;
        num = GeneradorAleatorio.generarInt(12);
        System.out.println("El numero generado es el " + num);
        while (num != 11){
            System.out.println(tabla2[num]);
            num = GeneradorAleatorio.generarInt(12);
            System.out.println("El numero generado es el " + num);
        }

    }
    
}
