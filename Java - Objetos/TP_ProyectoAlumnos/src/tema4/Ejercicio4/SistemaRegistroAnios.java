package tema4.Ejercicio4;
import PaqueteLectura.GeneradorAleatorio;

public class SistemaRegistroAnios extends EstacionPrincipal {
    //Atributos
    private double tempMin,tempMax;
    private int aniosCant,anioIni,anioFin;
    private double[][] matrizTemperaturas;
    
    //Constructor
    public SistemaRegistroAnios(String nomEstacion, double latEstacion ,double lonEstacion , int anioPri, int anioFin , double tempMin , double tempMax){
        super(nomEstacion,latEstacion,lonEstacion);
        this.anioIni = anioPri;
        this.anioFin = anioFin;
        this.aniosCant = this.anioFin - this.anioIni;
        this.tempMin = tempMin;
        this.tempMax = tempMax;
       
    }
    
    public void generarTemperaturas(){
        for(int i=0; i< this.aniosCant ; i++){
            for(int j=0; j<12 ; j++){
                this.matrizTemperaturas[i][j] = tempMin + GeneradorAleatorio.generarDouble((int) (tempMax - tempMin));
            }
        }
    }
        
    public double obtenerTemperatura(int anio,int mes){
        int indice = this.anioFin - anio;
        return this.matrizTemperaturas[indice][mes];
    }
    
    public void registrarTemperatura(int anio,int mes,double temp){
        int indice = this.anioFin - anio;
        this.matrizTemperaturas[indice][mes] = temp;
    }
    
}
