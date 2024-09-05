program ejercicio1;
{
	Una escuela secundaria organiza un concurso de atletismo entre todos sus alumnos. Cada alumno debe correr 400 metros
	 y se le toma el tiempo en minutos (un numero real) que llevo realizar el recorrido. De los alumnos se desea registrar su
	 nombre , DNI y el tiempo registrado.
	
	Implemente en Pascal un programa que invoque a:
	
	a. Un modulo que realice la registracion de los alumnos almacenando toda la informacion en una estructura que permita la busqueda
	eficiente de alumnos por tiempo registrado. La carga finaliza al leer el alumno con DNI igual a cero.
	
	b. Un modulo que reciba la estructura generada en 'a' , un rango de tiempo en minutos (dos numeros reales,por ejemplo: 2.5 , 3.2)y 
	devuelva una lista ordenada por tiempo registrado; donde en esta lista se encuentren todos los alumnos cuyo tiempo registrado este
	incluido en el rango recibido.	
	
	c. Un modulo que reciba la estructura generada 'a' y devuelva el nombre y DNI del alumno mas rapido (el que menos tiempo tardo).
}
type 
	alumno = record
		nombre : String;
		DNI : integer;
		tiempoRegistrado : real;
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
	
procedure leerAlumnos(var a:alumno);
begin
	readln(a.DNI);
	if(a.DNI <> 0)then begin
		readln(a.nombre);
		readln(a.tiempoRegistrado);
	end;
end;

procedure insertarElem(var a:arbol; alu:alumno);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := alu;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.tiempoRegistrado > alu.tiempoRegistrado)then
			insertarElem(a^.HI,alu)
		else 
			insertarElem(a^.HD,alu);
	end;
end;

//MODULO A

procedure cargarArbol(var a:arbol);
var
	alu:alumno;
begin
	leerAlumnos(alu);
	while(alu.DNI <> 0)do begin
		insertarElem(a,alu);
		leerAlumnos(alu);
	end;
end;

//MODULO B

procedure insertarOrdenado(var l:lista; alu:alumno);
var
	nuevo,act,ant : lista;
begin
	new(nuevo);
	nuevo^.dat := alu;
	act := l;
	ant := act;
	
	while(act <> nil)and(act^.dat.tiempoRegistrado < alu.tiempoRegistrado)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = ant)then
		l := nuevo
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure cargarLista(a:arbol; var l:lista; rang1,rang2:real);
begin
	if(a <> nil)then begin
		if(a^.dat.tiempoRegistrado >= rang1)and(a^.dat.tiempoRegistrado <= rang2)then begin
			insertarOrdenado(l,a^.dat);
			cargarLista(a^.HI,l,rang1,rang2);
			cargarLista(a^.HD,l,rang1,rang2);
		end else if(a^.dat.tiempoRegistrado < rang1)then
			cargarLista(a^.HD,l,rang1,rang2)
		else if(a^.dat.tiempoRegistrado > rang2)then
			cargarLista(a^.HI,l,rang1,rang2);
	end;
end;



VAR
	a:arbol;
	l:lista;
	rang1,rang2:real;

BEGIN
	a := nil;
	cargarArbol(a);	//A
	
	l := nil;
	readln(rang1); readln(rang2);
	cargarLista(a,l,rang1,rang2);	//B
	
END.
