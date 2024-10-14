package practica.parcial.pkg14;
import PaqueteLectura.*;

public class PracticaParcial14 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estadio e = new Estadio("adfdsf","dfdsf",1000);
        Concierto c;
        for(int i=0;i<12;i++){
            c = new Concierto(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarDouble(1000),GeneradorAleatorio.generarInt(1000));
            e.agendarConciertoMes(GeneradorAleatorio.generarInt(12)+1, c);
        }
        
        System.out.println(e.retornarConciertosCadMes(5));
        System.out.println(e.gananciaMes(5));
        
        System.out.println(e.toString());
    }
    
}
