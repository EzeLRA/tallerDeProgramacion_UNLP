package practica.parcial.pkg8;

public class Lote {
    //Atributos
    private double precio;
    private Comprador compradorActual;
    
    //Constructor
    public Lote() {
        this.precio = 50000;
        this.compradorActual = null;
    }
    
    //Metodos
    public void setCompradorActual(Comprador compradorActual) {
        if(this.compradorActual == null){
            this.compradorActual = compradorActual;
        }
    }
    
    public void incrementarPrecioPorcentaje(int porcentaje){
        int porcentajeAux = 100 + porcentaje;
        this.precio = (porcentajeAux * this.precio)/100;
    }
    
    public boolean sinComprador(){
        return (this.compradorActual == null);
    }

    public double getPrecio() {
        return precio;
    }

    @Override
    public String toString() {
        String cad = "precio=" + precio + " ; Comprador: ";
        
        if(this.sinComprador()){
            cad += "Disponible para la venta";
        }else{
            cad += this.compradorActual.toString();
        }
        
        return cad;
    }
    
    
    
    
}
