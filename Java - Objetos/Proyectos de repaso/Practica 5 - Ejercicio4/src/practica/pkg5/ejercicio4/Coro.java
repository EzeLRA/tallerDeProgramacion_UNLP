package practica.pkg5.ejercicio4;

public abstract class Coro {
    //Atributos
    private String nombre;
    private Director directorCoro;
    private boolean coroLleno;
    
    //Constructor
    public Coro(String nombre, Director directorCoro) {
        this.nombre = nombre;
        this.directorCoro = directorCoro;
        this.coroLleno = false;
    }
    
    //Metodos
    public abstract void agregarCorista(Corista c);
    public abstract boolean isCoroLleno();
    public abstract boolean coroOrdenado();

    @Override
    public String toString() {
        return "Nombre del Coro=" + this.nombre + "\n" + this.directorCoro.toString() + "\n";
    }
    
    
}
