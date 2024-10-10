package practica.parcial.pkg2;

public class Caja {
    //Atributos
    private boolean disponible;
    private int ticketsCant;
    private int ticketsMax;
    private Ticket[] tickets;

    //Constructor
    public Caja(int ticketsMax) {
        this.disponible = true;
        this.ticketsMax = ticketsMax;
        this.ticketsCant = 0;
        this.tickets = new Ticket[this.ticketsMax];
    }
    
    //Metodos
    public void agregarTicket(Ticket t){
        if(this.ticketsCant < this.ticketsMax){
            this.tickets[this.ticketsCant] = t;
            this.ticketsCant ++;
        }
    }
    
    public boolean librosVendidosMenorA_X(int x){
        int total = 0;
        
        for(int i=0; i<this.ticketsCant ; i++){
                total += this.tickets[i].getLibrosCompradosCant();
        }
        
        return total < x;
    }

    public void deshabilitarCaja(){
        this.disponible = false;
    }
    
    public Ticket retornarTicketDeMayorMonto(){
        double montoMax = -1;
        Ticket ticketMax = null;
        
        for(int i=0; i<this.ticketsCant ; i++){
            if(this.tickets[i].getMontoAbonado() > montoMax){
                montoMax = this.tickets[i].getMontoAbonado();
                ticketMax = this.tickets[i];
            }
        }
        return ticketMax;
    }

    @Override
    public String toString() {
        String cadDevolver = "disponible=" + disponible + "; Tickets Emitidos";
        for(int i=0; i<this.ticketsCant;i++){
            cadDevolver += this.tickets[i].toString();
        }
        return cadDevolver;
    }
    
    
        
}
