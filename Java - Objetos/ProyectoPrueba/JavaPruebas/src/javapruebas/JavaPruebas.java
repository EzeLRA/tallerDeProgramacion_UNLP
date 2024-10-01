package javapruebas;
import PaqueteLectura.GeneradorAleatorio;

public class JavaPruebas {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int x = GeneradorAleatorio.generarInt(3);
        while(x != 2){
            System.out.println(x);
            x = GeneradorAleatorio.generarInt(3) ;
        }
    }
    
}
