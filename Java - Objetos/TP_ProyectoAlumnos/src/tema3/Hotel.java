package tema3;

public class Hotel {
    //Atributos
    private Habitacion[] habitaciones;
    private int habitacionesCant ;  //DimL
    private int habitacionesTotal ; //DimF
    
    //Constructores
    public Hotel(int hCant){    //Revisar segun el inciso
        habitacionesCant = 0;
        habitacionesTotal = hCant;
        habitaciones = new Habitacion[habitacionesTotal];
    }
    
    //Metodos
    public void cargarPrecios(double precio){   //REvisar segun el inciso
        if(habitacionesCant < habitacionesCant){
            habitaciones[habitacionesCant].setPrecio(precio);
            this.habitacionesCant ++;
        }
    }
    
    
    
    
}
