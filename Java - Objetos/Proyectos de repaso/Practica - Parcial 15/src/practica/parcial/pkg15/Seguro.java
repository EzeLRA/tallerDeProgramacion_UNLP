package practica.parcial.pkg15;

public class Seguro {
    //Atributos
    private int polizasCant,polizasMax;
    private Poliza[] polizas;
    
    //Constructor
    public Seguro(){
        this.polizasCant = 0;
        this.polizasMax = 200;
        this.polizas = new Poliza[this.polizasMax];
    }
    
    //Metodos
    public void agregarPoliza(Poliza p){
        if(this.polizasCant<this.polizasMax){
            this.polizas[this.polizasCant] = p;
            this.polizasCant++;
        }
    }
    
    public String retornarPolizasDatosCliente(int DNI){
        String cad = "";
        
        if(this.polizasCant>0){
            for(int i=0;i<this.polizasCant;i++){
                if(this.polizas[i].retornarDNICliente() == DNI){
                    cad += this.polizas[i].toString() + "\n";
                }
            }
        }
        
        return cad;
    }
    
    public void aumentarCuotasPolizas(double porcentaje){
        if(this.polizasCant>0){
            for(int i=0;i<this.polizasCant;i++){
                this.polizas[i].aumentoPorcentajeCuota(porcentaje);
            }
        }
    }
    
    public int polizasVencidas(int mes,int anio){
        int cant = 0;
        if(this.polizasCant>0){
            for(int i=0;i<this.polizasCant;i++){
                if(this.polizas[i].fechaPorVencer(mes, anio)){
                    cant ++;
                }
            }
        }
        return cant;
    }
}
