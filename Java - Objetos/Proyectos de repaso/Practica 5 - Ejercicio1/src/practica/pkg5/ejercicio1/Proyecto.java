package practica.pkg5.ejercicio1;

public class Proyecto {
    //Atributos
    private String Nombre ;
    private int codigo;
    private String nombreCompletoDirector;
    
    private int investigadoresCant = 0;
    private final int investigadoresCantMax = 50;
    private Investigador[] investigadores = new Investigador[this.investigadoresCantMax];
    
    //Constructor
    public Proyecto(String nombre,int codigo,String nombreDirector){
        this.Nombre = nombre;
        this.codigo = codigo;
        this.nombreCompletoDirector = nombreDirector;
    }
    
    //Metodos
    public void agregarInvestigador(Investigador unInvestigador){
        if(investigadoresCant < investigadoresCantMax){
            this.investigadores[this.investigadoresCant] = unInvestigador;
            this.investigadoresCant ++;
        }else{
            System.out.println("Lista llena");
        }
    }
    
    public double dineroTotalOtorgado(){
        double dineroTotal = 0;
        if(this.investigadoresCant > 0){
            for(int i=0; i<this.investigadoresCant ; i++){
                dineroTotal += this.investigadores[i].retornarMontoTotalSubsidios();
            }
        }
        return dineroTotal;
    }
    
    public void agregarSubsidio(String nombre_completo,Subsidio unSubsidio){
        if(this.investigadoresCant > 0){
            int i=0;
            boolean otorgado = false;
            while((i < investigadoresCant)&(otorgado == false)){
                if(this.investigadores[i].getNombreCompleto().equals(nombre_completo)){
                    this.investigadores[i].agregarSubsidio(unSubsidio);
                    otorgado = true;
                }
                i++;
            }
        }
    }
    
    public void otorgarTodos(String nombre_completo){
        if(this.investigadoresCant > 0){
            int i=0;
            boolean otorgado = false;
            while((i < investigadoresCant)&(otorgado == false)){
                if(this.investigadores[i].getNombreCompleto().equals(nombre_completo)){
                    this.investigadores[i].confirmarSubsidios();
                    otorgado = true;
                }
                i++;
            }
        }
    }

    @Override
    public String toString() {
        String cadDevolver = "Proyecto:" + "Nombre=" + Nombre + ", Codigo=" + codigo + ", Nombre completo del director=" + nombreCompletoDirector + ", Monto otorgado=" + this.dineroTotalOtorgado() + " \n";
        if(this.investigadoresCant > 0){
            for(int i=0;i<this.investigadoresCant ; i++){
                cadDevolver += this.investigadores[i].toString();
                cadDevolver += "\n";
            }
        }else{
            cadDevolver += "(Sin investigadores)";
        }
        return cadDevolver;
    }
    
}
