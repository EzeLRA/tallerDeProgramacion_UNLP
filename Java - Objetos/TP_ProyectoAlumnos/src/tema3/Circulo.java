package tema3;

public class Circulo {
    //Atributos
    private double radio;
    private String colorPerimetro,colorRelleno;
    
    //Constructores
    public Circulo(){}
    
    public Circulo(String colorP,String colorR,double rad){
        this.radio = rad;
        this.colorPerimetro = colorP;
        this.colorRelleno = colorR;
    }
    
    //Metodos

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorPerimetro() {
        return colorPerimetro;
    }

    public void setColorPerimetro(String colorPerimetro) {
        this.colorPerimetro = colorPerimetro;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public double calcularArea(){
        double area = Math.PI * (this.radio * this.radio);
        return area;
    }
    
    public double calcularPerimetro(){
        double perimetro = 2.0 * Math.PI * this.radio;
        return perimetro;
    }
    
    
    
}
