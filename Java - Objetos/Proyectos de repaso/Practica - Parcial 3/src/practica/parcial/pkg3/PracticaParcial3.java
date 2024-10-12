package practica.parcial.pkg3;
import PaqueteLectura.*;

public class PracticaParcial3 {

    public static void main(String[] args) {
        //Parcial 14/10/22
        GeneradorAleatorio.iniciar();
        CursoPresencial c1 = new CursoPresencial(1,1,5);
        CursoVirtual c2 = new CursoVirtual("fdsafsd",1,5);
        Alumno a;
        
        for(int i=0;i<5;i++){
            a = new Alumno(GeneradorAleatorio.generarInt(10),GeneradorAleatorio.generarString(5));
            c1.agregarAlumno(a);
            c2.agregarAlumno(a);
            
            c1.aprobarAutoevaluacionDNI(GeneradorAleatorio.generarInt(10));
            c1.incrementarAsistenciaDNI(GeneradorAleatorio.generarInt(10));
            
            c2.aprobarAutoevaluacionDNI(GeneradorAleatorio.generarInt(10));
            c2.incrementarAsistenciaDNI(GeneradorAleatorio.generarInt(10));
        }
        
        System.out.println(c1.cantidadAlumnosQuePuedenRendir());
        System.out.println(c2.cantidadAlumnosQuePuedenRendir());
  
    }
    
}
