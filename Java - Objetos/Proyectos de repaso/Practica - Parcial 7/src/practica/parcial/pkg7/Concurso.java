package practica.parcial.pkg7;

public class Concurso {
    //Atributos
    private int parejasCant;
    private int parejasMax;
    private Pareja[] parejas;
    
    //Constructor
    public Concurso(int parejasMax) {
        this.parejasMax = parejasMax;
        this.parejasCant = 0;
        this.parejas = new Pareja[this.parejasMax];
    }
    
    //Metodos
    public void agregarPareja(Pareja p){
        if(this.parejasCant < this.parejasMax){
            this.parejas[this.parejasCant] = p;
            this.parejasCant ++;
        }
    }
    
    public Pareja parejaConMasDiferenciaEdad(){
        Pareja parejaDevolver = null;
        int max = -1;
        int aux; 
        if(this.parejasCant>0){
            for(int i=0;i<this.parejasCant;i++){
                aux = this.parejas[i].retornarDiferenciaEdad();
                if(max < aux){
                    max = aux;
                    parejaDevolver = this.parejas[i];
                }
            }
        }
        
        return parejaDevolver;
    }
    
    
}