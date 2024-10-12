package practica.parcial.pkg5;
import PaqueteLectura.*;

public class PracticaParcial5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        estacionGNC est1 = new estacionGNC("adsfsd",234.4,10);
        for(int i=0;i<10;i++){
            est1.agregarVentaSurtidor(GeneradorAleatorio.generarInt(6), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarDouble(100), "MercadoPago");
            
        }
        est1.deshablitarSurtidoresPorXvalor(50.0);
        Venta v = est1.obtenerVentaMayorMonto();
        if(v != null){
            System.out.println(v.toString());
        }
        System.out.println(est1.toString());
    }
    
}
