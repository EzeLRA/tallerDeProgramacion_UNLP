package practica.pkg5.ejercicio4;

public class CoroHileras extends Coro{
    //Atributos
    private int hilerasMax; //Eje Y Matriz
    private int hilerasCant;
    private int filaMax;    //Eje X Matriz
    private int filasCantCoristas[];
    private Corista matrizCoristas [][];
    
    //Constructor
    public CoroHileras(int hilerasMax, int filaMax, String nombre, Director directorCoro) {
        super(nombre, directorCoro);
        this.hilerasMax = hilerasMax;
        this.filaMax = filaMax;
        this.filasCantCoristas = new int[hilerasMax];
        
        for(int i=0; i<hilerasMax ; i++){
            this.filasCantCoristas[i] = 0;
        }
        
        this.hilerasCant = 0;
        this.matrizCoristas = new Corista[this.hilerasMax][this.filaMax];
    }
    
    //Metodos
    public void agregarCorista(Corista c){
        if(this.hilerasCant < this.hilerasMax){
            if(this.filasCantCoristas[this.hilerasCant] < this.filaMax){
                this.matrizCoristas[this.hilerasCant][this.filasCantCoristas[this.hilerasCant]] = c;
                this.filasCantCoristas[this.hilerasCant] ++;
            }else{
                this.hilerasCant++;
            }
        }
    }
    
    public boolean isCoroLleno(){
        int coristasTotalMax = this.hilerasMax * this.filaMax;
        int cantCoristas = 0;
        for(int i=0; i<this.hilerasMax ; i++){
            cantCoristas += this.filasCantCoristas[i];
        }
        return (cantCoristas == coristasTotalMax);
    }
    
    public boolean coroOrdenado(){
        boolean cumple = false;
        int i,j;
        i=0; j=0;
        while((i<this.hilerasMax-1)&(cumple == false)){
            while((j<this.filaMax-1)&(cumple == false)){
                cumple = (this.matrizCoristas[i][j].getTonoFundamental() == this.matrizCoristas[i][j+1].getTonoFundamental())
                        &(this.matrizCoristas[i][j].getTonoFundamental() >= this.matrizCoristas[i+1][j].getTonoFundamental());
                j++;
            }
            j=0;
            i++;
        }
        return cumple;
    }

    @Override
    public String toString() {
        String cadDevolver = super.toString();
        for(int i=0; i<this.hilerasCant ;i++){
            for(int j=0; j<this.filasCantCoristas[i] ;j++){
                cadDevolver += this.matrizCoristas[i][j].toString() + "\n";
            }
        }
        return cadDevolver;
    }
    
    
    
}

