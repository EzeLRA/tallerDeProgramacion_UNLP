package practica.parcial.pkg10;

public class Computadora {
    //Atributos
    private boolean estadoFuncion;
    private int consumoHoras;

    //Constructor
    public Computadora(int consumoHoras) {
        this.estadoFuncion = false;
        this.consumoHoras = consumoHoras;
    }

    //Metodos
    public void encenderPC() {
        this.estadoFuncion = true;
    }

    public int getConsumoHoras() {
        return consumoHoras;
    }

    public boolean isEstadoFuncion() {
        return estadoFuncion;
    }
    
    
    
    
    
}
