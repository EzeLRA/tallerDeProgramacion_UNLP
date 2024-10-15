package practica.parcial.pkg15;

public class Sistema {
    //Atributos
    private int categoriasMax;
    private Seguro[] rubrosSeguros;
    
    //Constructor
    public Sistema(){
        this.categoriasMax = 10;
        this.rubrosSeguros = new Seguro[this.categoriasMax];
        
        for(int i=0;i<this.categoriasMax;i++){
            this.rubrosSeguros[i] = new Seguro();
        }
    }
    
    //Metodos
    public void agregarPolizaRubro(Poliza p,int categoria){
        this.rubrosSeguros[categoria].agregarPoliza(p);
    }
    
    public String infoCliente(int DNI){
        String cad = "";
        
        for(int i=0;i<this.categoriasMax;i++){
            cad += "Rubro " + i + " : \n" + this.rubrosSeguros[i].retornarPolizasDatosCliente(DNI);
        }
        
        return cad;
    }
    
    public void aumentarCuotas(double porcentaje,int rubro){
        this.rubrosSeguros[rubro].aumentarCuotasPolizas(porcentaje);
    }
    
    public int polizasPorVencer(int mes,int anio){
        int cant = 0;
        
        for(int i=0;i<this.categoriasMax;i++){
            cant += this.rubrosSeguros[i].polizasVencidas(mes,anio);
        }
        
        return cant;
    }
    
}
