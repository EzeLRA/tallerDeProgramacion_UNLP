package practica.parcial.pkg15;

public class Fecha {
    //Atributos
    private int dia,mes,anio;

    public Fecha(int dia, int mes, int anio) {
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }

    @Override
    public String toString() {
        return "dia=" + dia + ", mes=" + mes + ", anio=" + anio;
    }
    
    
    
}
