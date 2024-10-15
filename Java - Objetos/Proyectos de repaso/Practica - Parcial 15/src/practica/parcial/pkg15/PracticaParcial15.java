package practica.parcial.pkg15;
import PaqueteLectura.*;

public class PracticaParcial15 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Sistema s = new Sistema();
        
        Poliza p;
        for(int i=0;i<5;i++){
            p = new Poliza(GeneradorAleatorio.generarDouble(1000),
            GeneradorAleatorio.generarDouble(1000),
            new Fecha(1 + GeneradorAleatorio.generarInt(31),1 + GeneradorAleatorio.generarInt(12),2020),
            new Fecha(1 + GeneradorAleatorio.generarInt(31),1 + GeneradorAleatorio.generarInt(12),2024),
            GeneradorAleatorio.generarInt(10000),
            GeneradorAleatorio.generarString(3),
            GeneradorAleatorio.generarString(3));
            s.agregarPolizaRubro(p, GeneradorAleatorio.generarInt(10));
        }
        
        int dni = Lector.leerInt();
        System.out.println(s.infoCliente(dni));
        
        s.aumentarCuotas(1.11, 3);
        
        System.out.println(s.polizasPorVencer(4, 2024));
    }
    
}
