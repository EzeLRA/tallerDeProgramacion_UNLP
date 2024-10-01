package tema4.Ejercicio1;

public class Triangulo extends Figura{
    
    //Atributos
    private double base,altura;
    
    //Constructor
    public Triangulo(double b,double a,String colorP,String colorR){
        super(colorR,colorP);
        base = b;
        altura = a;
    }
    
    //Metodos
    public double getBase(){
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double calcularPerimetro() {
        return base * 3;
    }
	
    public double calcularArea(){
        return (base * altura) / 2.0;
    }

    @Override
    public String toString() {
        return "Triangulo{" + "base=" + base + ", altura=" + altura + super.toString() +'}';
    }
    
    
    
}
