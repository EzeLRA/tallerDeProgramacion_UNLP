package practica.parcial;

public class EmpresaInformatica {
    //Atributos
    private String nombre;
    private ProgramadorLider programadorLider;
    private int programadoresCant;
    private int programadoresMax;
    private Programador[] programadores;
    
    //Constructor
    public EmpresaInformatica(String nombre, ProgramadorLider programadorLider, int programadoresMax) {
        this.nombre = nombre;
        this.programadorLider = programadorLider;
        this.programadoresMax = programadoresMax;
        
        this.programadoresCant = 0;
        this.programadores = new Programador[this.programadoresMax];
    }
    
    //Metodos
    public void agregarProgramador(Programador p){
        if(this.programadoresCant < this.programadoresMax){
            this.programadores[this.programadoresCant] = p;
            this.programadoresCant ++;
        }
    }
    
    public int montoTotalSueldosAbonar(){
        int montoTotal = 0;
        montoTotal += this.programadorLider.obtenerSueldoFinal();
        for(int i=0; i<this.programadoresCant ; i++){
            montoTotal += this.programadores[i].obtenerSueldoFinal();
        }
        return montoTotal;
    }
    
    public void aumentarSueldos(int montoAumento){
        this.programadorLider.aumentarSueldo(montoAumento);
        for(int i=0; i<this.programadoresCant ; i++){
            this.programadores[i].aumentarSueldo(montoAumento);
        }
    }
    
    @Override
    public String toString() {
        String cadDevolver = "Empresa:" + this.nombre + "\n" + "Programador Lider : " + this.programadorLider.toString() + "\n";
        for(int i=0;i<this.programadoresCant;i++){
            cadDevolver += "Programador " + (i+1) + " : " + this.programadores[i].toString() + "\n";
        }
        cadDevolver += "Monto total en sueldos a abonar por la empresa: " + this.montoTotalSueldosAbonar();
        return cadDevolver;
    }
    
}
