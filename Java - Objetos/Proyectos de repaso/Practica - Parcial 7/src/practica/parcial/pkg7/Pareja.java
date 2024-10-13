package practica.parcial.pkg7;

public class Pareja {
    //Atributos
    private String estiloBaile;
    private Participante[] parejaDatos;
    
    //Constructor
    public Pareja(String estilo,Participante p1,Participante p2){
        this.estiloBaile = estilo;
        this.parejaDatos = new Participante[2];
        this.parejaDatos[0] = p1;
        this.parejaDatos[1] = p2;
    }
    
    //Metodos
    public int retornarDiferenciaEdad(){
        int diferencia = this.parejaDatos[0].getEdad() - this.parejaDatos[1].getEdad();
        
        if(diferencia < 0){
            diferencia *= -1;
        }
        
        return diferencia;
    }

    @Override
    public String toString() {
        return "Pareja{" + this.parejaDatos[0].getNombre() + ";" + this.parejaDatos[1].getNombre() + '}';
    }
    
    
}
