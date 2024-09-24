package tema2;
import PaqueteLectura.*;

public class Ejercicio4 {
    /*
        Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
        encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
        valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
        nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
        partido sabe responder a los siguientes mensajes:
       
        Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
        el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
        nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
        - Para cada partido, armar e informar una representación String del estilo:
        {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
        - Calcular e informar la cantidad de partidos que ganó River.
        - Calcular e informar el total de goles que realizó Boca jugando de local.
    */
    
    public static void main(String[] args) {
        String local,visitante;
        int dimL = 0,golesL,golesV;
        int partidosCant = 20;
        
        Partido[] partidos = new Partido[partidosCant];
        
        // Lectura
        visitante = Lector.leerString();
        while((visitante.equals("ZZZ") != true)&&(dimL<partidosCant)){
            local = Lector.leerString();
            golesL = Lector.leerInt();
            golesV = Lector.leerInt();
            
            partidos[dimL] = new Partido(local,visitante,golesL,golesV);
            
            dimL ++;
            visitante = Lector.leerString();
        }
        
        // Parametros
        int RiverVictorias = 0;
        int golesBoca = 0;
        
        // Procesamiento
        for(int i=0 ; i<dimL ; i++){
            System.out.println("Local: " + partidos[i].getLocal() + " " + partidos[i].getGolesLocal() + "Visitante: " + partidos[i].getVisitante() + " " + partidos[i].getGolesVisitante());
            if(partidos[i].getGanador().equals("River"))RiverVictorias ++;
            if(partidos[i].getLocal().equals("Boca"))golesBoca += partidos[i].getGolesLocal();
        }
        System.out.println(RiverVictorias);
        System.out.println(golesBoca);
    }
    
}
