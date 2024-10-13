package practica.practica.pkg12;

public class CompraMinorista extends Compra{
    //Atributos
    private boolean esJubilado;

    //Constructor
    public CompraMinorista(boolean esJubilado, int numeroCompra, int productosMax) {
        super(numeroCompra, productosMax);
        this.esJubilado = esJubilado;
    }
    
    //Metodos
    @Override
    public String toString() {
        String cad = "Compra Minorista: " + super.toString();
        if(this.esJubilado){
            cad += " Es jubilado";
        }else{
            cad += " No es jubilado";
        }
            
        return cad;
    }
    
    
    
}
