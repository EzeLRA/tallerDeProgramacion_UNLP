package practica.parcial.pkg2;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Libreria lib1 = new Libreria("fdsf",5);
        
        for(int i=0; i<10 ; i++){
            lib1.agregarCompraEnCaja(GeneradorAleatorio.generarInt(4), GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarDouble(1000),"Efectivo");
        }
        
        Ticket t = lib1.retornarTicketDeMayorMontoAbonado();
        if(t != null){
            System.out.println(t.toString());
        }
        lib1.deshabilitarCajas_MenosLibrosVendidosA_X(20);
        
        System.out.println(lib1.toString());
    }
    
}
