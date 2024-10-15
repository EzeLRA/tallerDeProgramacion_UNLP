package practica.parcial.pkg19;

public class SubsidioBienes extends Subsidio{
    //Atributos
    private int bienesCant,bienesMax;
    private Bien[] bienes;
    
    //Constructor
    public SubsidioBienes(int bienesMax, String nombreInvestigador, String nombrePlanTrabajo, int fecha) {
        super(nombreInvestigador, nombrePlanTrabajo, fecha);
        this.bienesMax = bienesMax;
        this.bienesCant = 0;
        this.bienes = new Bien[this.bienesMax];
    }
    
    //Metodos
    public void agregarBien(Bien b){
        if(this.bienesCant<this.bienesMax){
            this.bienes[this.bienesCant] = b;
            this.bienesCant ++;
        }
    }
    
    public double retornarMontoTotal(){
        double total = 0;
        
        if(this.bienesCant>0){
            for(int i=0;i<this.bienesCant;i++){
                total += this.bienes[i].retornarCosto();
            }
        }
        
        return total;
    }

    @Override
    public String toString() {
        String cad = "Subsidio Bienes: " + super.toString() + "Monto total: " + this.retornarMontoTotal() + "\n";
        if(this.bienesCant>0){
            cad += "Descripcion de los bienes solicitados: ";
            for(int i=0;i<this.bienesCant;i++){
                cad += this.bienes[i].getDescripcion() + " , ";
            }
        }
        return cad;
    }
    
    
    
    
}
