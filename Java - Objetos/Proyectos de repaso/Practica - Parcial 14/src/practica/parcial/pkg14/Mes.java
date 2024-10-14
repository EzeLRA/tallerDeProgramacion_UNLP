package practica.parcial.pkg14;

public class Mes {
    //Atributos
    private int diasCant,diasMax;
    private Concierto[] conciertos;
    
    //Constructor
    public Mes(int diasMax) {
        this.diasCant = 0;
        this.diasMax = diasMax;
        this.conciertos = new Concierto[this.diasMax];
    }
    
    //Metodos
    public void agendarConcierto(Concierto c){
        if(this.diasCant<this.diasMax){
            this.conciertos[this.diasCant] = c;
            this.diasCant ++;
        }
    }
    
    public double retornarMonto(){
        double monto = 0;
        if(this.diasCant>0){
            for(int i=0;i<this.diasCant;i++){
                monto += this.conciertos[i].getGanancia();
            }
        }
        return monto;
    }
    
    public String retornarConciertosCad(){  //Complementa para el ultimo inciso
        String cad = "";
        if(this.diasCant>0){
            for(int i=0;i<this.diasCant;i++){
                cad += "Dia "+ (i+1)+": " +this.conciertos[i].toString() + "\n";
            }
        }
        return cad;
    }
    
}
