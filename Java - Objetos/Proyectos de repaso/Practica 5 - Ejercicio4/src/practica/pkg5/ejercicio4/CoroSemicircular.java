package practica.pkg5.ejercicio4;

public class CoroSemicircular extends Coro {
    //Atributos
    private int coristasCant;
    private int coristasMax;
    private Corista[] semiCirculoCoristas;
    
    //Constructor
    public CoroSemicircular(int coristasMax, String nombre, Director directorCoro) {
        super(nombre, directorCoro);
        this.coristasMax = coristasMax;
        this.coristasCant = 0;
        this.semiCirculoCoristas = new Corista[this.coristasMax];
    }
    
    public void agregarCorista(Corista c){
        if(this.coristasCant < this.coristasMax){
            this.semiCirculoCoristas[this.coristasCant] = c;
            this.coristasCant ++;
        }
    }
    
    public boolean isCoroLleno(){
        return (coristasCant == coristasMax);
    }
    
    public boolean coroOrdenado(){
        boolean cumple = false;
        //Se asume que esta lleno el coro
        int i=0;
        while((cumple == false)&(i<this.coristasMax-1)){
            cumple = (this.semiCirculoCoristas[i].getTonoFundamental() >= this.semiCirculoCoristas[i+1].getTonoFundamental());
            i++;
        }
        return cumple;
    }

    @Override
    public String toString() {
        String cadDevolver = super.toString();
        for(int i=0; i < this.coristasCant ; i++){
            cadDevolver += this.semiCirculoCoristas[i].toString() + "\n";
        }
        return cadDevolver;
    }
    
    
}
