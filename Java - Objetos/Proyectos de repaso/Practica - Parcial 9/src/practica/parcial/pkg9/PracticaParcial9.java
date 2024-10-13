package practica.parcial.pkg9;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial9 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        SistemaGestion sis = new SistemaGestion();
        
        Paciente p;
        for(int i=0;i<10;i++){
            p = new Paciente(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarBoolean(),GeneradorAleatorio.generarDouble(1000));
            sis.agregarPacienteDiaTurno(GeneradorAleatorio.generarInt(5), p);
        }
        
        System.out.println(sis.cancelarTurnosDia(1));
        System.out.println(sis.retornarMontoTotal());
        
    }
    
}
