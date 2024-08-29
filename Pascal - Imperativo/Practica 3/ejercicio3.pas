program ejercicio3;
{
	Implementar un programa que contenga:
	
	a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
	 Informática y los almacene en una estructura de datos. La información que se lee es legajo,
	 código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
	 generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
	 guardarse los finales que rindió en una lista.
	
	b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
	 legajo impar.
	
	c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
	 su cantidad de finales aprobados (nota mayor o igual a 4).
	
	d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
	 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

type
	
	finalRendido = record
		codigoMateria: integer;
		fecha: integer;
		nota: integer;
	end;
	
	listaFinales =^ nodo;
	nodo = record
		dat: finalRendido;
		sig: listaFinales;
	end;
	
	arbolAlumnos =^ nodoA;
	nodoA = record
		legajo: integer;
		listaF: listaFinales;
		HI:arbolAlumnos;
		HD:arbolAlumnos;
	end;


//Modulo A

procedure cargarFinales(var l:listaFinales; f:finalRendido);
var
	n:listaFinales;
begin
	new(n);
	n^.dat := f;
	n^.sig := l;
	l:=n;
end;

procedure insertarElem(var a:arbolAlumnos; legajo:integer; f:finalRendido);
begin
	if(a = nil)then begin
		new(a);
		a^.legajo := legajo;
		a^.listaF := nil;
		cargarFinales(a^.listaF,f);
		a^.HI:=nil;
		a^.HD:=nil;
	end else if(a^.legajo < legajo)then insertarElem(a^.HD,legajo,f)
	else if(a^.legajo > legajo)then insertarElem(a^.HI,legajo,f)
	else cargarFinales(a^.listaF,f);
end;

procedure leerFinal(var le:integer; var f:finalRendido);
begin
	readln(le);
	if(le <> 0)then begin
		readln(f.codigoMateria);
		readln(f.fecha);
		readln(f.nota);
	end;
end;

procedure leerFinales(var a:arbolAlumnos);
var
	legajo:integer;
	exam:finalRendido;
begin
	leerFinal(legajo,exam);
	while(legajo <> 0)do begin
		insertarElem(a,legajo,exam);
		leerFinal(legajo,exam);
	end;
end;


//Modulo Opcional

procedure impresionLista(l:listaFinales);
begin
	while(l <> nil)do begin
		writeln(l^.dat.codigoMateria);
		writeln(l^.dat.fecha);
		writeln(l^.dat.nota);
		writeln;
		l:=l^.sig;
	end;
end;

procedure imprimirArbol(a:arbolAlumnos);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		writeln(a^.legajo);
		impresionLista(a^.listaF);
		imprimirArbol(a^.HD);
	end;
end;

//Modulo B

procedure retornarLegajosImpares(a:arbolAlumnos; var cant:integer);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		if((a^.legajo MOD 2)=1)then cant:= cant + 1;
		imprimirArbol(a^.HD);
	end;
end;

//Modulo C

function contarFinalesA(l:listaFinales):integer;
var
	cant:integer;
begin
	cant:=0;
	while(l <> nil)do begin
		if(l^.dat.nota >= 4)then cant:=cant+1;
		l:=l^.sig;
	end;
	contarFinalesA:=cant;
end;

procedure informarFinalesAprobados(a:arbolAlumnos);
begin
	if(a <> nil)then begin
		informarFinalesAprobados(a^.HI);
		writeln(a^.legajo);
		writeln(contarFinalesA(a^.listaF));
		informarFinalesAprobados(a^.HD);
	end;
end;

//Modulo E

function promedio(l:listaFinales):real;
var
	cant,notas:integer;
begin
	notas:=0;
	cant:=0;
	while(l <> nil)do begin
		notas := notas + l^.dat.nota; 
		cant:=cant+1;
		l:=l^.sig;
	end;
	
	if(cant > 0)then promedio := notas / cant
	else promedio := 0;
end;

procedure alumnosPromedioMayorA(a:arbolAlumnos; prom:real);
var
	promAlu : real;
begin
	if(a <> nil)then begin
		alumnosPromedioMayorA(a^.HI,prom);
		promAlu := promedio(a^.listaF);
		if(prom < promAlu)then begin
			writeln(a^.legajo);
			writeln(promAlu);
		end;
		alumnosPromedioMayorA(a^.HD,prom);
	end;
end;




VAR
	a:arbolAlumnos;
	cantImp:integer;
	prom:real;
BEGIN

	a:=nil;
	cantImp:=0;
	
	leerFinales(a);		//A
	
	retornarLegajosImpares(a,cantImp);	//B
	writeln(cantImp);
	
	informarFinalesAprobados(a);	//C
	
	readln(prom);					//D
	alumnosPromedioMayorA(a,prom);
	
END.
