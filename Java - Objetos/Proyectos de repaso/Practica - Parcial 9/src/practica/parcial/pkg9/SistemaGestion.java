package practica.parcial.pkg9;

public class SistemaGestion {
    //Atributos
    private int diasMax;
    private Turno[] diasAtencionTurnos;

    public SistemaGestion() {
        this.diasMax = 5;
        this.diasAtencionTurnos = new Turno[this.diasMax];
        
        for(int i=0;i<this.diasMax;i++){
            this.diasAtencionTurnos[i] = new Turno();
        }
    }
    
    public void agregarPacienteDiaTurno(int dia,Paciente p){
        this.diasAtencionTurnos[dia].agregarPaciente(p);
    }
    
    public String cancelarTurnosDia(int dia){
        String cad = "Aviso de cancelacion de turno para los siguientes pacientes: " + this.diasAtencionTurnos[dia].retornarNombresPacientes();
        this.diasAtencionTurnos[dia].anularTurnosReservados();
        return cad;
    }
    
    public double retornarMontoTotal(){
        double total = 0;
        for(int i=0;i<this.diasMax;i++){
            total += this.diasAtencionTurnos[i].retornarMontoRecaudadoDia();
        }
        return total;
    }
    
    
}
