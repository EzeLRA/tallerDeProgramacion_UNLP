program ejercicio6;
{
	La catedra de Algoritmos y Programacion 1 necesita un sistema para inscribir a todos los alumnos que vayan a cursar
	en el proximo semestre. De cada alumno se desea registra su nombre,legajo y cantidad de autoevaluaciones aprobadas
	(inicialmente cero).
	
	Implemente un programa en Pascal con los siguientes modulos:
	
	A. Un modulo que realice el registro de los alumnos almacenando toda la informacion en una estructura que permita
	la busqueda eficiente de alumnos por legajo. La carga finaliza al leer el alumno con legajo igual a cero.
	
	B. Un modulo que reciba la estructura generada en A. , un numero de legajo y aumente en una unidad la cantidad de 
	autoevaluaciones aprobadas para el alumno.
	
	C. Un modulo que reciba la estructura generada en A. y devuelva una lista ordenada por nombre de los alumnos que 
	aprobaron al menos tres autoevaluaciones.
}

type
	
	alumno = record
		nombre : String;
		legajo : integer;
		a_EvaluacionesApro : integer;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : alumno;
		HI : arbol;
		HD : arbol;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : alumno;
		sig : lista;
	end;
	
procedure leerAlumnos(var al:alumno);
begin
	readln(al.legajo);
	if(al.legajo > 0)then begin
		readln(al.nombre);
		readln(al.a_EvaluacionesApro);
	end;
end;

procedure insertarElem(var a:arbol; al:alumno);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := al;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.legajo > al.legajo)then
			insertarElem(a^.HI,al)
		else 
			insertarElem(a^.HD,al);
	end;
end;

//MODULO A

procedure cargarAlumnos(var a:arbol);
var
	al:alumno;
begin
	leerAlumnos(al);
	while(al.legajo > 0)do begin
		insertarElem(a,al);
		leerAlumnos(al);
	end;
end;

//MODULO B

procedure modificarEvalua_Legajo(var a:arbol; legajo:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.legajo > legajo)then
			modificarEvalua_Legajo(a^.HI,legajo)
		else if(a^.dat.legajo < legajo)then
			modificarEvalua_Legajo(a^.HD,legajo)
		else
			a^.dat.a_EvaluacionesApro := a^.dat.a_EvaluacionesApro + 1;
	end;
end;

//MODULO C

procedure insertarOrdenado(var l:lista; alu:alumno);
var
	nuevo,act,ant : lista;
begin
	new(nuevo);
	nuevo^.dat := alu;
	act := l;
	ant:= act;
	while(act <> nil)and(act^.dat.nombre < alu.nombre)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = ant)then
		l := nuevo
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure generarLista(var l:lista; a:arbol);
begin
	if(a <> nil)then begin
		if(a^.dat.a_EvaluacionesApro >= 3)then
			insertarOrdenado(l,a^.dat);
		generarLista(l,a^.HI);
		generarLista(l,a^.HD);
	end;
end;

//MODULO OPCIONAL
procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		writeln(a^.dat.legajo);
		writeln(a^.dat.nombre);
		writeln(a^.dat.a_EvaluacionesApro);
		imprimirArbol(a^.HD);
	end;
end;


VAR
	a : arbol;
	legajo : integer;
	l : lista;
BEGIN
	a := nil;
	cargarAlumnos(a);	//A
	
	imprimirArbol(a);
	writeln;
	
	readln(legajo);
	modificarEvalua_Legajo(a,legajo);	//B
	
	imprimirArbol(a);
	
	
	l := nil;
	generarLista(l,a);		//C
END.
