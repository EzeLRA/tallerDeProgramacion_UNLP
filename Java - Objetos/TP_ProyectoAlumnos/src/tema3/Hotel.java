package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    //Atributos
    private Habitacion[] habitaciones;
    private int habitacionesCant ;  //DimL
    private int habitacionesTotal ; //DimF
    
    //Constructores
    public Hotel(int hCant){    
        habitacionesCant = 0;
        habitacionesTotal = hCant;
        habitaciones = new Habitacion[habitacionesTotal];
    }
    
    //Metodos
    public void cargarPrecios(int a, int b){   
        double precio;
        /*
            CONSULTAR
        */
        
        GeneradorAleatorio.iniciar();
        for(int i=0; i< this.habitacionesTotal ; i++){
            precio = (double) b - (GeneradorAleatorio.generarDouble(a)+1);
            this.habitaciones[i] = new Habitacion(precio);
        }
    }
    
    public void aumentarPrecios(double montoAumentar){
        double montoAumentado;
        for(int i=0; i< this.habitacionesTotal ; i++){
            montoAumentado = habitaciones[i].getPrecio() + montoAumentar;
            this.habitaciones[i].setPrecio(montoAumentado);
       } 
    }
    
    public void reservarHabitacion(int X,Cliente cli){
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setNombre(cli.getNombre());
        nuevoCliente.setDni(cli.getDni());
        nuevoCliente.setEdad(cli.getEdad());
        
        if(habitaciones[X].isOcupada() == false){
            habitaciones[X].setOcupada(true);
            habitaciones[X].setCliente(nuevoCliente);
        }
    }

    @Override
    public String toString() {
        String cadDevolver = "";
        for(int i=0; i<habitacionesTotal; i++){
            cadDevolver += "{Habitacion " + i + ": " + habitaciones[i].getPrecio() + "," + habitaciones[i].isOcupada();
            if(habitaciones[i].isOcupada() == true){
                cadDevolver += "," + habitaciones[i].getCliente().toString();
            }
            cadDevolver += "}\n";
        }
        return cadDevolver;
    }
    
}
