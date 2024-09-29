package tema3;

public class Estante {
    //Atributos
    private int capacidadMax;  //DimF
    private int espacioOcupado ;    //DimL
    private Libro[] libros ;
    private boolean estanteLleno ;
    
    //Constructores
    public Estante(){
        espacioOcupado = 0;
        capacidadMax = 20;
        estanteLleno = false;
        libros = new Libro[capacidadMax];
    }
    
    public Estante(int cMax){
        espacioOcupado = 0;
        capacidadMax = cMax;
        estanteLleno = false;
        libros = new Libro[capacidadMax];
    }
    
    //Metodos
    public int getEspacioOcupado(){
        return espacioOcupado;
    }
    
    public boolean getEstanteLleno(){
        return estanteLleno;
    }
    
    public void ingresarLibro(Libro L){
        if(estanteLleno != true){
            libros[espacioOcupado] = new Libro(L.getTitulo(),L.getEditorial(),L.getAñoEdicion(),L.getPrimerAutor(),L.getISBN(),L.getPrecio());
            espacioOcupado ++;
            estanteLleno = (espacioOcupado >= capacidadMax);
        }
    }
    
    public Libro encontrarLibro(String Titulo){
        /*
            CONSULTAR SOBRE LDevolver
        */
        
        
        Libro LDevolver ;
        
        boolean encontrado = false;
        int i=0;
        while((i<espacioOcupado)&(encontrado == false )){
            encontrado = (libros[i].getTitulo().equals(Titulo));
            i++;
        }
        
        if(encontrado == true){
            LDevolver = new Libro(
                        libros[i].getTitulo(),
                        libros[i].getEditorial(),
                        libros[i].getAñoEdicion(),
                        libros[i].getPrimerAutor(),
                        libros[i].getISBN(),
                        libros[i].getPrecio()
            );
        }else{
            LDevolver = null;
        }
        
        return LDevolver;
    }
    
    
}
