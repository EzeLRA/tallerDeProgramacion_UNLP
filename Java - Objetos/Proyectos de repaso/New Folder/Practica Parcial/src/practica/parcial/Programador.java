package practica.parcial;

public class Programador {
    //Atributos
    private String nombre;
    private int DNI;
    private int sueldoBasico;
    private int lineasCodHora;
    private String lenguajePreferencia;
    
    //Constructor
    public Programador(String nombre, int DNI, int sueldoBasico, int lineasCodHora, String lenguajePreferencia) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.sueldoBasico = sueldoBasico;
        this.lineasCodHora = lineasCodHora;
        this.lenguajePreferencia = lenguajePreferencia;
    }
    
    //Metodos
    public void aumentarSueldo(int montoAumento){
        this.sueldoBasico += montoAumento;
    }
    
    private int getSueldoBasico() {
        return sueldoBasico;
    }
    
    public int obtenerSueldoFinal(){
        int sueldoFinal;
        sueldoFinal = getSueldoBasico();
        if(this.lineasCodHora > 200){
            sueldoFinal += 50000;
        }
        return sueldoFinal;
    }

    @Override
    public String toString() {
        return "nombre=" + nombre + ", DNI=" + DNI + ", lenguajePreferencia=" + lenguajePreferencia + " sueldoFinal=" + this.obtenerSueldoFinal();
    }
    
    
}
