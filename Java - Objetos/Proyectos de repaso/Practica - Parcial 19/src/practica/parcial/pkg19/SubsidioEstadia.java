package practica.parcial.pkg19;
public class SubsidioEstadia extends Subsidio{
    //Atributos
    private String lugarDestino;
    private double costoPasajes;
    private int diasEstadia;
    private double montoHotelDia;
    
    //Constructor
    public SubsidioEstadia(String lugarDestino, double costoPasajes, int diasEstadia, double montoHotelDia, String nombreInvestigador, String nombrePlanTrabajo, int fecha) {
        super(nombreInvestigador, nombrePlanTrabajo, fecha);
        this.lugarDestino = lugarDestino;
        this.costoPasajes = costoPasajes;
        this.diasEstadia = diasEstadia;
        this.montoHotelDia = montoHotelDia;
    }
    
    //Metodos
    public double retornarMontoTotal(){
        return this.costoPasajes + this.diasEstadia * this.montoHotelDia;
    }

    @Override
    public String toString() {
        return "Subsidio Estadia: " + super.toString() + "Monto total: " + this.retornarMontoTotal() + "\n" + 
                "Lugar de Destino: " + lugarDestino + ", Dias de Estadia: " + diasEstadia ;
    }
    
    
}
