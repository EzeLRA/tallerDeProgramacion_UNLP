package tema2;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {
    /*
        2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
        15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
        obtener edad 0. Luego de almacenar la información:
           - Informe la cantidad de personas mayores de 65 años.
           - Muestre la representación de la persona con menor DNI.
    */
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        //Vector de Personas
        int PersonasCant = 15;
        Persona[] personas = new Persona[PersonasCant];
        
        //Parametros y variables
        int dimL=0;
        
        String nombre;
        int edad = GeneradorAleatorio.generarInt(80);
        int dni;
       
        //Generacion de personas
        while((dimL < PersonasCant)&&(edad > 0)){
            nombre = new String(GeneradorAleatorio.generarString(5)) ;
            dni = GeneradorAleatorio.generarInt(1000);
            
            personas[dimL] = new Persona(nombre,dni,edad);
            
            edad = GeneradorAleatorio.generarInt(80);
            dimL++;
        }
        
        //Impresion de datos
        /*
        for(int i=0; i<dimL ; i++){
            System.out.println(personas[i].toString());
        }
        */
        
        
        //Variables
        int cantMayores = 0;
        Persona personaMin = new Persona("",2000,0);
        
        
        //Procesado del vector
        for(int i=0; i<dimL ; i++){
            if(personas[i].getEdad() > 65)cantMayores++;
            if(personaMin.getDNI() > personas[i].getDNI())personaMin = personas[i];
        }
        
        //Informacion
        System.out.println("Personas Mayores a 65: "+ cantMayores);
        System.out.println(personaMin.toString());
    }
    
}
