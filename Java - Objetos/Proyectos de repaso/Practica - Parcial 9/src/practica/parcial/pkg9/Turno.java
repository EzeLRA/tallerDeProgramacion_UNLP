package practica.parcial.pkg9;

public class Turno {
    //Atributos
    private int pacientesCant;
    private int pacientesMax;
    private Paciente[] pacientes;

    //Constructor
    public Turno() {
        this.pacientesCant = 0;
        this.pacientesMax = 6;
        this.pacientes = new Paciente[this.pacientesMax];
    }
    
    //Metodos
    public void agregarPaciente(Paciente p){
        if(this.pacientesCant<this.pacientesMax){
            this.pacientes[this.pacientesCant] = p;
            this.pacientesCant ++;
        }
    }
    
    public void anularTurnosReservados(){
        for(int i=0;i<this.pacientesCant;i++){
            this.pacientes[i] = null;
        }
        this.pacientesCant = 0;
    }
    
    public String retornarNombresPacientes(){
        String cad = "";
        if(this.pacientesCant>0){
            for(int i=0;i<this.pacientesCant;i++){
                cad += this.pacientes[i].getNombre() + ",";
            }
        }else{
            cad += "Sin turnos reservados";
        }
        return cad;
    }
    
    public double retornarMontoRecaudadoDia(){
        double totalDia = 0;
        if(this.pacientesCant>0){
            for(int i=0;i<this.pacientesCant;i++){
                totalDia += this.pacientes[i].getCostoAbonar();
            }
        }
        return totalDia;
    }
    
}
