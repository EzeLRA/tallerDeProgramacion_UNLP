package practica.parcial.pkg16;

public class Sector {
    //Atributos
    private String nombre;
    private int empleadosCant,productosCant,productosMax,empleadosMax;
    private Empleado jefeSector;
    private Empleado[] empleados;
    private Productos[] productos;
    
    //Constructor
    public Sector(String nombre, int productosMax) {
        this.nombre = nombre;
        this.productosMax = productosMax;
        this.productosCant = 0;
        this.empleadosCant = 0;
        this.empleadosMax = 50;
        
        this.empleados = new Empleado[this.empleadosMax];
        this.productos = new Productos[this.productosMax];
    }
    
    //Metodos
    public void agregarEmpleado(Empleado emp,boolean isJefe){
        if(isJefe){
            this.jefeSector = emp;
        }else if(this.empleadosCant<this.empleadosMax){
            this.empleados[this.empleadosCant] = emp;
            this.empleadosCant ++;
        }
    }
    
    public void agregarProducto(Productos p){
        if(this.productosCant<this.productosMax){
            this.productos[this.productosCant] = p;
            this.productosCant ++;
        }
    }
        
    
    public double montoTotalEtapa(int etapa){
        double monto = 0;
        
        if(this.productosCant>0){
            for(int i=0;i<this.productosCant;i++){
                if(this.productos[i].getEtapa() == etapa){
                    monto += this.productos[i].getCostoTotal();
                }
            }
        }
        
        return monto;
    }
    
    public void cambiarEtapa(int cod,double monto){
        if(this.productosCant>0){
            boolean pude = false;
            int i=0;
            while((i<this.productosCant)&(pude == false)){
                if(this.productos[i].getCodigo() == cod){
                    this.productos[i].incrementarEtapa();
                    this.productos[i].incrementarCosto(monto);
                    pude = true;
                }
                i++;
            }
        }
    }

    @Override
    public String toString() {
        String cad = "Sector: " + nombre + " \n";
        cad += "Jefe del sector : " + this.jefeSector.toString() + "\n";
        cad += "Cantidad de productos en proceso : " + this.productosCant + "\n";
        cad += "Costo de productos terminados : " + this.montoTotalEtapa(5) + "\n";
        cad += "Trabajadores con antiguedad mayor a 10 : " + "\n";
        
        for(int i=0;i<this.empleadosCant;i++){
            if(this.empleados[i].getAntiguedad() > 10){
                cad += this.empleados[i].toString() + "\n";
            }
        }
        
        return cad;
    }
    
    
    
}
