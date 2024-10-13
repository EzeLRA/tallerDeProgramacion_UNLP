package practica.parcial.pkg6;

public class Fecha {
    //Atributos
    private int goleadoresCant;
    private int goleadoresMax;
    private Goleador[] goleadores;
    
    //Constructor
    public Fecha(int goleadoresMax) {
        this.setGoleadoresMax(goleadoresMax);
        this.setGoleadoresCant(0);
        this.goleadores = new Goleador[this.getGoleadoresMax()];
    }
    
    //Metodos primarios
    public void agregarGoleador(Goleador g){
        if(this.goleadoresCant < this.getGoleadoresMax()){
            this.goleadores[this.goleadoresCant] = g;
            this.goleadoresCant ++;
        }
    }
    
    public Goleador retornarGoleadorMin(){
        int Min = 99999;
        Goleador goleadorMin = null;
        
        if(this.goleadoresCant > 0){
            for(int i=0;i<this.goleadoresCant;i++){
                if(this.goleadores[i].getGoles() < Min){
                    Min = this.goleadores[i].getGoles();
                    goleadorMin = this.goleadores[i];
                }
            }
        
        }
        
        return goleadorMin;
    }

    public int getGoleadoresCant() {
        return this.goleadoresCant;
    }

    @Override
    public String toString() {
        String cad = "Cantidad de goleadores:" + this.goleadoresCant + " ; ";
        for(int i=0;i<this.goleadoresCant ;i++){
            cad += this.goleadores[i].toString();
        }
        cad += "\n";
        return cad;
    }
    
    
    
    //Metodos secundarios
    private int getGoleadoresMax() {
        return goleadoresMax;
    }
    
    private void setGoleadoresCant(int goleadoresCant) {
        this.goleadoresCant = goleadoresCant;
    }

    private void setGoleadoresMax(int goleadoresMax) {
        this.goleadoresMax = goleadoresMax;
    }
    
    
}
