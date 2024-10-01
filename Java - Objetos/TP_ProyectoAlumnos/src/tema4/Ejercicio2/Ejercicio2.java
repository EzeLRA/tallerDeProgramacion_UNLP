package tema4.Ejercicio2;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Jugador jugador1 = new Jugador(
            GeneradorAleatorio.generarString(3),
        GeneradorAleatorio.generarDouble(10000),
         GeneradorAleatorio.generarInt(5),
        GeneradorAleatorio.generarInt(20),
          GeneradorAleatorio.generarInt(15)
        );
        
        Entrenador entrenador1 = new Entrenador(
            GeneradorAleatorio.generarString(3),
        GeneradorAleatorio.generarDouble(10000),
         GeneradorAleatorio.generarInt(5),
        GeneradorAleatorio.generarInt(20)
        );
        
        System.out.println(entrenador1.toString());
        System.out.println(jugador1.toString());
    }
    
}
