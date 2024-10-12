package practica.parcial.pkg4;

public class Cuenta {
    //Atributos
    private int CBU;
    private String alias;
    private int dniTitulat;
    private String moneda;
    private double monto;
    
    //Constructor
    public Cuenta(int CBU, String alias, int dniTitulat, String moneda) {
        this.CBU = CBU;
        this.alias = alias;
        this.dniTitulat = dniTitulat;
        this.moneda = moneda;
        this.monto = 0;
    }
    
    //Metodos
    public int getCBU() {
        return CBU;
    }

    public int getDniTitulat() {
        return dniTitulat;
    }

    public String getMoneda() {
        return moneda;
    }
    
    public void agregarMonto(double monto){
        this.monto += monto;
    }

    public double getMontoDispone() {
        return monto;
    }
    
    
    
}
