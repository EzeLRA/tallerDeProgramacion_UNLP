program ejercicio1.pas;
{ Implementar un programa que procese la informacion de los alumnos de la Facultad de Informatica.
* 
* A.Implementar un modulo que lea y retorne, en una estructura adecuada, la informacion de todos los alumnos. De cada
*    alumno se lee su apellido,numero de alumno,año de ingreso,cantidad de materias aprobadas(a lo sumo 36)y nota obtenida(sin contar los aplazos)
* 	 en cada una de las materias aprobadas. La lectura finaliza cuando se ingresa el numero de alumno 11111, el cual debe procesarse.
* 
* 	""Se asume que solo se leeran materias aprobadas sin algun "salteo" o espacio entre si que deba ser considerado en su proceso de lectura""
* 
* 
* B.Implementar un modulo que reciba la estructura generada en el inciso A. y retorne numero de alumno y promedio de cada alumno.
* 
* C.Analizar: ¿Que cambios requieren los puntos A y B, si no se sabe de antemano la cantidad de materias aprobadas de cada alumno,
* 	 y si ademas se desean registrar los aplazos? ¿Como puede diseñarse una solucion modularizada que requiera la menor cantidad de cambios?
* 
* 	Respuesta: Implicaria que el tipo de estructura en el que se guardan las notas sea una lista y que su recorrido o procesamiento sea completo
* 	 teniendo en cuenta que se registran los aplazos.(Lista Desordenada)
* 	 La solucion del mismo en el codigo , seria el uso de una lista para registrar las notas de cada materia y para la lectura de las notas el
* 	 uso de un procedimiento que recorra la lista contando las materias aprobadas e informe el promedio con la suma de las notas aprobadas que encuentre para el calculo del mismo.
* 
* }

const
	dimF = 36;

type
	
	materiasTotal = 1..dimF;
	nota = 6..10;
	
	materiasCant = array[materiasTotal]of nota;	// C El uso de lista para registrar todas las notas de cada materia incluyendo los aplazos
	
	alumno = record
		apellido : String;
		numero : integer;
		anioIngreso : integer;
		materiasAprobadasCant : materiasTotal;	//dimL
		materiasAprobadasNotas : materiasCant;
	end;
	
	listaAlumnos =^ nodo;
	nodo = record
		dat : alumno;
		sig : listaAlumnos;
	end;
	
procedure leerMateriasAprobadas(var m:materiasCant; var mCant:materiasTotal);
var
	i:materiasTotal;
begin
	for i:=1 to mCant do begin
		readln(m[i]);
	end;
end;

procedure leerAlumno(var a:alumno);
begin
	readln(a.apellido);
	readln(a.numero);
	readln(a.anioIngreso);
	readln(a.materiasAprobadasCant);
	leerMateriasAprobadas(a.materiasAprobadasNotas,a.materiasAprobadasCant);		//C agregarAdelante() para el uso de lista
end;

procedure agregarAdelante(var l:listaAlumnos; a:alumno);
var
	nuevo:listaAlumnos;
begin
	new(nuevo);
	nuevo^.dat := a;
	nuevo^.sig := l;
	l := nuevo;
end;

//A

procedure generarLista(var L:listaAlumnos);
var
	a:alumno;
begin
	L:=nil;
	repeat
		leerAlumno(a);
		agregarAdelante(L,a);
	until(a.numero = 11111);
end;

//B

procedure informarPromedio(mCant:materiasTotal;m:materiasCant);
var
	i,total:integer;
	prom:real;
begin
	prom := 0;
	total := 0;
	for i:=1 to mCant do begin
		total := total + m[i];
	end;
	prom := total / mCant;
	writeln(prom);
end;

procedure informarLista(L:listaAlumnos);
begin
	while(L <> nil)do begin
		writeln(L^.dat.numero);
		informarPromedio(L^.dat.materiasAprobadasCant,L^.dat.materiasAprobadasNotas);
		L := L^.sig;
	end;
end;


VAR
	L:listaAlumnos;
BEGIN
	generarLista(L);
	informarLista(L);
END.


