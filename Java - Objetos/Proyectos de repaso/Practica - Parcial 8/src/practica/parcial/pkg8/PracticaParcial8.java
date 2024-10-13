package practica.parcial.pkg8;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial8 {

    public static void main(String[] args) {
        Barrio b = new Barrio("Los teros",6,9);
        Comprador c;
        for(int i=0;i<5;i++){
            c = new Comprador(GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarString(3),"LP");
            b.agregarCompradorLoteManzana(GeneradorAleatorio.generarInt(6), GeneradorAleatorio.generarInt(9), c);
        }
        b.incrementarPrecioLotesManzana(1, 50);
        
        System.out.println(b.toString());
    }
    
}
