package tema3;

public class Habitacion {
    //Atributos
    private boolean ocupada;
    private double precio;
    private Cliente cliente;
    
    //Constructores
    public Habitacion(){
        this.ocupada = false;
        this.precio = 0;    //Inicializado en 0 para luego modificarlo con el setter
        this.cliente = null;    //Es correcto 
    }
    
    public Habitacion(double precioIngresado){
        this.ocupada = false;
        this.precio = precioIngresado;
        this.cliente = null;
    }
    
    //Metodos

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
     
}
