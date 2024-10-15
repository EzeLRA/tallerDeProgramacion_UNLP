package practica.parcial.pkg18;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial18 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        subsistemaViaje s1 = new subsistemaViaje(10);
        subsistemaHospedaje s2 = new subsistemaHospedaje(10);
        
        Solicitud s ;
        
        for(int i=0;i<10;i++){
            s = new Solicitud(GeneradorAleatorio.generarString(3),
            GeneradorAleatorio.generarString(3),
            GeneradorAleatorio.generarString(3),
            GeneradorAleatorio.generarDouble(100),
            GeneradorAleatorio.generarDouble(100),
            GeneradorAleatorio.generarDouble(100),
            GeneradorAleatorio.generarInt(10),
            GeneradorAleatorio.generarDouble(500));
            s1.agregarSolicitud(s);
            s2.agregarSolicitud(s);
        }
        
        s1.otorgarSolicitudes(10000);
        s2.otorgarSolicitudes(10000);
        
        System.out.println(s1.toString());
        System.out.println(s2.toString());
    }
    
}
