package practica.parcial;

public class PracticaParcial {
    /*
        Se desea representar una empresa de informatica y sus programadores.
         La empresa tiene: nombre,un programador lider y a lo sumo N programadores.
         De los programadores se conoce: nombre,DNI,sueldo basico,cantidad de lineas de codigo por hora
         y lenguaje de preferencia. Adicionalmente , del programador lider se conoce: antiguedad en anios y
         cantidad de proyectos dirigidos.
    
        1.
        Genere las clases necesarias. Provea constructores para iniciar: 
         El programador lider y programadores a partir de toda su informacion;
         La empresa a partir de un nombre,un programador lider y la cantidad maxima de programadores
         (Inicialmente sin tener programadores).
         
        2.
        Implemente los metodos necesarios , en las clases que les corresponda , para :
         A.Dado un programador , agregarlo a la empresa
         B.Calcular el monto total en sueldos a abonar por la empresa,sabiendo que es la suma de los sueldos
         finales de todos los programadores de la empresa(incluido el lider). Para cualquier programador,el sueldo final
         es el sueldo basico adicionado :
            +50.000$ si supera las 200 lineas de codigo por hora.
         Ademas de eso , para el programador lider , se adiciona 10.000$ por anio de aniguedad y 20.000$ por proyectos dirigidos.
         
         C.Dado un monto M,aumentar el sueldo basico de todos los programadores en M(incluido el lider).
         D.Retornar la representacion toString de la empresa,siguiendo el ejemplo:
            "Empresa: nombre 
                Programador Lider : {nombre,DNI,lenguaje de preferencia,sueldoFinal}
                Programador 1 : {nombre,DNI,lenguaje de preferencia,sueldoFinal}
                Monto total en sueldos a abonar por la empresa: ...  "
        3.
        Realice un programa que instancie una empresa informatica con un lider. Agregue algunos programadores 
        a la empresa. Aumente los sueldos basicos de todos los programadores en un monto. Muestre su representacion
        String de la empresa.
    */
    public static void main(String[] args) {
        ProgramadorLider p1 = new ProgramadorLider(23,12,"Fer",2321,10000,123,"Java");
        EmpresaInformatica emp1 = new EmpresaInformatica("Fdasf",p1,25);
        Programador p = new Programador("Fsdfds",213213,10000,234,"Java");
        
        emp1.agregarProgramador(p);
        emp1.aumentarSueldos(10000);
        
        System.out.println(emp1.toString());
    }
    
}
