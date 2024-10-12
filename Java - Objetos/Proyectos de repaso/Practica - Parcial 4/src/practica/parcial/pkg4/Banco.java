package practica.parcial.pkg4;

public abstract class Banco {
    //Atributos
    private String nombre;
    private int cantidadEmpleados;
    private int cuentasCant;
    private int cuentasMax;
    private Cuenta[] cuentas;
    
    //Constructor
    public Banco(String nombre, int cantidadEmpleados, int cuentasMax) {
        this.nombre = nombre;
        this.cantidadEmpleados = cantidadEmpleados;
        this.cuentasMax = cuentasMax;
        
        this.cuentasCant = 0;
        this.cuentas = new Cuenta[this.cuentasMax];
    }
    
    public abstract boolean agregarCuenta(Cuenta c);
    
    public abstract boolean puedeRecibirTarjeta(int CBU);
    
    public boolean espacioDisponible(){
        return this.cuentasCant < this.cuentasMax;
    }
    
    public void insertarCuenta(Cuenta c){   //Ingresa una cuenta de forma directa
        this.cuentas[this.cuentasCant] = c;
        this.cuentasCant ++;
    }
    
    public Cuenta obtenerCuentaCBU(int CBU){
        Cuenta cuentaDevolver = null;
        boolean cumplido = false;
        
        if(this.cuentasCant > 0){
            int i=0;
            while((cumplido == false)&(i<this.cuentasCant)){
                cumplido = (this.cuentas[i].getCBU() == CBU);
                if(cumplido == true){
                    cuentaDevolver = this.cuentas[i];
                }
                i++;
            }
        }
        
        return cuentaDevolver;
    }
    
    public void depositarDinero(int DNI,double monto){
        boolean cumplido = false;
        
        if(this.cuentasCant > 0){
            int i=0;
            while((cumplido == false)&(i<this.cuentasCant)){
                cumplido = (this.cuentas[i].getDniTitulat() == DNI);
                if(cumplido == true){
                    this.cuentas[i].agregarMonto(monto);
                }
                i++;
            }
        }
    }
    
}
