package practica.parcial.pkg3;

public class CursoPresencial extends Curso{
    //Atributos
    private int numeroAula;
    
    //Constructor
    public CursoPresencial(int numeroAula, int anioCursada, int alumnosMax) {
        super(anioCursada, alumnosMax);
        this.numeroAula = numeroAula;
    }
    
    //Metodos
    public boolean puedeRendirAlumno(Alumno a){
        return (a.getAsistenciasCant() >= 3);
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
