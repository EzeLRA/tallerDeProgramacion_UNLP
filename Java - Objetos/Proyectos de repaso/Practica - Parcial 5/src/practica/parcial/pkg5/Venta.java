package practica.parcial.pkg5;

public class Venta {
    //Atributos
    private int DNI_Cliente;
    private double Mcuadrados_Cargados;
    private double montoAbonado;
    private String metodoPago;
    
    //Constructor
    public Venta(int DNI_Cliente, double Mcuadrados_Cargados, double montoAbonado, String metodoPago) {
        this.DNI_Cliente = DNI_Cliente;
        this.Mcuadrados_Cargados = Mcuadrados_Cargados;
        this.montoAbonado = montoAbonado;
        this.metodoPago = metodoPago;
    }
    
    //Metodos
    public double getMcuadrados_Cargados() {
        return Mcuadrados_Cargados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    @Override
    public String toString() {
        return "DNI del Cliente=" + DNI_Cliente + ", cantidad de M3=" + Mcuadrados_Cargados + ", monto abonado=" + montoAbonado + ";";
    }
    
    
    
}
