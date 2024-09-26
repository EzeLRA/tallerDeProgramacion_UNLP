package tema3;
import PaqueteLectura.*;

public class Ejercicio1 {
	/*
	 *	1a.Definir una clase para representar triangulos. Un triangulo se caracteriza por el tamaño de sus 3 lados
	 *	(double), el color de relleno(String) y el color de linea(String).
	 *  
	 *  Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
	 * 
	 *  Provea metodos para:
	 *  -Devolver/Modificar el valor de cada uno de sus atributos(metodos get y set)
	 *  -Calcular el perimetro y devolverlo(metodo calcularPerimetro)
	 *  -Calcular el area y devolverla (metodo calcularArea)
	 * 
	 *	1b.Realizar un programa que instancie un triangulo,le cargue informacion leida desde teclado e informe
	 *	en consola el perimetro y el area.
	 * 
	 *	NOTA: Calcular el area con la formula "Area = raiz(s.(s-a).(s-b).(s-c))" , donde a,b y c son los lados y
	 *	"s = (a+b+c)/2" . La funcion raiz cuadrada es Math.sqrt().
	 * 
	 */
	public static void main(String[] args){
                GeneradorAleatorio.iniciar();
		//double lado1 = Lector.leerDouble();
		//double lado2 = Lector.leerDouble();
		//double lado3 = Lector.leerDouble();
		//String colorA = Lector.leerString();
		//String colorP = Lector.leerString();
                
                double lado1 = GeneradorAleatorio.generarDouble(10);
		double lado2 = GeneradorAleatorio.generarDouble(10);
		double lado3 = GeneradorAleatorio.generarDouble(10);
		String colorA = GeneradorAleatorio.generarString(3);
		String colorP = GeneradorAleatorio.generarString(3);
		
                
                Triangulo t1 = new Triangulo(lado1,lado2,lado3,colorA,colorP);
		
                t1.informarPerimetroArea();
	}
	
}
