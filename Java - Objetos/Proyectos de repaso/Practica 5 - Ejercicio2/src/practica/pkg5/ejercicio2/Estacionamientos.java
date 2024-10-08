package practica.pkg5.ejercicio2;

public class Estacionamientos {
    //Atributos
    private String nombreSitio; 
    private String direccion;   
    private int horaApertura;   
    private int horaCierre;     
    private int pisosMax;
    private int plazasMax;
    private Auto[][] estacionamientos;
    
    //Constructores
    public Estacionamientos(String nombreSitio, String direccion) {
        this.nombreSitio = nombreSitio;
        this.direccion = direccion;
        
        this.horaApertura = 8;
        this.horaCierre = 21;
        this.pisosMax = 5;
        this.plazasMax = 10;
        this.estacionamientos = new Auto[pisosMax][plazasMax];
    }

    public Estacionamientos(String nombreSitio, String direccion, int horaApertura, int horaCierre, int pisosMax, int plazasMax) {
        this.nombreSitio = nombreSitio;
        this.direccion = direccion;
        
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisosMax = pisosMax;
        this.plazasMax = plazasMax;
        this.estacionamientos = new Auto[pisosMax][plazasMax];
    }
    
    //Metodos
    public void registrarEstacionamiento(Auto a,int pisoNum,int plazaNum){
        if(this.estacionamientos[pisoNum][plazaNum] == null){
            this.estacionamientos[pisoNum][plazaNum] = a;
        }
    }
    
    public String buscarPatenteAuto(String patente){
        String cadDevolver = "Auto Inexistente";
        boolean encontrado = false;
        
        int i,j;
        i=0; j=0;
        while((i<this.pisosMax)&(encontrado != true)){
            j=0;
            while((j<this.plazasMax)&(encontrado != true)){
                if(this.estacionamientos[i][j] != null){
                    encontrado = patente.equals(this.estacionamientos[i][j].getPatente());
                }
                j++;
            }
            i++;
        }
        
        if(encontrado == true){
            cadDevolver = "Numero Piso: " + i + " ,Numero Plaza: " + j ;
        }
        
        return cadDevolver;
    }
    
    public int autosEnLaPlazaPisos(int plazaNum){
        int autos = 0;
        for(int i=0; i<this.pisosMax ; i++){
            if(this.estacionamientos[i][plazaNum] != null){
                autos ++;
            }
        }
        return autos;
    }

    @Override
    public String toString() {
        String cadDevolver = "";
        
        for(int i=0;i<this.pisosMax;i++){
            for(int j=0;j<this.plazasMax;j++){
                cadDevolver += "Piso: " + i + " ,Plaza: " + j ;
                if(this.estacionamientos[i][j] != null){
                    cadDevolver += " ; " + this.estacionamientos[i][j].toString() + " ; ";
                }else{
                    cadDevolver += " ; Libre ;";
                }
            }
            cadDevolver += "\n";
        }
        
        return cadDevolver;
    }
    
}
