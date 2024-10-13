package practica.parcial.pkg10;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial10 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        SalaComputadoras s = new SalaComputadoras(5);
        Computadora pc;
        for(int i=0;i<3;i++){
            pc = new Computadora(GeneradorAleatorio.generarInt(10));
            s.incluirPC(1+GeneradorAleatorio.generarInt(5), pc);
        }
        
        for(int i=0;i<2;i++){
            s.encenderPCBajoConsumo();
        }
        
        System.out.println(s.retornarNespaciosOcupados());
    }
    
}
