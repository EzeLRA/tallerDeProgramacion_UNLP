package practica.parcial.pkg16;

public class Productos {
    //Atributos
    private int codigo,etapa;
    private double costoTotal;
    
    //Constructor

    public Productos(int codigo) {
        this.codigo = codigo;
        this.etapa = 1;
        this.costoTotal = 0;
    }
    
    //Metodos

    public int getCodigo() {
        return codigo;
    }
    
    public int getEtapa() {
        return etapa;
    }

    public double getCostoTotal() {
        return costoTotal;
    }
    
    public void incrementarEtapa(){
        this.etapa ++;
    }
    
    public void incrementarCosto(double monto){
        this.costoTotal += monto;
    }

    @Override
    public String toString() {
        return codigo + "," + etapa + "," + costoTotal ;
    }
    
    
    
}
