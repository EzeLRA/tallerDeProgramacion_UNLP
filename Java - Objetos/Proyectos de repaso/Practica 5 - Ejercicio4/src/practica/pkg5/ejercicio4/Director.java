package practica.pkg5.ejercicio4;

public class Director extends Persona{
    //Atributos
    private int antiguedadAnios;
    
    //Constructor
    public Director(int antiguedadAnios, String nombre, int DNI, int edad) {
        super(nombre, DNI, edad);
        this.antiguedadAnios = antiguedadAnios;
    }

    @Override
    public String toString() {
        return "Director{" + super.toString() + "antiguedadAnios=" + antiguedadAnios + '}';
    }
    
    
    
}
