package practica.parcial.pkg13;

public class Funcion {
	//Atributos
	private String titulo;
	private int fecha;
	private int hora;
	private int filasMax,butacasMax;
	private Butaca[][] butacas;
	
	//Constructor
	public Funcion(String titulo, int fecha, int hora, int filasMax, int butacasMax) {
		this.titulo = titulo;
		this.fecha = fecha;
		this.hora = hora;
		this.filasMax = filasMax;
		this.butacasMax = butacasMax;
		this.butacas = new Butaca[this.filasMax][this.butacasMax];
		
		for(int i=0;i<this.filasMax;i++){
			for(int j=0;j<this.butacasMax;j++){
				this.butacas[i][j] = new Butaca(i+1,j+1);
			}
		}
	}
	
	//Metodos
	public void ocuparButaca(int Nfila,int Nbutaca){
		int posX = Nfila - 1;
		int posY = Nbutaca - 1;
		this.butacas[posX][posY].ocuparButaca();
	}
	
	public void desocuparButacasFila(int Nfila){
		int fila = Nfila - 1;
		for(int i = 0;i<this.butacasMax;i++){
			this.butacas[fila][i].liberarButaca();
		}
	}
	
	public String obtenerButacasDeN(int Nbutaca){
		String cad = "";
		for(int i=0;i<this.filasMax;i++){
			cad += this.butacas[i][Nbutaca-1].toString() + ";";
		}
		return cad;
	}

	@Override
	public String toString() {
		String cad = "Funcion: " + this.titulo + " , Fecha= " + this.fecha + " , Hora= " + this.hora + "\n";
		for(int i=0;i<this.filasMax;i++){
			for(int j=0;j<this.butacasMax;j++){
				cad += this.butacas[i][j].toString();
			}
			cad += "\n";
		}
		return cad;
	}
}
