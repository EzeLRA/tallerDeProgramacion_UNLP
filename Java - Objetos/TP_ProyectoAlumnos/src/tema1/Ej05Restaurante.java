package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej05Restaurante {
    /*
        5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
        (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
        de la comida (2) Precio (3) Ambiente.
        Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
        para cada uno de los aspectos y almacene la información en una estructura. Luego
        imprima la calificación promedio obtenida por cada aspecto.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int clientesCant = 5;
        int puntajes = 4;
        int[][] clientesPuntajes = new int[clientesCant][puntajes]; 
        
        int i;
        int j;
        
        //Lectura de calificaciones para cada cliente
        for(i=0; i<clientesCant ; i++){
            for(j=0 ; j<puntajes ; j++){
                //clientesPuntajes[i][j] = Lector.leerInt();
                clientesPuntajes[i][j] = 1 + GeneradorAleatorio.generarInt(11);
            }
        }
        
        //Impresion de promedios para cada categoria
        int sum = 0;
        double prom;
        
        for(i=0; i<puntajes ; i++){
            for(j=0 ; j<clientesCant ; j++){
                sum += clientesPuntajes[j][i];
            }
            prom = (double) sum / clientesCant;
            System.out.println("Categoria " + (i+1) + " : " + prom );
            sum = 0;
        }
        
        
        
        
    }
    
}
