package practica.parcial.pkg3;

public abstract class Curso {
    //Metodos
    private int anioCursada;
    private int alumnosCant;
    private int alumnosMax;
    private Alumno[] alumnos;
    
    //Constructor
    public Curso(int anioCursada, int alumnosMax) {
        this.anioCursada = anioCursada;
        this.alumnosMax = alumnosMax;
        this.alumnosCant = 0;
        this.alumnos = new Alumno[this.alumnosMax];
    }
    
    //Metodos
    public boolean agregarAlumno(Alumno a){
        boolean sePudo = false;
        
        if(this.alumnosCant < this.alumnosMax){
            this.alumnos[this.alumnosCant] = a;
            this.alumnosCant ++;
            sePudo = true;
        }
        
        return sePudo;
    }
    
    private int hallarDNIpos(int dni){
        int pos = -1;
        int i=0;
        boolean hallado = false;
        
        while((i<this.alumnosCant)&(hallado == false)){
            hallado = (this.alumnos[i].getDNI() == dni);    
            if(hallado == true){
                pos = i;
            }else{
                i++;
            }
        }
        
        return pos;
    }
    
    public void incrementarAsistenciaDNI(int dni){
        if(this.alumnosCant>0){
            int pos = this.hallarDNIpos(dni);
            if(pos != -1){
                this.alumnos[pos].aumentarAsistencias();
            }
        }
    }
    
    public void aprobarAutoevaluacionDNI(int dni){
        if(this.alumnosCant>0){
            int pos = this.hallarDNIpos(dni);
            if(pos != -1){
                this.alumnos[pos].aumentarAsistencias();
            }
        }
    }
    
    public int obtenerCantidadAlumnos(){
        return this.alumnosCant;
    }
    
    public Alumno obtenerAlumnoDeLaLista(int pos){
        return this.alumnos[pos];
    }
    
    public abstract boolean puedeRendirAlumno(Alumno a);
    public abstract int cantidadAlumnosQuePuedenRendir();
    
}
