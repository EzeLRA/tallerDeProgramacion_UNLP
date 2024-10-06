package tema4.Ejercicio5;

public class Dibujo{
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=5;
    
    //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        this.titulo = titulo;
        this.guardadas = 0;
        this.vector = new Figura[this.capacidadMaxima];
    }
    
    //agrega la figura al dibujo
    public void agregar(Figura f){
        if(this.estaLleno() != true){
            this.vector[this.guardadas] = f;
            this.guardadas ++;
            System.out.println("+La figura "+ f.toString() + " se ha guardado");
        }else{
            System.out.println("-La figura no se pudo agregar");
        }
    }

    //calcula el área del dibujo:
    //suma de las áreas de sus figuras
    public double calcularArea(){
        double areaTotal = 0;
        for(int i=0; i<this.guardadas ; i++){
            areaTotal += this.vector[i].calcularArea();
        }
        return areaTotal;
    }

    //imprime el título, representación
    //de cada figura, y área del dibujo
    public void mostrar(){
        System.err.println("Titulo del dibujo:" + this.titulo);
        for(int i=0; i<this.guardadas ; i++){
            System.out.println(this.vector[i].toString());
        }
    }
    
    //retorna está lleno el dibujo
    public boolean estaLleno() {
        return (guardadas == capacidadMaxima);
    }
    
}