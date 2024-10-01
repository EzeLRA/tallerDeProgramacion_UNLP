package tema4.Ejercicio3;

public class Trabajador extends Persona{
    //Atributos
    private String rubro;
    
    //Constructor
    public Trabajador(String unNombre, int unDNI, int unaEdad,String unRubro){
        super(unNombre,unDNI,unaEdad);
        this.rubro = unRubro;
    }
    
    public Trabajador(){
    
    }
    
    //Metodos
    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    @Override
    public String toString() {
        return super.toString() + "Soy " + this.rubro + ".";
    }
     
}
