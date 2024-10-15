package practica.parcial.pkg17;

public class PracticaParcial17 {

    public static void main(String[] args) {
        Catalogo c = new Catalogo();
        c.agregarArtista(new Artista("asdf","Pintura"));
        c.agregarArtista(new Artista("hehre","Pintura"));
        System.out.println(c.retornarCategoriaCant("Pintura"));
    }
    
}
