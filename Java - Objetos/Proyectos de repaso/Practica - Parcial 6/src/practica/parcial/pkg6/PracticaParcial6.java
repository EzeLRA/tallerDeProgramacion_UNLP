package practica.parcial.pkg6;
import PaqueteLectura.*;

public class PracticaParcial6 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Torneo t = new Torneo("asdf",3,5);
        Goleador g;
        for(int i=0;i<5;i++){
            g = new Goleador(GeneradorAleatorio.generarString(3),"fdf",GeneradorAleatorio.generarInt(10));
            t.agregarGoleadorFecha(1, g);
        }
        Goleador gMin = t.retornarGoleadorMinFechaX(1);
        if(gMin != null){
            System.out.println(gMin.toString());
        }
        System.out.println(t.goleadorCantTotal());
        System.out.println(t.toString());
    }
    
}
