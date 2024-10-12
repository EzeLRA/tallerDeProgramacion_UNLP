package practica.parcial.pkg4;

public class BancoTradicional extends Banco{
    //Atributos
    private String direccion;
    private String localidad;
    private int cuentasEnDolares;
    private int cuentasEnDolaresMax;
    
    //Constructor
    public BancoTradicional(String direccion, String localidad, String nombre, int cantidadEmpleados, int cuentasMax) {
        super(nombre, cantidadEmpleados, cuentasMax);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cuentasEnDolares = 0;
        this.cuentasEnDolaresMax = 100;
    }
    
    //Metodos
    public boolean agregarCuenta(Cuenta c){
        boolean sePudo = false;
        
        if(super.espacioDisponible()){
            if((this.cuentasEnDolares < this.cuentasEnDolaresMax)&(c.getMoneda().equals("Dolar"))){
                super.insertarCuenta(c);
                this.cuentasEnDolares++;
            }else if(c.getMoneda().equals("Dolar") != true){
                super.insertarCuenta(c);
            }
            sePudo = true;
        }
        
        return sePudo;
    }
    
    public boolean puedeRecibirTarjeta(int CBU){
        boolean cumple = false;
        Cuenta cuentaProcesar = super.obtenerCuentaCBU(CBU);
        if(cuentaProcesar != null){
            if((cuentaProcesar.getMoneda().equals("Dolar"))&(cuentaProcesar.getMontoDispone()>500)
                    |(cuentaProcesar.getMoneda().equals("Peso"))&(cuentaProcesar.getMontoDispone()>70000)){
                cumple = true;
            }
        }
        return cumple;
    }
    
}
