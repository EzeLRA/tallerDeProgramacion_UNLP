package practica.parcial.pkg16;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial16 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Sector s1 = new Sector("afsdfd",100);
        Empleado j = new Empleado("adsfsdf","asfsdf",20);
        Empleado e ;
        s1.agregarEmpleado(j, true);
        for(int i=0;i<2;i++){
            e = new Empleado(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(20));
            s1.agregarEmpleado(e, false);
        }
        
        s1.agregarProducto(new Productos(2));
        s1.agregarProducto(new Productos(1));
        
        for(int i=0;i<4;i++){
            s1.cambiarEtapa(1, 1000);
        }
        
        System.out.println(s1.toString());
   }
    
}
