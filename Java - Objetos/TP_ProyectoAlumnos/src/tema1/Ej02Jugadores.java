
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int dimF = 15;
        double [] vectorDouble ;
        //Paso 3: Crear el vector para 15 double 
        vectorDouble = new double[dimF] ;
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double sum,num;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        sum = 0;
        for (i=0 ; i<dimF ; i++){
            num = Lector.leerDouble();
            vectorDouble[i] = num;
            sum =+ num;
        };
        //Paso 7: Calcular el promedio de alturas, informarlo
        double prom = sum / dimF;
        System.out.println("Promedio: " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        double sum2 = 0;
        int cant = 0;
        for(i=0 ; i<dimF ; i++){
            if(prom < vectorDouble[i]){
                sum2 =+ vectorDouble[i];
                cant ++;
            };
        };
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad que superan: " + cant);
        System.out.println("Promedio: " + sum2);
    }
    
}
