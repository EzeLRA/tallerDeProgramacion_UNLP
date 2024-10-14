package practica.parcial.pkg14;

public class Estadio {
    //Atributos
    private String nombre,direccion;
    private int capacidad;
    private int meses;
    private int dias;
    private Mes[] agendaMeses;
    
    //Constructor
    public Estadio(String nombre, String direccion, int capacidad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        
        this.meses = 12;
        this.dias = 31;
        this.agendaMeses = new Mes[this.meses];
        for(int i=0;i<this.meses;i++){
            this.agendaMeses[i] = new Mes(this.dias);
        }
    }
    
    //Metodos
    public void agendarConciertoMes(int mes,Concierto c){
        this.agendaMeses[mes-1].agendarConcierto(c);
    }
    
    public String retornarConciertosCadMes(int mes){
        String cad = "";
        cad = this.agendaMeses[mes-1].retornarConciertosCad();
        return cad;
    }
    
    public double gananciaMes(int mes){
        double monto = 0;
        monto += this.agendaMeses[mes-1].retornarMonto();
        return monto;
    }
    
    @Override
    public String toString() {
        String cad = "Estadio:" + nombre + "," + direccion + "," + capacidad + "\n";
        for(int i=0;i<this.meses;i++){
            cad += "Mes " + (i+1) + "\n" + this.agendaMeses[i].retornarConciertosCad();
        }
        return cad;
    }
    
    
}
