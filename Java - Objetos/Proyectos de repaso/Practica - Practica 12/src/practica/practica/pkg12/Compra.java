package practica.practica.pkg12;

public abstract class Compra {
    //Atributos
    private int numeroCompra;
    private int productosCant;
    private int productosMax;
    private Producto[] productos;
    
    //Constructor
    public Compra(int numeroCompra, int productosMax) {
        this.numeroCompra = numeroCompra;
        this.productosMax = productosMax;
        this.productosCant = 0;
        this.productos = new Producto[this.productosMax];
    }
    
    //Metodos
    public void agregarProducto(Producto p){
        if(this.productosCant<this.productosMax){
            this.productos[this.productosCant] = p;
            this.productosCant ++;
        }
    }
    
    public double montoPagar(){
        double montoTotal = 0;
        int IVA = 21;
        
        if(this.productosCant>0){
            for(int i=0;i<this.productosCant;i++){
                montoTotal += this.productos[i].getPrecio();
            }
        }
        
        montoTotal = (montoTotal * (100 + IVA)) / 100;
        
        return montoTotal;
    }

    @Override
    public String toString() {
        String cad = "Nro: " + this.numeroCompra + " ; ";
        if(this.productosCant>0){
            for(int i=0;i<this.productosCant;i++){
                cad += this.productos[i].toString() + " ; ";
            }
        }
        cad += "Monto total a pagar: " + this.montoPagar() + " ; ";
        return cad;
    }
    
    
    
}

