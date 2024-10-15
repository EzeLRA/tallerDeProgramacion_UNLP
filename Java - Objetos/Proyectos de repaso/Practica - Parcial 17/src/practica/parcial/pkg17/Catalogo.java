package practica.parcial.pkg17;

public class Catalogo {
    //Atributos
    private int artistasCant,artistasMax;
    private Artista[] artistas;
    
    //Constructor
    public Catalogo(){
        this.artistasCant = 0;
        this.artistasMax = 15;
        this.artistas = new Artista[this.artistasMax];
    }
    
    //Metodos
    public void agregarArtista(Artista a){
        if(this.artistasCant<this.artistasMax){
            this.artistas[this.artistasCant] = a;
            this.artistasCant ++;
        }
    }
    
    public int retornarCategoriaCant(String categ){
        int cant = 0;
        
        if(this.artistasCant>0){
            for(int i=0;i<this.artistasCant;i++){
                if(this.artistas[i].getCategoria().equals(categ)){
                    cant ++;
                }
            }
        }
        
        return cant;
    }
}
