package practica.parcial;

public class ProgramadorLider extends Programador{
    //Atributos
    private int antiguedadAnios;
    private int proyectosDirigidosCant;
    
    //Constructor
    public ProgramadorLider(int antiguedadAnios, int proyectosDirigidosCant, String nombre, int DNI, int sueldoBasico, int lineasCodHora, String lenguajePreferencia) {
        super(nombre, DNI, sueldoBasico, lineasCodHora, lenguajePreferencia);
        this.antiguedadAnios = antiguedadAnios;
        this.proyectosDirigidosCant = proyectosDirigidosCant;
    }
    
    //Metodos
    public int obtenerSueldoFinal(){
        return super.obtenerSueldoFinal() + (10000 * this.antiguedadAnios) + (20000 * this.proyectosDirigidosCant);
    }
    
    
    
}
