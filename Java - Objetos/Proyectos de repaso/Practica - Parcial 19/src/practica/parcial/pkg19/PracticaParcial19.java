package practica.parcial.pkg19;

public class PracticaParcial19 {

    public static void main(String[] args) {
        SubsidioBienes s1 = new SubsidioBienes(10,"dafsdf","asfadsf",31);
        SubsidioEstadia s2 = new SubsidioEstadia("asfdsf",100.23,100,105.2,"sdfdsf","sfsdf",23);
        
        s1.agregarBien(new Bien("dsafsdf",10,200));
        s1.agregarBien(new Bien("drgg32rsdf",5,200));
    
        System.out.println(s1.toString());
        System.out.println(s2.toString());
    }
    
}
