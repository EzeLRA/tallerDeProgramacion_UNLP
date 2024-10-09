package practica.pkg5.ejercicio3;

public abstract class Recital {
    //Atributos
    private String nombreBanda;
    private int temasDispone;
    private int temasCant;
    private String[] listaTemas;
    
    //Constructor
    public Recital(String nombreBanda, int temasCant) {
        this.nombreBanda = nombreBanda;
        this.temasDispone = 0;
        this.temasCant = temasCant;
        this.listaTemas = new String[temasCant];
    }
    
    public void agregarTema(String nombreTema){
        if(this.temasDispone < this.temasCant){
            this.listaTemas[this.temasDispone] = nombreTema;
            this.temasDispone ++;
        }
    }
    
    public void actuar(){
        for(int i=0; i<this.temasDispone ; i++){
            System.out.println("Y ahora tocaremos " + this.listaTemas[i] + ".\n");
        }
    }
    
    public abstract int calcularCosto();
    
}
