package tema3;

public class Ejercicio3 {

    public static void main(String[] args) {
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 "Herbert Schildt", "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               "John Horton", "978-1512108347");
        Estante estante1 = new Estante();
        
        estante1.ingresarLibro(libro1);
        estante1.ingresarLibro(libro2);
        
        System.out.println(estante1.getEspacioOcupado());
        
        Libro LibroAux = estante1.encontrarLibro("Java");
        
        if(LibroAux != null){
            System.out.println(LibroAux.toString());
        }else{
            System.out.println("No se encontro el libro");
        }
        
        Estante estante2 = new Estante(5);
        
        estante2.ingresarLibro(libro1);
        estante2.ingresarLibro(libro2);
        
        System.out.println(estante2.getEspacioOcupado());
        
        
        
    }
    
}
