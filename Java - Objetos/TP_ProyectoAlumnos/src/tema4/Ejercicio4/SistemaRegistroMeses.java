package tema4.Ejercicio4;
import PaqueteLectura.GeneradorAleatorio;

public class SistemaRegistroMeses extends EstacionPrincipal {
    //Atributos
    private double tempMin,tempMax;
    private int aniosCant,anioIni,anioFin;
    private double[][] matrizTemperaturas;
    private double[] matrizPromedios;   //Promedios para cada mes de los anios ingresados
    
    private String meses[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
    
    //Constructor
    public SistemaRegistroMeses(String nomEstacion, double latEstacion ,double lonEstacion , int anioPri, int anioFin , double tempMin , double tempMax){
        super(nomEstacion,latEstacion,lonEstacion);
        this.anioIni = anioPri;
        this.anioFin = anioFin;
        this.aniosCant = (this.anioFin - this.anioIni) + 1;
        this.tempMin = tempMin;
        this.tempMax = tempMax;
        this.matrizTemperaturas = new double[this.aniosCant][12];
        this.matrizPromedios = new double[12];
        
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
    
    public String aniosMes_TemperaturaMax(){
        int anioMax = 0;
        int mesMax = 0;
        double tempMax = -1;
        String devolverCad;
        
        for(int i=0; i< this.aniosCant ; i++){
            for(int j=0; j<12 ; j++){
                if(tempMax <this.matrizTemperaturas[i][j]){
                    tempMax = this.matrizTemperaturas[i][j];
                    anioMax = i;
                    mesMax = j;
                } 
            }
        }
        devolverCad = "Temperatura:" + tempMax + " Anio:" + (this.anioFin - anioMax) + " Mes:" + mesMax;
        
        return devolverCad;
    }
    
    public void calcularPromedios(){
        double prom = 0;
        for(int i=0; i < 12 ; i++){
            for(int j=0; j < this.aniosCant ; j++){
                prom += this.matrizTemperaturas[j][i];
            }
            this.matrizPromedios[i] = prom / this.aniosCant ;
            prom = 0;
        }
    }

    @Override
    public String toString() {
        String cadDevolver = new String();
        cadDevolver += super.toString();
        for(int i=0; i<12 ; i++){
            cadDevolver += "\n Mes: " + this.meses[i] + " Temperatura Promedio: " + this.matrizPromedios[i];
        }
        return cadDevolver;
    }
    
    
    
}

