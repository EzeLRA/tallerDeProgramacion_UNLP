package practica.pkg5.ejercicio4;

public class Corista extends Persona {
    //Atributos
    private int tonoFundamental;
    
    //Constructor
    public Corista(int tonoFundamental, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    @Override
    public String toString() {
        return "Corista{" + super.toString() + "tonoFundamental=" + tonoFundamental + '}';
    }
    
    
    
}
