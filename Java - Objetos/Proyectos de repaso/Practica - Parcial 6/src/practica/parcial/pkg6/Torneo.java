package practica.parcial.pkg6;

public class Torneo {
    //Atributos
    private String nombre;
    private int fechasCant;
    private int fechasMax;
    private Fecha[] fechas;
    
    //Constructor
    public Torneo(String nombre, int fechasMax , int goleadoresMax){
        this.setNombre(nombre);
        this.setFechasMax(fechasMax);
        this.setFechasCant(0);
        this.fechas = new Fecha[this.getFechasMax()];
        for(int i=0;i<this.getFechasMax();i++){
            this.fechas[i] = new Fecha(goleadoresMax);
        }
    }
    
    //Metodos primarios
    public void agregarGoleadorFecha(int fechaPos,Goleador g){
        int pos = fechaPos - 1;
        this.fechas[pos].agregarGoleador(g);
    }
    
    public Goleador retornarGoleadorMinFechaX(int fechaPos){
        int pos = fechaPos - 1;
        Goleador goleadorMin = this.fechas[pos].retornarGoleadorMin();
        return goleadorMin;
    }
    
    public int goleadorCantTotal(){
        int total = 0;
        for(int i=0;i<this.fechasCant;i++){
            total += this.fechas[i].getGoleadoresCant();
        }
        return total;
    }

    @Override
    public String toString() {
        String cad = "TORNEO 2022:" + nombre + "\n";
        for(int i=0;i<this.fechasCant;i++){
            cad += "Fecha #" + (i+1) + " ; " + this.fechas[i].toString();
        }
        return cad;
    }
    
    
    
    //Metodos secundarios
    private int getFechasMax() {
        return fechasMax;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private void setFechasCant(int fechasCant) {
        this.fechasCant = fechasCant;
    }

    private void setFechasMax(int fechasMax) {
        this.fechasMax = fechasMax;
    }
    
    
}
