package practica.parcial.pkg13;
import PaqueteLectura.*;

public class PracticaParcial13 {

	public static void main(String[] args) {
		GeneradorAleatorio.iniciar();
		Funcion f = new Funcion("adsd",12,3,5,5);
		
		for(int i=0;i<5;i++){
			f.ocuparButaca(GeneradorAleatorio.generarInt(5)+1,GeneradorAleatorio.generarInt(5)+1);
		}
		f.desocuparButacasFila(GeneradorAleatorio.generarInt(5)+1);
		System.out.println(f.obtenerButacasDeN(2));
		System.out.println(f.toString());
		
	}
	
}
