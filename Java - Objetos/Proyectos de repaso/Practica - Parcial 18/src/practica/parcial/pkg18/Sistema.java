package practica.parcial.pkg18;

public abstract class Sistema {
    //Atributos
    private int solicitudesCant,solicitudesMax;
    private Solicitud[] solicitudes;
    
    //Constructor
    public Sistema(int solicitudesMax) {
        this.solicitudesMax = solicitudesMax;
        this.solicitudesCant = 0;
        this.solicitudes = new Solicitud[this.solicitudesMax];
    }
    
    //Metodos
    public void recibirSolicitud(Solicitud s){
        if(this.solicitudesCant<this.solicitudesMax){
            this.solicitudes[this.solicitudesCant] = s;
            this.solicitudesCant ++;
        }
    }
    
    public int retornarSolicitudesCargadas(){
        return this.solicitudesCant;
    }
    
    public Solicitud retornarSolicitud(int pos){
        return this.solicitudes[pos];
    }
    
    public abstract void otorgarSolicitudes(double X);

    @Override
    public String toString() {
        String cad = "Solicitudes Otorgadas por el sistema: \n";
        
        if(this.solicitudesCant>0){
            for(int i=0;i<this.solicitudesCant;i++){
                if(this.solicitudes[i].isOtorgado()){
                    cad += this.solicitudes[i].toString() + "\n";
                }
            }
        }
        
        return cad;
    }
    
    
    
}
