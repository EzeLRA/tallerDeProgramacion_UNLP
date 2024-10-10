package practica.pkg5.ejercicio4;
import PaqueteLectura.*;

public class Practica5Ejercicio4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Director director = new Director(5,GeneradorAleatorio.generarString(3),1000,30);
        
        //CoroSemicircular c1 = new CoroSemicircular(5,GeneradorAleatorio.generarString(3),director);
        CoroHileras c2 = new CoroHileras(5,5,GeneradorAleatorio.generarString(3),director);
        
        Corista corista;
        for(int i=0;i<5;i++){
            corista = new Corista(GeneradorAleatorio.generarInt(5),GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(50));
            //c1.agregarCorista(corista);
            c2.agregarCorista(corista);
        }
        
        //System.out.println(c1.toString());
        //System.out.println(c1.coroOrdenado());
        System.out.println(c2.toString());
        //System.out.println(c2.coroOrdenado());
    }
    
}