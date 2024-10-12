package practica.parcial.pkg4;

public class BancoDigital extends Banco {
    //Atributos
    private String direccionWeb;

    //Constructor
    public BancoDigital(String direccionWeb, String nombre, int cantidadEmpleados, int cuentasMax) {
        super(nombre, cantidadEmpleados, cuentasMax);
        this.direccionWeb = direccionWeb;
    }
    
    //Metodos
    public boolean agregarCuenta(Cuenta c){
        boolean sePudo = false;
        
        if(super.espacioDisponible()){
            super.insertarCuenta(c);
            sePudo = true;
        }
        
        return sePudo;
    }
    
    public boolean puedeRecibirTarjeta(int CBU){
        boolean cumple = false;
        Cuenta cuentaProcesar = super.obtenerCuentaCBU(CBU);
        if(cuentaProcesar != null){
            if((cuentaProcesar.getMoneda().equals("Peso"))&(cuentaProcesar.getMontoDispone()>100000)){
                cumple = true;
            }
        }
        return cumple;
    }
    
    
}
