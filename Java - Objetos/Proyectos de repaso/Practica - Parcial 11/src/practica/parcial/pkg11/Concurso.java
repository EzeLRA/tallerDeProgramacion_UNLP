package practica.parcial.pkg11;

public class Concurso {
    //Atributos
    private int generosCategoriasMax;
    private GeneroMusical[] generos;
    
    //Constructor
    public Concurso(int maxAlum){
        this.generosCategoriasMax = 5;
        this.generos = new GeneroMusical[this.generosCategoriasMax];
        for(int i=0;i<this.generosCategoriasMax;i++){
            this.generos[i] = new GeneroMusical(maxAlum);
        }
        
    }
    
    //Metodos
    public void inscribirAlumno(int categ,Alumno alu){
        this.generos[categ].inscribirAlumno(alu);
    }
    
    public void asignarPuntajeAlu(int puntaje,String nom){
        int i=0;
        boolean completo = false;
        while((i<this.generosCategoriasMax)&(completo == false)){
            completo = this.generos[i].asignarPuntajeAlumno(puntaje, nom);
            i++;
        }
    }
    
    public GeneroMusical retornarGeneroMasInscriptos(){
        int max = -1;
        int aux;
        GeneroMusical g = null;
        for(int i=0;i<this.generosCategoriasMax;i++){
            aux = this.generos[i].getInscriptosCant();
            if(aux > max){
                max = aux;
                g = this.generos[i];
            }
        }
        return g;
    }
    
}
