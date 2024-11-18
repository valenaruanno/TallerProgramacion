/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author valen
 */
public class mainEj4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Persona [][] casting = new Persona [8][5];
        String nombre;
        int dni = 0;
        int edad = 0;
        int dia = 0;
        System.out.println("Ingrese el nombre de la persona");
        nombre = Lector.leerString();
        if (nombre != "zzz"){
            System.out.println("Ingrese el dni de la persona");
            dni = Lector.leerInt();
            System.out.println("Ingrese la edad de la persona");
            edad = Lector.leerInt();
            System.out.println ("Ingrese el dia al que se quiere inscribir");
            dia = Lector.leerInt();
        }
        int dimF = 0;
        int dimC = 0;
        while (!(nombre.equals("zzz")) && (dimC <= 7)){
            Persona per = new Persona (nombre, dni, edad);
            while ((casting [dimF][dia] != null) && (dimF <= 7))
                dimF++;
            if (dimF <= 7)
                casting[dimF][dia] = per;
            else {
                System.out.println ("En el dia seleccionado no se encuentran disponibles turnos");
                dimC++;
            }
            System.out.println("Ingrese el nombre de la persona");
            nombre = Lector.leerString();
            if (nombre != "zzz"){
                System.out.println("Ingrese el dni de la persona");
                dni = Lector.leerInt();
                System.out.println("Ingrese la edad de la persona");
                edad = Lector.leerInt();
                System.out.println ("Ingrese el dia al que se quiere inscribir");
                dia = Lector.leerInt();
            }
        }
        
        dimF = 7;
        dimC = 4;
        for (int i = 0; i <= dimC; i++){
            int f = 0;
            int cant = 0;
            while ((f <= 7)){
                if (casting [f][i] != null){
                    cant++;
                    System.out.println ("La persona a entrevistar el dia " + i + " en el turno " + f + " es: " + casting[f][i].getNombre());
                }
                f++;
            }
            System.out.println("La cantidad de personas inscriptas del dia " + i + " es: " + cant);
        }
    }    
}
