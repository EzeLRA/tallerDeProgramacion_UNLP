package practica.practica.pkg12;
import PaqueteLectura.*;

public class PracticaPractica12 {

    public static void main(String[] args) {
        CompraMinorista c1 = new CompraMinorista(true,2132,5); 
        CompraMayorista c2 = new CompraMayorista(2343,3434,5);
        Producto p; 
        for(int i=0;i<3;i++){
            p = new Producto(GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(100),"dsfsdf");
            c1.agregarProducto(p);
            c2.agregarProducto(p);
        }
        System.out.println(c1.toString());
        System.out.println(c2.toString());
    }
    
}
