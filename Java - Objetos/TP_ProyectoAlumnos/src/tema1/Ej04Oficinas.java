package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej04Oficinas {
    /*
        4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
        (1..4). Realice un programa que permita informar la cantidad de personas que
        concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
        edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
        oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
        de piso 9. Al finalizar la llegada de personas, informe lo pedido.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int pisos = 8;
        int oficinas = 4;
        int[][] edificio = new int[pisos][oficinas];
        
        //Inicializar
        for(int i = 0; i < pisos; i++){
            for(int j = 0; j < oficinas; j++)edificio[i][j] = 0;
        }
        
        //Simula la lectura de llegada de personas al edificio
        int p,o;
        p = 1 + GeneradorAleatorio.generarInt(9);
        o = 1 + GeneradorAleatorio.generarInt(4);
        
        while(p < 9){
            
            edificio[p-1][o-1] ++;
            
            p = 1 + GeneradorAleatorio.generarInt(9);
            o = 1 + GeneradorAleatorio.generarInt(4);
        }
        
        //Informa la cantidad personas de cada oficina de cada piso
        for(int i = 0; i < pisos; i++){
            for(int j = 0; j < oficinas; j++)System.out.println("Piso : " + (i+1) + " Oficina : " + (j+1) + " Cant: " + edificio[i][j] );
        }
        
    }
    
}
