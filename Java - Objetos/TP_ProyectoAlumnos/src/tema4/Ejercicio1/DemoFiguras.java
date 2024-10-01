package tema4.Ejercicio1;

public class DemoFiguras {

    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo(3.0,4.0,"Azul","Negro");
        Circulo circulo = new Circulo(5.0,"Rojo","Negro");
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        triangulo.despintar();
        circulo.despintar();
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
    }

}
