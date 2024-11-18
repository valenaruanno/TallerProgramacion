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
public class mainEj3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Persona [][] casting = new Persona [4][7];
        String nombre;
        int dni = 0;
        int edad = 0;
        System.out.println("Ingrese el nombre de la persona");
        nombre = Lector.leerString();
        if (nombre != "zzz"){
            System.out.println("Ingrese el dni de la persona");
            dni = Lector.leerInt();
            System.out.println("Ingrese la edad de la persona");
            edad = Lector.leerInt();
        }
        int dimF = 0;
        int dimC = 0;
        while (!(nombre.equals("zzz")) && (dimF * dimC != 40)){
            Persona per = new Persona (nombre, dni, edad);
            casting [dimF][dimC] = per;
            if (dimC++ > 7){
                dimC = 0;
                dimF++;
            } else
                dimC++;
            System.out.println("Ingrese el nombre de la persona");
            nombre = Lector.leerString();
            if (nombre == "zzz"){
                System.out.println("Ingrese el dni de la persona");
                dni = Lector.leerInt();
                System.out.println("Ingrese la edad de la persona");
                edad = Lector.leerInt();
            }
        }
        
        int f = 0;
        int c = 0;
        boolean listo = false;
        while ((f <= 4) && (c <= 7)){
            if (casting[f][c] == null)
                listo = true;
            if (listo != true){
                System.out.println("El dia " + f + ", turno " + c + " se entrevistara la persona con nombre " + casting [f][c].getNombre());
                c++;
                if (c > 7){
                    c = 0;
                    f++;
                }
            }
        }
    }
    
}
   


