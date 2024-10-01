package tema4.Ejercicio2;

public class Jugador extends Empleado{
    //Atributos
    private int partidosJugados,golesAnotados;
    
    //Constructores
    public Jugador(String nombre, double sueldoBasico, int antiguedad){
        super(nombre,sueldoBasico,antiguedad);
        partidosJugados = 0;
        golesAnotados = 0;
    }
    public Jugador(String nombre, double sueldoBasico, int antiguedad ,int partidasCant , int golesCant){
        super(nombre,sueldoBasico,antiguedad);
        partidosJugados = partidasCant;
        golesAnotados = golesCant;
    }
    
    
    //Metodos
    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public double calcularEfectividad(){
        return (double) this.partidosJugados / this.golesAnotados;
    }
    
    public double calcularSueldoACobrar(){
        double sueldoCobra = (double) ((100 + super.getPorcentajeAumentar())*super.getSueldoBasico())/100;
        if(this.calcularEfectividad() > 0.5){
            sueldoCobra += super.getSueldoBasico();
        }
        return sueldoCobra;
    }

    @Override
    public String toString() {
        return "Jugador{" + "partidosJugados=" + partidosJugados + ", golesAnotados=" + golesAnotados + super.toString() + '}';
    }
    
    
    
}
