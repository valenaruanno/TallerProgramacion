/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.ejercicio4;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author valen
 */
public class Hotel {
    Habitacion [] hotel;
    

    public Hotel(int cant) {
        hotel = new Habitacion [cant];
        double precio;
        for (int i = 0; i < cant; i++){
            precio = GeneradorAleatorio.generarDouble(8000);
            Habitacion h = new Habitacion (false, precio);
            hotel[i] = h;
        }
    }
    
    public void añadirClienteHabitacion (int habitacion, String nombre, int dni, int edad){
        hotel[habitacion].añadirCliente(nombre, dni, edad);
    }
    
    public void aumento (double precio){
            for (int i = 0; i < hotel.length; i++){
                hotel[i].setCosto(hotel[i].getCosto() + precio);
            }
    }
    
    public void toStringHotel (){
        for (int i=0; i < hotel.length; i++){
            String cli = hotel[i].toString();
            if (hotel[i].isOcupada() == true)
                System.out.println("Habitacion " + i + ": " + hotel[i].getCosto() + ", " + hotel[i].isOcupada() + ", " + hotel[i].toString());
            else
                System.out.println("Habitacion " + i + ": " + hotel[i].getCosto() + ", " + hotel[i].isOcupada());
        }
    }
}
    