package practica.pkg5.ejercicio3;

public class EventoOcasional extends Recital {
    //Atributos
    private String motivo;
    private String nombreContratante;
    private int diaEvento;
    
    //Constructor
    public EventoOcasional(String motivo, String nombreContratante, int diaEvento, String nombreBanda, int temasCant) {
        super(nombreBanda, temasCant);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.diaEvento = diaEvento;
    }
    
    @Override
    public void actuar(){
        if(this.motivo.equals("a beneficio")){
            System.out.println("Recuerden colaborar con " + this.nombreContratante);
        }else if(this.motivo.equals("show de TV")){
            System.out.println("Saludos amigos televidentes");
        }else if(this.motivo.equals("show privado")){
            System.out.println("Un feliz cumpleanios para " + this.nombreContratante);
        }
    }
    
    public int calcularCosto(){
        int costo = 0;
        if(this.motivo.equals("a beneficio")){
            costo = 0;
        }else if(this.motivo.equals("show de TV")){
            costo = 50000;
        }else if(this.motivo.equals("show privado")){
            costo = 150000;
        }
        return costo;
    }
    
}
