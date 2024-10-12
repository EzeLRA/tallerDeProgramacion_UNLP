package practica.parcial.pkg4;
import PaqueteLectura.*;

public class PracticaParcial4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        BancoTradicional banco1 = new BancoTradicional("adfsdfd","gretery","dgdfgdfg",100,5);
        BancoDigital banco2 = new BancoDigital("sdfsdf","dssdf",100,5);
        Cuenta c;
        
        for(int i=0;i<5;i++){
            c = new Cuenta(GeneradorAleatorio.generarInt(10),GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(10),"Peso");
            banco1.agregarCuenta(c);
            banco2.agregarCuenta(c);
        }
        
        banco1.depositarDinero(GeneradorAleatorio.generarInt(10), 500000);
        banco2.depositarDinero(GeneradorAleatorio.generarInt(10), 500000);
        
        System.out.println(banco1.puedeRecibirTarjeta(GeneradorAleatorio.generarInt(10)));
        System.out.println(banco2.puedeRecibirTarjeta(GeneradorAleatorio.generarInt(10)));
        
    }
    
}
