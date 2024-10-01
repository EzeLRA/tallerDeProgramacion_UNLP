package tema4.Ejercicio2;

public class Entrenador extends Empleado{
    //Atributos
    private int campeonatosGanados;
            
    //Constructor
    public Entrenador(String nombre, double sueldoBasico, int antiguedad){
        super(nombre,sueldoBasico,antiguedad);
        this.campeonatosGanados = 0;
    }
    public Entrenador(String nombre, double sueldoBasico, int antiguedad ,int partidasCant){
        super(nombre,sueldoBasico,antiguedad);
        this.campeonatosGanados = partidasCant;
    }
    
    //Metodos
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        return (double) super.getAntiguedad() / this.campeonatosGanados;
    }
    
    public double calcularSueldoACobrar(){
        double sueldoCobra = (double) ((100 + super.getPorcentajeAumentar())*super.getSueldoBasico())/100;
        
        int aniosCant = super.getAntiguedad();
        
        if(aniosCant > 10){
            sueldoCobra += 50000;
        }else if((aniosCant >= 5)&(aniosCant <=10)){
            sueldoCobra += 30000;
        }else if((aniosCant >= 1)&(aniosCant <=4)){
            sueldoCobra += 5000;
        }
        
        return sueldoCobra;
    }

    @Override
    public String toString() {
        return "Entrenador{" + "campeonatosGanados=" + campeonatosGanados + super.toString() +'}';
    }
    
    
}
