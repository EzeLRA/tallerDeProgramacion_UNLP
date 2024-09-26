package tema3;


public class Triangulo {
	//Atributos
	private double lado1,lado2,lado3;
	private String colorArea,colorPerimetro;
	
	//Constructores
	public Triangulo(double a, double b, double c, String colorA, String colorP){
		lado1 = a;
		lado2 = b;
		lado3 = c;
		colorArea = colorA;
		colorPerimetro = colorP;
	}
	public Triangulo(){
	}
	
	//Metodos
	
	//Setters
	public void setLados(double a, double b, double c){
		lado1 = a;
		lado2 = b;
		lado3 = c;
	}
	
	public void setColorArea(String colorA){
		colorArea = colorA;
	}
	
	public void setColorPerimetro(String colorP){
		colorPerimetro = colorP;
	}
	
	//Getters
	public double getLado1(){
		return lado1;	
	}
	
	public double getLado2(){
		return lado2;
	}
	
	public double getLado3(){
		return lado3;
	}
	
	public String getColorArea(){
		return colorArea;
	}
	
	public String getColorPerimetro(){
		return colorPerimetro;
	}

	//Metodos acciones
	
	public double calcularPerimetro(){
		return lado1 + lado2 + lado3;
	}
	
	public double calcularArea(){
		double s = calcularPerimetro() / 2;
                return (double) Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
	}
	
	public void informarPerimetroArea(){
		System.out.println("Perimetro: " + calcularPerimetro() + " Area: " + calcularArea());
	}
}
