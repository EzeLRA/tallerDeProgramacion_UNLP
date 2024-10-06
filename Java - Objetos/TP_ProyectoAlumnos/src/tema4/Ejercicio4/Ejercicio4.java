package tema4.Ejercicio4;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String nomBase = "La Plata";
        double lat = 12.3;
        double lon = 23.4;
        
        SistemaRegistroMeses sistema1 = new SistemaRegistroMeses(nomBase,lat,lon,2020,2024,25.0,32.0);
        SistemaRegistroAnios sistema2 = new SistemaRegistroAnios(nomBase,lat,lon,2020,2024,25.0,32.0);
        
        sistema1.generarTemperaturas();
        sistema2.generarTemperaturas();
        sistema1.calcularPromedios();
        sistema2.calcularPromedios();
        
        System.out.println(sistema1.toString());
        System.out.println(sistema2.toString());
    }
    
}
