package practica.parcial.pkg2;

public class Ticket {
    //Atributos
    private int numTicket;
    private int dniCliente;
    private int librosCompradosCant;
    private double montoAbonado;
    private String metodoDePago;

    //Constructor
    public Ticket(int numTicket, int dniCliente, int librosCompradosCant, double montoAbonado, String metodoDePago) {
        this.numTicket = numTicket;
        this.dniCliente = dniCliente;
        this.librosCompradosCant = librosCompradosCant;
        this.montoAbonado = montoAbonado;
        this.metodoDePago = metodoDePago;
    }
    
    //Metodos
    public int getLibrosCompradosCant() {
        return librosCompradosCant;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    @Override
    public String toString() {
        return "[numTicket=" + numTicket + ", dniCliente=" + dniCliente + ", librosCompradosCant=" + librosCompradosCant + ", montoAbonado=" + montoAbonado + ", metodoDePago=" + metodoDePago + ']';
    }
    
    
}
