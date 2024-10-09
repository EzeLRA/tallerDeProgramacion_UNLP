package practica.pkg5.ejercicio3;

public class Practica5Ejercicio3 {
    
    public static void main(String[] args) {
        EventoOcasional ev1 = new EventoOcasional("a beneficio","fdsf",2,"gdsg",5);
        ev1.agregarTema("fdsaf");
        Gira g1 = new Gira("fdgs",2,"rgr",5);
        g1.agregarTema("wegg");
        Fecha f = new Fecha(5,"Fdsaf");
        g1.agregarFecha(f);
        
        System.out.println(ev1.calcularCosto());
        System.out.println(g1.calcularCosto() + "\n");
        
        ev1.actuar();
        g1.actuar();
        
    }
    
}
