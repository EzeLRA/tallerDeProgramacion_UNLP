package tema4.Ejercicio4;

public class RegistroTemperaturas {
    //Atributos
    private int aniosCant,aniosIni,aniosFin;
    private double temperaturaMeses[][];
    
    //Constructor
    public RegistroTemperaturas(int A,int N){
        this.aniosIni = A;
        this.aniosFin = N;
        this.aniosCant = this.aniosFin - this.aniosIni;
        this.temperaturaMeses = new double[aniosCant][12];
    }
    
    
    
}
