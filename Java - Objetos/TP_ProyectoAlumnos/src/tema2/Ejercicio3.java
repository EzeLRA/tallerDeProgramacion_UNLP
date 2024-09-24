package tema2;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3 {

    /*
        3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
        cada día se entrevistarán a 8 personas en distinto turno.
            a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
            nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
            personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
            siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
            40 cupos de casting.
        Una vez finalizada la inscripción:
            b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
        NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
        Strings use el método equals.
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int personas = 8;
        
        Persona[][] casting = new Persona[dias][personas];
        
        // Dimensiones Logicas
        int dL_Dias = 0;
        int[] dL_Personas = new int[dias];
        for(int i=0; i<dias ; i++){
            dL_Personas[i] = 0;
        }
        
        // Simulacion
        String nombre = new String(GeneradorAleatorio.generarString(3));
        while((nombre.equals("ZZZ") == false)&&(dL_Dias < dias)){
            while((nombre.equals("ZZZ") == false)&&(dL_Personas[dL_Dias] < personas)){
                casting[dL_Dias][dL_Personas[dL_Dias]] = new Persona(nombre,GeneradorAleatorio.generarInt(1000),GeneradorAleatorio.generarInt(80));
                dL_Personas[dL_Dias] ++;
                nombre = new String(GeneradorAleatorio.generarString(3));
            }
            dL_Dias ++;
        }
        
        // Resultado
        
        for(int i=0; i<dias ; i++){
            for(int j=0; j<personas ; j++){
                System.out.println(casting[i][j].toString() + ";" + i + ";" + j);
            } 
        }
        
        
        
        
    }
    
}
