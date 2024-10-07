package practica.pkg5.ejercicio1;

public class Investigador {
    //Atributos
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    
    private int subsidiosCant = 0;
    private final int subsidiosCantMax = 5;
    private Subsidio[] subsidios = new Subsidio[this.subsidiosCantMax];
    
    //Constructor
    public Investigador(String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }
    
    //Metodos
    public void agregarSubsidio(Subsidio unSubsidio){
        if(this.subsidiosCant < this.subsidiosCantMax){
            this.subsidios[this.subsidiosCant] = unSubsidio;
            this.subsidiosCant ++;
        }else{
            System.out.println("Limite excedido");
        }
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }
    
    public double retornarMontoTotalSubsidios(){
        double montoPedido = 0;
        if(this.subsidiosCant > 0){
            for(int i=0; i<this.subsidiosCant ; i++){
                if(this.subsidios[i].isOtorgado()){
                    montoPedido += this.subsidios[i].getMontoPedido();
                }
            }
        }
        return montoPedido;
    }
    
    public void confirmarSubsidios(){
        if(this.subsidiosCant > 0){
            for(int i=0; i<this.subsidiosCant ; i++){
                this.subsidios[i].setOtorgado(true);
            }
        }
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombreCompleto=" + nombreCompleto + ", categoria=" + categoria + ", especialidad=" + especialidad + ", Monto total de subsidios otorgados=" + this.retornarMontoTotalSubsidios() + '}';
    }
    
    
    
}
