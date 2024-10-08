/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;



/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 "Herbert Schildt", "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               "John Horton", "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        
        Autor unAutor = new Autor("fds","asd","afd");
        
        Libro libro3= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               unAutor, "978-1512108347");
    
        //Si se quisiera cambiar el nombre autor se debe hacerlo desde la clase libro y la clase autor
        System.out.println(libro3.toString());
        System.out.println("Informacion Autor " + libro3.getPrimerAutor().toString());
        
    }
    
}
