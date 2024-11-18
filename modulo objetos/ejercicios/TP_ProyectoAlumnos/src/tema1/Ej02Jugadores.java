
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] jugadores;
        //Paso 3: Crear el vector para 15 double 
        jugadores  = new double [15];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int cant = 0;
        double total = 0;
        double prom;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de altura
        while (cant < 15){
            jugadores [cant] = Lector.leerDouble();
            cant++;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (int i = 0; i < 15; i++){
            total += jugadores [i];
        }
        prom = total / 15;
        System.out.println("El promedio totasl de alturas es " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cant = 0;
        for (int i = 0; i < 15; i++){
            if (jugadores[i] > prom)
                cant++;
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores con altura mayor que el promedio es " + cant);
    }
    
}
