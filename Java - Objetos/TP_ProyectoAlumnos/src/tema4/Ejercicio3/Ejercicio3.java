package tema4.Ejercicio3;
import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Persona persona1 = new Persona(
                                        GeneradorAleatorio.generarString(3),
                                        GeneradorAleatorio.generarInt(1000),
                                        GeneradorAleatorio.generarInt(90)
                                        );
        Trabajador trabajador1 = new Trabajador(
               GeneradorAleatorio.generarString(3),
                 GeneradorAleatorio.generarInt(1000),
                GeneradorAleatorio.generarInt(90),
                GeneradorAleatorio.generarString(5)
        );
        
        System.out.println(persona1.toString());
        System.out.println(trabajador1.toString());
        
    }  
}
