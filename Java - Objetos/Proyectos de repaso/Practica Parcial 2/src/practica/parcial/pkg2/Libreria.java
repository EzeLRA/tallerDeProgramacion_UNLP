package practica.parcial.pkg2;
import PaqueteLectura.*;

public class Libreria {
    //Atributos
    private String nombre;
    private int maxTickets;
    private Caja[] cajas;
    private int numVentaActual;
    
    //Constructor
    public Libreria(String nombre,int maxTickets) {
        this.nombre = nombre;
        this.maxTickets = maxTickets;
        this.cajas = new Caja[4];
        this.numVentaActual = 0;
        for(int i=0; i<4 ; i++){
            this.cajas[i] = new Caja(this.maxTickets);
        }
    }
    
    //Metodos
    public void agregarCompraEnCaja(int NCaja,int DNI_Cliente,int librosCant,double montoAbonado,String metodoPago){
        this.numVentaActual = GeneradorAleatorio.generarInt(1000);
        Ticket ticket = new Ticket(this.numVentaActual,DNI_Cliente,librosCant,montoAbonado,metodoPago);
        this.cajas[NCaja].agregarTicket(ticket);
    }
    
    public void deshabilitarCajas_MenosLibrosVendidosA_X(int x){
        for(int i=0; i<4 ; i++){
            if(this.cajas[i].librosVendidosMenorA_X(x)==true){
                this.cajas[i].deshabilitarCaja();
            }
        }
    }
    
    public Ticket retornarTicketDeMayorMontoAbonado(){
        double montoMax = -1;
        Ticket ticketMax = null;
        Ticket ticketAux = null;
        for(int i=0; i<4 ;i++){
            ticketAux = this.cajas[i].retornarTicketDeMayorMonto();
            
            if(ticketAux != null){
                if(ticketAux.getMontoAbonado() > montoMax){
                    ticketMax = ticketAux;
                    montoMax = ticketAux.getMontoAbonado();
                }
            }
        }
        return ticketMax;
    }

    @Override
    public String toString() {
        String cadDevolver = "Libreria:" + nombre + ";\n";
        for(int i=0; i<4 ; i++){
            cadDevolver += "Caja " + (i+1) + ":" + this.cajas[i].toString() + "\n";
        }
        return cadDevolver;
    }
    
    
}
