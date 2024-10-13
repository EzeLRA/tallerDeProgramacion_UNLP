package practica.parcial.pkg7;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial7 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Concurso c = new Concurso(5);
        Pareja p,pAux;
        Participante p1,p2;
        for(int i=0;i<2;i++){
            p1 = new Participante(GeneradorAleatorio.generarInt(80),GeneradorAleatorio.generarInt(80),GeneradorAleatorio.generarString(5));
            p2 = new Participante(GeneradorAleatorio.generarInt(80),GeneradorAleatorio.generarInt(80),GeneradorAleatorio.generarString(5));
            p = new Pareja("asfad",p1,p2);
            c.agregarPareja(p);
        }
        
        pAux = c.parejaConMasDiferenciaEdad();
        System.out.println(pAux.toString());
        
    }
    
}
