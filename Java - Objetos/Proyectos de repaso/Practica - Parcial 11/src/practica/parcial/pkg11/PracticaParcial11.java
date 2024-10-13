package practica.parcial.pkg11;
import PaqueteLectura.GeneradorAleatorio;

public class PracticaParcial11 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Concurso concurso = new Concurso(20);
        Alumno a;
        for(int i=0;i<5;i++){
            a = new Alumno(GeneradorAleatorio.generarString(3),GeneradorAleatorio.generarInt(30),GeneradorAleatorio.generarString(3));
            concurso.inscribirAlumno(GeneradorAleatorio.generarInt(5), a);       
        }
        GeneroMusical g = concurso.retornarGeneroMasInscriptos();
        if(g != null){
            System.out.println(g.toString());
        }
        
        for(int i=0;i<5;i++){
            concurso.asignarPuntajeAlu(GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(3));       
        }
    }
    
}
