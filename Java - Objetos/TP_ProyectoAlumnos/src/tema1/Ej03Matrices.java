/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int fil,col;
        fil = 5; col = 5;
        int [][] matrizInt = new int[fil][col];
        
        int i,j;
        
        for(i=0; i<fil ; i++){
            for(j=0; j<col ; j++){
                matrizInt[i][j] = GeneradorAleatorio.generarInt(10);
            }
        }
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for(i=0; i<fil ; i++){
            for(j=0; j<col ; j++){
                System.out.print(matrizInt[i][j]);
            };
            System.out.println("");
        }
        
        /*
        
        System.out.println("");
                
        for(i=0; i<fil ; i++){
            for(j=0; j<col ; j++){
                System.out.print(matrizInt[j][i]);
            };
            System.out.println("");
        };

        */
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sum = 0;
        for(i=0; i<col ; i++){
            //System.out.println(matrizInt[1][i]);
            sum += matrizInt[1][i];
        }
        System.out.println("Total: " + sum);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vector = new int[5];
        
        int aux = 0;
        
        for(i=0; i<fil ; i++){
            for(j=0; j<col ; j++){
                aux += matrizInt[j][i];
            }
            vector[i] = aux;
            aux = 0;
        }
        
        for(i=0; i<5 ; i++){
            System.out.print(vector[i] + " ");
        }
        System.out.print("");
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        boolean encontro = false;
        int posFil = 0;
        int posCol = 0;
        int numLeido = Lector.leerInt();
        
        i = 0; j = 0;
        while((encontro != true)&&(i<fil)){
            while((encontro != true)&&(j<col)){
                if(numLeido == matrizInt[i][j]){
                    encontro = true;
                    posFil = i; posCol = j;
                }
                j++;
            }
            i++;
            j = 0;
        }
        
        if(encontro == true){
            System.out.println("Fila: " + posFil + "Columna: " + posCol);
        }else{
            System.out.println("No se encontro");
        }
    }
}
