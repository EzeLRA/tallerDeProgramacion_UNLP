/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

/**
 *
 * @author vsanz
 */
public class Ej03QueImprimeB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        //Creacion y asignacion
        Persona p1; 
        Persona p2;
        p1 = new Persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new Persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        p1 = p2;
        p1.setEdad( p1.getEdad() + 1 );
        System.out.println(p2.toString());
        System.out.println(p1.toString());
        System.out.println( (p1 == p2) );
        
        //Uso de constructor
        Persona p3 = new Persona("Ezequiel",12345,25);
        
        //Ejercicio 1 - Practica 2
    
        String nombre;
        int dni;
        int edad;
        
        //Alternativa 1
        
        Persona p4 = new Persona();
        
        nombre = Lector.leerString();
        p4.setNombre(nombre);
        
        dni = Lector.leerInt();
        p4.setDNI(dni);
           
        edad = Lector.leerInt();
        p4.setEdad(edad);
        
        System.out.println(p4.toString());
        
        //Alternativa 2
        
        nombre = Lector.leerString();
        
        dni = Lector.leerInt();
           
        edad = Lector.leerInt();
        
        Persona p5 = new Persona(nombre,dni,edad);
        
        System.out.println(p5.toString());
    }
    
    
    
}
