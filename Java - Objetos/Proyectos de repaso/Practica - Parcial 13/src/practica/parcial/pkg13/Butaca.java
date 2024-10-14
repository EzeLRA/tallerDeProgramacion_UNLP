package practica.parcial.pkg13;

public class Butaca {
	//Atributos
	private String descriptor;
	private boolean desOcupado;
	private double precio;
	
	//Constructor
	public Butaca(int NFila,int NButaca) {
		this.desOcupado = true;
		this.precio = 800 + 100 * NFila;
		this.descriptor = "Butaca "+ NFila + "," + NButaca;
	}
	
	//Metodos
	public void ocuparButaca(){
		if(this.desOcupado){
			this.desOcupado = false;
		}
	}
	
	public void liberarButaca(){
		if(this.desOcupado == false){
			this.desOcupado = true;
		}
	}

	public double getPrecio() {
		return precio;
	}

	@Override
	public String toString() {
		return "(descriptor=" + descriptor + ", desocupado=" + desOcupado + ", precio=" + precio + ')';
	}
	
}
