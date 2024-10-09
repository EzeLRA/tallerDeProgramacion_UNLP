package practica.pkg5.ejercicio3;

public class Gira extends Recital{
    //Atributos
    private String nombreGira;
    private int fechaEnActuacion;
    private int fechasCant;
    private int fechasCantMax;
    private Fecha[] fechas;
    
    //Constructor
    public Gira(String nombreGira, int fechasCantMax, String nombreBanda, int temasCant) {
        super(nombreBanda, temasCant);
        this.nombreGira = nombreGira;
        this.fechasCant = 0;                            //DIM L
        this.fechaEnActuacion = this.fechasCant;
        this.fechasCantMax = fechasCantMax;             //DIM F
        this.fechas = new Fecha[this.fechasCantMax];
    }
    
    public void agregarFecha(Fecha f){
        if(this.fechasCant < this.fechasCantMax){
            this.fechas[this.fechasCant] = f;
            this.fechasCant ++;
        }
    }
    
    @Override
    public void actuar(){
        if(this.fechaEnActuacion < this.fechasCant){
            System.out.println("Buenas noches " + this.fechas[this.fechaEnActuacion].getNombreCiudad() + "\n");
            super.actuar();
            this.fechaEnActuacion ++;
        }
    }
    
    public int calcularCosto(){
        return 30000 * this.fechasCant;
    }
    
}
