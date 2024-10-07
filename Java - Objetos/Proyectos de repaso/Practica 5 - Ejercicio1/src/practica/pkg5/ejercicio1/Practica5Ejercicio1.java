package practica.pkg5.ejercicio1;
import PaqueteLectura.GeneradorAleatorio;

public class Practica5Ejercicio1 {
    /*  Inciso:
            
        La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto tiene:
         nombre, código, nombre completo del director y los investigadores que participan en el
         proyecto (50 como máximo). De cada investigador se tiene: nombre completo, categoría (1 a 5) 
         y especialidad. Además, cualquier investigador puede pedir hasta un máximo de 5
         subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue otorgado o no.
        
        i) Implemente el modelo de clases teniendo en cuenta:
            a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
             director.
            b. Un investigador sólo debería poder construirse con nombre, categoría y
             especialidad.
            c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
             Un subsidio siempre se crea en estado no-otorgado.

        ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
            a. void agregarInvestigador(Investigador unInvestigador);
        // agregar un investigador al proyecto.
            b. void agregarSubsidio(Subsidio unSubsidio);
        // agregar un subsidio al investigador.
            c. double dineroTotalOtorgado();
        //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
        todos los subsidios otorgados de todos los investigadores)
            d. void otorgarTodos(String nombre_completo);
        //otorgar todos los subsidios no-otorgados del investigador llamado
        nombre_completo
            e. String toString();
        // devolver un string con: nombre del proyecto, código, nombre del director, el
        total de dinero otorgado del proyecto y la siguiente información de cada
        investigador: nombre, categoría, especialidad, y el total de dinero de sus
        subsidios otorgados.

        iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
        subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
        todos los datos del proyecto en pantalla.

        */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Investigador p1,p2,p3;
        p1 = new Investigador("Carlos",1,"Informatico");
        p2 = new Investigador("Federico",2,"Tecnico Electronico");
        p3 = new Investigador("Marcos",3,"Informatico");
        Proyecto proyecto = new Proyecto("Prueba",2345,"Daniel");
        proyecto.agregarInvestigador(p1);
        proyecto.agregarInvestigador(p2);
        proyecto.agregarInvestigador(p3);
        
        String[] nombres = {"Carlos","Federico","Marcos"};
        Subsidio sub1;
        for(int i=0 ; i<3 ; i++){
            for(int j=0 ; j<2 ; j++){
                sub1 = new Subsidio(GeneradorAleatorio.generarDouble(10000),"Varios");
                proyecto.agregarSubsidio(nombres[i], sub1);
            }
        }
        
        proyecto.otorgarTodos("Carlos");
        
        System.out.println(proyecto.toString());
        
    }
    
}
