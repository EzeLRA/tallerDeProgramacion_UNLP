package practica.pkg5.ejercicio2;
import PaqueteLectura.*;

public class Practica5Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacionamientos estacionamientos1 = new Estacionamientos("Prueba1","Av12Ca34",8,21,3,3);
        Auto a;
        for(int i=0;i<6;i++){
            a = new Auto(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(4));    
            estacionamientos1.registrarEstacionamiento(a, GeneradorAleatorio.generarInt(3), GeneradorAleatorio.generarInt(3));
        }
        
        System.out.println(estacionamientos1.toString());
        
        System.out.println(estacionamientos1.autosEnLaPlazaPisos(0));   // 0 = Piso 1
        
        String patente = Lector.leerString();
        System.out.println(estacionamientos1.buscarPatenteAuto(patente));
    }
    
}
