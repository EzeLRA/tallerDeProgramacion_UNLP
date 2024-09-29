package tema3;
import PaqueteLectura.Lector;

public class Ejercicio5 {

    public static void main(String[] args) {
        
        double rad = Lector.leerDouble();
        String colorP = Lector.leerString();
        String colorR = Lector.leerString();
        
        Circulo circulo = new Circulo(colorP,colorR,rad);
        
        System.out.println(circulo.calcularPerimetro() + ";" + circulo.calcularArea());
    }
    
}
