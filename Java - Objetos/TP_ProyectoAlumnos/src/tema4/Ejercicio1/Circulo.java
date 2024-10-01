package tema4.Ejercicio1;

import tema4.Ejercicio1.Figura;

public class Circulo extends Figura{
    //Atributos
    private double radio;
    
    //Constructores
    public Circulo(double rad, String unColorR, String unColorL){
        super(unColorR,unColorL);
        this.radio = rad;
    }
    
    
    //Metodos

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        double area = Math.PI * (this.radio * this.radio);
        return area;
    }
    
    public double calcularPerimetro(){
        double perimetro = 2.0 * Math.PI * this.radio;
        return perimetro;
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + super.toString() + '}';
    }
    
    
    
}
