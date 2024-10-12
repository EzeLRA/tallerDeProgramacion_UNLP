package practica.parcial.pkg5;

public class estacionGNC {
    //Atributos
    private String direcion;
    private double precioMcubico;
    private int surtidoresMax;
    private int ventasMax;
    private Surtidor[] surtidores;

    //Constructor
    public estacionGNC(String direcion, double precioMcubico, int ventasMax) {
        this.direcion = direcion;
        this.precioMcubico = precioMcubico;
        this.surtidoresMax = 6;
        this.ventasMax = ventasMax;
        
        this.surtidores = new Surtidor[this.surtidoresMax];
        for(int i=0;i<this.surtidoresMax;i++){
            this.surtidores[i] = new Surtidor(this.ventasMax);
        }
    }
    
    //Metodos
    public void agregarVentaSurtidor(int NSurtidor,int dniCliente,double cantidadM3,String formaPago){
        double monto = this.precioMcubico*cantidadM3;
        Venta v = new Venta(dniCliente,cantidadM3,monto,formaPago);
        this.surtidores[NSurtidor].agregarVenta(v);
    }
    
    public void deshablitarSurtidoresPorXvalor(double X){
        for(int i=0;i<this.surtidoresMax;i++){
            if(this.surtidores[i].cantidadM3Total() < X){
                this.surtidores[i].deshabilitarServicio();
            }
        }
    }
    
    public Venta obtenerVentaMayorMonto(){
        double max = -1;
        Venta ventaMax = null;
        Venta ventaAux = null;
        for(int i=0;i<this.surtidoresMax;i++){
            ventaAux = this.surtidores[i].obtenerVentaMayorMonto();
            if(ventaAux != null){
                if(ventaAux.getMontoAbonado() > max){
                    ventaMax = ventaAux;
                    max = ventaAux.getMontoAbonado();
                }
            }
        }
        return ventaMax;
    }

    @Override
    public String toString() {
        String cad = "Estacion de Servicio:" + "direcion=" + direcion + ", precio por M3=" + precioMcubico + "\n";
        for(int i=0;i<this.surtidoresMax;i++){
            cad += "Surtidor "+ (i+1) +":" +this.surtidores[i].toString() + "\n";
        }
        return cad;
    }
    
}
