package practica.pkg5.ejercicio1;

public class Subsidio {
    //Atributos
    private double montoPedido;
    private String motivoPedido;
    private boolean otorgado;
    
    //Constructor
    public Subsidio(double montoPedido, String motivoPedido) {
        this.montoPedido = montoPedido;
        this.motivoPedido = motivoPedido;
        this.otorgado = false;
    }
    
    //Metodos
    public double getMontoPedido() {
        return montoPedido;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    public boolean isOtorgado() {
        return otorgado;
    }
    
    
}
