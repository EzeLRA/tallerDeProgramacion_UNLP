package practica.parcial.pkg19;

public abstract class Subsidio {
    //Atributos
    private String nombreInvestigador,nombrePlanTrabajo;
    private int fecha;

    //Constructor
    public Subsidio(String nombreInvestigador, String nombrePlanTrabajo, int fecha) {
        this.nombreInvestigador = nombreInvestigador;
        this.nombrePlanTrabajo = nombrePlanTrabajo;
        this.fecha = fecha;
    }
    
    //Metodos
    public abstract double retornarMontoTotal();

    @Override
    public String toString() {
        return "Nombre del Investigador: " + nombreInvestigador + ", Plan de Trabajo: " + nombrePlanTrabajo + ", Fecha de solicitud: " + fecha ;
    }
    
    
    
}
