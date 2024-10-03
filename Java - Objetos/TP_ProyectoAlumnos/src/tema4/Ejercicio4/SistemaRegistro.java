package tema4.Ejercicio4;
import PaqueteLectura.GeneradorAleatorio;

public abstract class SistemaRegistro {
    //Atributos
    private int dimF;
    private double[] temperaturas;
    
    //Constructores
    public SistemaRegistro(){
        // Por defecto 12 por los meses de un anio
        this.dimF = 12;
        this.temperaturas = new double[dimF];
    }
    
    public SistemaRegistro(int DimF){
        this.dimF = DimF;
        this.temperaturas = new double[dimF];
    }
    
    //Metodos
    public int getDimF(){
        return this.dimF;
    }
    
    public void setTemperatura(int pos,double temp){
        this.temperaturas[pos] = temp;
    }
    
    public double getTemperatura(int pos){
        return this.temperaturas[pos];
    }
    
    public abstract void registrarTemperatura();
    public abstract double obtenerTemperatura();

    public abstract double promedio();
    
}
