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
public class mainEj5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Partido [] torneo = new Partido [3];
        
        int cantPar = 0;
        System.out.println("Ingrese el nombre del equipo local");
        String local = Lector.leerString();
        System.out.println("Ingrese el nombre del equipo visitante");
        String visitante = Lector.leerString();
        int cantLocal = 0;
        int cantVisitante = 0;
        if (!visitante.equals("zzz")){
            System.out.println("Ingrese la cantidad de goles del equipo local");
            cantLocal = Lector.leerInt();
            System.out.println("Ingrese la cantidad de goles del equipo visitante");
            cantVisitante = Lector.leerInt();
        }
        while ((cantPar < 3) && (!visitante.equals("zzz"))){
            Partido par = new Partido (local, visitante, cantLocal, cantVisitante);
            torneo [cantPar] = par;
            cantPar++;
            System.out.println("Ingrese el nombre del equipo local");
            local = Lector.leerString();
            System.out.println("Ingrese el nombre del equipo visitante");
            visitante = Lector.leerString();
            if (!visitante.equals("zzz")){
                System.out.println("Ingrese la cantidad de goles del equipo local");
                cantLocal = Lector.leerInt();
                System.out.println("Ingrese la cantidad de goles del equipo visitante");
                cantVisitante = Lector.leerInt();
            }
        }
        int cantRiver = 0;
        int cantGolesBoca = 0;
        for (int i = 0; i < cantPar; i++){
            torneo[i].toString();
            if (torneo[i].getGanador().equals("River"))
                cantRiver++;
            if (torneo[i].getLocal().equals("Boca"))
                cantGolesBoca += torneo[i].getGolesLocal();
        }
        System.out.println("La cantidad qde partidos que gano river es " + cantRiver);
        System.out.println("La cantidad de goles que hizo Boca de local es " + cantGolesBoca);
    }
    
}
