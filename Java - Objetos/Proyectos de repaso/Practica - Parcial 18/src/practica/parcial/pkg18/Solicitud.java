package practica.parcial.pkg18;

public class Solicitud {
    //Atributos
    private String nombreInvestigador;
    private String nombrePlanTrabajo;
    private String nombreLugarDestino;
    private double tasaEmbarque,costoIda,costoVuelta;
    private int diasEstadia;
    private double montoHotelDia;
    private boolean otorgado;
    
    //Constructor
    public Solicitud(String nombreInvestigador, String nombrePlanTrabajo, String nombreLugarDestino, double costoIda, double costoVuelta, double tasaEmbarque, int diasEstadia, double montoHotelDia) {
        this.nombreInvestigador = nombreInvestigador;
        this.nombrePlanTrabajo = nombrePlanTrabajo;
        this.nombreLugarDestino = nombreLugarDestino;
        this.costoIda = costoIda;
        this.costoVuelta = costoVuelta;
        this.tasaEmbarque = tasaEmbarque;
        this.diasEstadia = diasEstadia;
        this.montoHotelDia = montoHotelDia;
        this.otorgado = false;
    }
    
    //Metodos
    public double retornarMontoTotalViaje(){
        return this.tasaEmbarque + this.costoVuelta + this.costoIda ;
    }
    
    public double retornarMontoEstadia(){
        return this.montoHotelDia*this.diasEstadia;
    }
    
    public void otorgarSolicitud(){
        this.otorgado = true;
    }
    
    public boolean isOtorgado(){
        return (this.otorgado == true);
    }
    
    @Override
    public String toString() {
        return "Solicitud{" + "nombreInvestigador=" + nombreInvestigador + ", nombrePlanTrabajo=" + nombrePlanTrabajo + ", nombreLugarDestino=" + nombreLugarDestino + '}';
    }
    
    
    
}
