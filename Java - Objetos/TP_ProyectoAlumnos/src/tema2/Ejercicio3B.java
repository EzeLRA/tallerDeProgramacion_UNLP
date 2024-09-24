package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3B {
    /*
        4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
        a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
        y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
        siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
        La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
        casting.
        Una vez finalizada la inscripción:
        b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
        persona a entrevistar en cada turno asignado.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int personas = 8;
        
        Persona[][] casting = new Persona[dias][personas];
        
        // Dimensiones Logicas
        int dia;
        int cupo = 0;
        int limite = dias * personas;
        int[] dL_Personas = new int[dias];
        for(int i=0; i<dias ; i++){
            dL_Personas[i] = 0;
        }
        
        // Simulacion
        String nombre = new String(GeneradorAleatorio.generarString(3));
        dia = GeneradorAleatorio.generarInt(dias);
        
        while((nombre.equals("ZZZ") == false)&&(cupo < limite)){
            if(dL_Personas[dia] < personas){
                casting[dia][dL_Personas[dia]] = new Persona(nombre,GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(80));
                dL_Personas[dia] ++;
            }else{
                System.out.println("Lleno");
            }
            dia = GeneradorAleatorio.generarInt(dias);
            nombre = new String(GeneradorAleatorio.generarString(3));
            cupo ++;
        }
        
        // Resultado
        for(int i=0; i<dias ; i++){
            if(dL_Personas[i] > 0){
                for(int j=0; j<dL_Personas[i] ; j++){
                    System.out.println(casting[i][j].toString() + ";" + i + ";" + j);
                }
            }else{
                System.out.println("Vacio");
            }
        }
       
    }
    
}
