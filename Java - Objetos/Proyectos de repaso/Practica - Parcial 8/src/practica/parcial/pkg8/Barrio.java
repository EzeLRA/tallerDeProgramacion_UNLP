package practica.parcial.pkg8;

public class Barrio {
    //Atributos
    private String nombre;
    private int lotesMax;
    private int manzanasMax;
    private Manzana[] manzanas;
    
    //Constructor
    public Barrio(String nombre, int manzanasMax, int lotesMax) {
        this.nombre = nombre;
        this.manzanasMax = manzanasMax;
        this.lotesMax = lotesMax;
        this.manzanas = new Manzana[this.manzanasMax];
        
        for(int i=0;i<this.manzanasMax;i++){
            this.manzanas[i] = new Manzana(this.lotesMax);
        }
    }
    
    //Metodos
    public void agregarCompradorLoteManzana(int manzana,int lote,Comprador c){
        this.manzanas[manzana].agregarCompradorLote(lote, c);
    }
    
    public void incrementarPrecioLotesManzana(int manzana,int porcentaje){
        this.manzanas[manzana].incrementarPreciosLotesPorcentaje(porcentaje);
    }
    
    public double retornar_montoRecaudado(){
        double total = 0;
        
        for(int i=0;i<this.manzanasMax;i++){
            total += this.manzanas[i].retornarMontoRecaudado();
        }
        
        return total;
    }

    @Override
    public String toString() {
        String cad = "Barrio: " + nombre + "\n Recaudacion Total: " + this.retornar_montoRecaudado() + "\n";
        
        for(int i=0;i<this.manzanasMax;i++){
            cad += "Manzana #" + (i+1) + "| \n";
            cad += this.manzanas[i].toString();
        }
        
        return cad;
    }
    
    
    
}
