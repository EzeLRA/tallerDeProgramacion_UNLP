package practica.parcial.pkg10;

public class SalaComputadoras {
    //Atributos
    private int computadorasCant;
    private int computadorasMax;
    private Computadora[] computadoras;

    //Constructor
    public SalaComputadoras(int computadorasMax) {
        this.computadorasMax = computadorasMax;
        this.computadorasCant = 0;
        this.computadoras = new Computadora[this.computadorasMax];
    }
    
    //Metodos
    public void incluirPC(int num,Computadora pc){
        int pos = num-1;
        if(this.computadoras[pos] == null){
            this.computadoras[pos] = pc;
            this.computadorasCant ++;
        }
    }
    
    public void encenderPCBajoConsumo(){
        if(this.computadorasCant > 0){
            
            int min = 99999;
            int pos = 0;

            for(int i=0;i<this.computadorasMax;i++){
                if(this.computadoras[i] != null){
                    if((this.computadoras[i].getConsumoHoras() < min)&(this.computadoras[i].isEstadoFuncion()==false)){
                        min = this.computadoras[i].getConsumoHoras();
                        pos = i;
                    }
                }
            }
            
            this.computadoras[pos].encenderPC();
        }
    }
    
    public String retornarNespaciosOcupados(){
        String cad = "Computadoras encendidas:";
        for(int i=0;i<this.computadorasMax;i++){
            if(this.computadoras[i] != null){
                if(this.computadoras[i].isEstadoFuncion() == true){
                    cad += "Nº: " + (i+1) + ";";
                }
            }
        }
        return cad;
    }
    
}
