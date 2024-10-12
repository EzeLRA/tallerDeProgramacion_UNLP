package practica.parcial.pkg3;

public class CursoVirtual extends Curso{
    //Atributos
    private String linkSala;
    
    //Constructor
    public CursoVirtual(String linkSala, int anioCursada, int alumnosMax) {
        super(anioCursada, alumnosMax);
        this.linkSala = linkSala;
    }
    
    //Metodos
    public boolean puedeRendirAlumno(Alumno a){
        return ((a.getAsistenciasCant() >= 1)&(a.getAutoEvaluacionesCant()>=3));
    }
    
    public int cantidadAlumnosQuePuedenRendir(){
        int cant=0;
        int alumnosCant = super.obtenerCantidadAlumnos();
        
        if(alumnosCant > 0){
            for(int i=0;i<alumnosCant;i++){
                if(this.puedeRendirAlumno(super.obtenerAlumnoDeLaLista(i))){
                    cant++;
                }
            }
        }
                    
        return cant;
    }
}
