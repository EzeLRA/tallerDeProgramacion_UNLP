package practica.parcial.pkg5;

public class Surtidor {
    //Atributos
    private boolean enServicio;
    private int ventasCant;
    private int ventasMax;
    private Venta[] ventas;
    
    //Constructor
    public Surtidor(int ventasMax) {
        this.enServicio = true;
        this.ventasMax = ventasMax;
        
        this.ventasCant = 0;
        this.ventas = new Venta[this.ventasMax];
    }
    
    //Metodos
    public void agregarVenta(Venta v){
        if(this.ventasCant < this.ventasMax){
            this.ventas[this.ventasCant] = v;
            this.ventasCant ++;
        }
    }
    
    public double cantidadM3Total(){
        double total = 0;
        if(this.ventasCant>0){
            for(int i=0;i<this.ventasCant;i++){
                total += this.ventas[i].getMcuadrados_Cargados();
            }
        }
        return total;
    }

    public void deshabilitarServicio() {
        this.enServicio = false;
    }
    
    public Venta obtenerVentaMayorMonto(){
        double max = -1;
        Venta ventaMax = null;
        if(this.ventasCant>0){
            for(int i=0;i<this.ventasCant;i++){
                if(this.ventas[i].getMontoAbonado() > max){
                    max = this.ventas[i].getMontoAbonado();
                    ventaMax = this.ventas[i];
                }
            }
        }
        return ventaMax;
    }

    @Override
    public String toString() {
        String cad ;
        if(this.enServicio){
            cad = "En servicio;Ventas:[";
        }else{
            cad = "Fuera de servicio;Ventas:[";
        }
        if(this.ventasCant>0){
            for(int i=0;i<this.ventasCant;i++){
                cad += this.ventas[i].toString();
            }
        }
        cad += "]";
        
        return cad;
    }
    
    
    
    
}
