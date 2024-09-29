package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int tam = 20;
        Hotel hotel1 = new Hotel(tam);
        
        
        hotel1.cargarPrecios(2000, 8000);
        
        
        System.out.println(hotel1.toString() + "\n");
        
        //Datos
        String nom;
        int dni,edad,pos;
        
        //Clientes ingresados
        for(int i=0; i<tam ; i++){
            nom = GeneradorAleatorio.generarString(3);
            dni = GeneradorAleatorio.generarInt(1000);
            edad = GeneradorAleatorio.generarInt(90);
            pos = GeneradorAleatorio.generarInt(tam);
            
            System.out.println(pos + "," + nom + "," + dni + "," + edad);
            
            Cliente cli = new Cliente(nom,dni,edad);
            
            hotel1.reservarHabitacion(pos, cli);
        }
        
        System.out.println(hotel1.toString() + "\n");
        
        hotel1.aumentarPrecios(1500.0);
        
        System.out.println(hotel1.toString());
    }
    
}
