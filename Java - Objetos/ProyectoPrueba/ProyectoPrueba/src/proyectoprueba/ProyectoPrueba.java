package proyectoprueba;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ProyectoPrueba {

    public static void main(String[] args) {
        System.out.println("Ingresar Nombre");
        String nombre = Lector.leerString();
        System.out.println(nombre);
        System.out.println("");
        System.out.println(GeneradorAleatorio.generarBoolean());
    }
    
}
