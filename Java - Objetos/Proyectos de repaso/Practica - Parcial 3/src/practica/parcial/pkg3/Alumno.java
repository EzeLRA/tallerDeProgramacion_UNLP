package practica.parcial.pkg3;

public class Alumno {
    //Atributos
    private int DNI;
    private String nombre;
    private int asistenciasCant;
    private int autoEvaluacionesCant;

    //Constructor
    public Alumno(int DNI, String nombre) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.asistenciasCant = 0;
        this.autoEvaluacionesCant = 0;
    }
    
    //Metodos
    public int getDNI() {
        return DNI;
    }

    public int getAsistenciasCant() {
        return asistenciasCant;
    }

    public int getAutoEvaluacionesCant() {
        return autoEvaluacionesCant;
    }
    
    public void aumentarAsistencias(){
        this.asistenciasCant ++;
    }
    
    public void aprobarAutoevaluacion(){
        this.autoEvaluacionesCant ++;
    }
    
    
    
}
