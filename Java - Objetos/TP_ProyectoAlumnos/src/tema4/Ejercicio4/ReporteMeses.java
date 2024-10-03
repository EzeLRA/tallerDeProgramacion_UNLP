package tema4.Ejercicio4;
import PaqueteLectura.GeneradorAleatorio;

public class ReporteMeses extends SistemaRegistro{
    //Atributos
    
    //Constructor
    public ReporteMeses(){
        super();
        
    }
    
    public void generarTemperaturas(double tempMin,double tempMax){
        for(int i=0; i<super.getDimF() ; i++){
            super.setTemperatura(i, tempMax - (GeneradorAleatorio.generarDouble((int)tempMin + 1)));
        }
    }
    
    public void registrarTemperatura(double tempRegistrar, int mes){
        if((mes >= 1)&(mes < 12)){  //Opcional
            super.setTemperatura(mes, tempRegistrar);
        }
    }
    
    public double obtenerTemperatura(int mes){
       if((mes >= 1)&(mes < 12)){  //Opcional
            super.getTemperatura(mes);
        } 
    }
    
    
}
