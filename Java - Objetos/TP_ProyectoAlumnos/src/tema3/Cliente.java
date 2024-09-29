package tema3;

public class Cliente {
    //Atributos
    private String nombre;
    private int dni;
    private int edad;
    
    //Constructores
    public Cliente(){
    }
    
    public Cliente(String nom,int Dni,int Edad){
        this.nombre = nom;
        this.dni = Dni;
        this.edad = Edad;
    }
    
    //Metodos

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    
    
}
