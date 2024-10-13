package practica.parcial.pkg8;

public class Manzana {
   //Atributos
   private int lotesMax;
   private Lote[] lotes;
   
   //Constructor
   public Manzana(int lotesMax) {
       this.lotesMax = lotesMax;
       this.lotes = new Lote[this.lotesMax];
       
       for(int i=0;i<this.lotesMax;i++){
           this.lotes[i] = new Lote();
       }
   }
   
   //Metodos
   public void agregarCompradorLote(int lote,Comprador c){
       this.lotes[lote].setCompradorActual(c);
   }
   
   public void incrementarPreciosLotesPorcentaje(int porcentaje){
       for(int i=0;i<this.lotesMax;i++){
           if(this.lotes[i].sinComprador()){
               this.lotes[i].incrementarPrecioPorcentaje(porcentaje);
           }
       }
   
   }
   
   public double retornarMontoRecaudado(){
       double total = 0;
       
       for(int i=0;i<this.lotesMax;i++){
           if(this.lotes[i].sinComprador() != true){
               total += this.lotes[i].getPrecio();
           }
       }
       
       return total;
   }

    @Override
    public String toString() {
        String cad = "";
        for(int i=0;i<this.lotesMax;i++){
           cad += "Lote #" + (i+1) + " - " + this.lotes[i].toString() + "\n";
       }
        return cad;
    }
   
   
   
}