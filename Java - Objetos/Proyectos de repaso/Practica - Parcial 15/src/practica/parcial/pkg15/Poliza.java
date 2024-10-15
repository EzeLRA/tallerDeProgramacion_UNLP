package practica.parcial.pkg15;

public class Poliza extends Cliente {
    //Atributos
    private double montoAsegurado,valorCuotaMensual;
    private Fecha fechaComienzo,fechaFin;

    //Constructor
    public Poliza(double montoAsegurado, double valorCuotaMensual, Fecha fechaComienzo, Fecha fechaFin, int DNI, String nombre, String apellido) {
        super(DNI, nombre, apellido);
        this.montoAsegurado = montoAsegurado;
        this.valorCuotaMensual = valorCuotaMensual;
        this.fechaComienzo = fechaComienzo;
        this.fechaFin = fechaFin;
    }
    
    
    //Metodos
    public int retornarDNICliente(){
        return super.getDNI();
    }
    
    public void aumentoPorcentajeCuota(double porcentaje){
        this.valorCuotaMensual *= porcentaje;
    }

    public boolean fechaPorVencer(int mes,int anio){
        boolean cumple = false;
        
        if((this.fechaFin.getMes() == mes)&(this.fechaFin.getAnio() == anio)){
            cumple = true;
        }
        
        return cumple;
    }
    
    @Override
    public String toString() {
        return "Poliza{" + "montoAsegurado=" + montoAsegurado + ", valorCuotaMensual=" + valorCuotaMensual + ", fechaComienzo=" + fechaComienzo.toString() + ", fechaFin=" + fechaFin.toString() + super.toString() + '}';
    }
    
    
    
}
