package practica.practica.pkg12;

public class CompraMayorista extends Compra {
    //Atributos
    private int CUIT_Emprendedor;
    
    //Constructor
    public CompraMayorista(int CUIT_Emprendedor, int numeroCompra, int productosMax) {
        super(numeroCompra, productosMax);
        this.CUIT_Emprendedor = CUIT_Emprendedor;
    }
    
    //Metodos

    @Override
    public String toString() {
        String cad= "Compra Mayorista: " + super.toString() + "CUIT: " + this.CUIT_Emprendedor;
        return cad;
    }
    
    
    
}
