package practica.parcial.pkg11;

public class GeneroMusical {
    //Atributos
    private int inscriptosCant ;
    private int inscriptosMax ;
    private Alumno[] inscriptos;
    
    //Constructor
    public GeneroMusical(int MaxAlumnos){
        this.inscriptosCant = 0;
        this.inscriptosMax = MaxAlumnos;
        this.inscriptos = new Alumno[this.inscriptosMax];
    }
    
    //Metodos
    public void inscribirAlumno(Alumno alu){
        if(this.inscriptosCant<this.inscriptosMax){
            this.inscriptos[this.inscriptosCant] = alu;
            this.inscriptosCant ++;
        }
    }
    
    public boolean asignarPuntajeAlumno(int puntaje,String nombre){
        boolean sePudo = false;
        if(this.inscriptosCant>0){
            int i=0;
            while((i<this.inscriptosCant)&(sePudo == false)){
                if(this.inscriptos[i].getNombre() == nombre){
                    this.inscriptos[i].setPuntajeObtenido(puntaje);
                    sePudo = true;
                }
                i++;
            }
        }
        return sePudo;
    }

    public int getInscriptosCant() {
        return inscriptosCant;
    }
    
    
}
