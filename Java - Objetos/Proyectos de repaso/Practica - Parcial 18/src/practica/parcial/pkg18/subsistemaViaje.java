package practica.parcial.pkg18;

public class subsistemaViaje extends Sistema {
    //Atributos
    
    //Constructor
    public subsistemaViaje(int solicitudesMax) {
        super(solicitudesMax);
    }
    
    //Metodos
    
    public void agregarSolicitud(Solicitud s){
        super.recibirSolicitud(s);
    }
    
    public void otorgarSolicitudes(double X){
        int cant = super.retornarSolicitudesCargadas();
        Solicitud aux;
        if(cant > 0){
            for(int i=0;i<cant;i++){
                aux = super.retornarSolicitud(i);
                if(aux.retornarMontoTotalViaje() < X){
                    aux.otorgarSolicitud();
                }
            }
        }
    }
      
}
