program ejercicio5;
{
	La oficina de mantenimiento de una empresa recibe llamadas telefonicas con problemas reportados
	por distintos empleados de la empresa. En cada llamada recibe: nivel de la importancia del
	problema(un numero entre 1..5), sector de la empresa donde se detecto el problema(un numero entre
	1..50),numero de empleados afectados por el problema
	
	Implemente en pascal un programa que invoque a:
	
	A. Un modulo que simule la recepcion de 100 llamadas en total con problemas reportados(puede
	generar numeros random) y almacene toda la informacion generada en una estructura agrupada por
	nivel de importancia y ordenada por sector de la empresa donde se detecto el problema.
	
	B. Un modulo que reciba la estructura generada en a. y un nivel de importancia N y devuelva una
	estructura eficiente para la busqueda , ordenada por numero de empleados afectados , con todos los
	problemas del nivel N.
	
	C. Un modulo que reciba la estructura generada en b. y devuelva el numero de sector del problema
	con mayor cantidad de empleados afectados.
}
const
	dimF = 5;

type
	
	nivelesImportancia = 1..dimF;
	
	sectores = 1..50;

	llamada = record
		nivelImportancia : nivelesImportancia;
		sector : sectores;
		empleadosCant : integer;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : llamada;
		sig : lista;
	end;
	
	vectorLlamadas = array[nivelesImportancia]of lista;
	
	arbol =^ nodo;
	nodo = record
		dat : llamada;
		HI : arbol;
		HD : arbol;
	end;
	
procedure generarLlamadas(var l:llamada);
begin
	l.nivelImportancia := 1 + random(dimF);
	l.sector := 1 + random(50);
	l.empleadosCant := random(100);
end;

procedure insertarOrdenado(var list:lista; l:llamada);
var
	nuevo,act,ant:lista;
begin
	new(nuevo);
	nuevo^.dat := l;
	act := list;
	ant := act;
	
	while(act <> nil)and(act^.dat.sector < l.sector)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = ant)then
		list := nuevo
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure inicializarV(var v:vectorLlamadas);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

//MODULO A

procedure cargarLlamadas(var v:vectorLlamadas);
var
	i:integer;
	l:llamada;
begin
	for i:=1 to 100 do begin
		generarLlamadas(l);
		insertarOrdenado(v[l.nivelImportancia],l);
	end;
end;

//MODULO B

procedure insertarElem(var a:arbol; l:llamada);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := l;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.empleadosCant > l.empleadosCant)then
			insertarElem(a^.HI,l)
		else
			insertarElem(a^.HD,l);
	end;
end;

procedure procesarVector(v:vectorLlamadas; var a:arbol; n:nivelesImportancia);
begin
	while(v[n] <> nil)do begin
		insertarElem(a,v[n]^.dat);
		v[n] := v[n]^.sig;
	end;
end;

//MODULO C
function retornarNumeroMax(a:arbol):integer;
begin
	if(a = nil)then retornarNumeroMax := -1
	else begin
		if(a^.HD <> nil)then
			retornarNumeroMax := retornarNumeroMax(a^.HD)
		else
			retornarNumeroMax := a^.dat.empleadosCant;
	end;
end;


VAR
	v:vectorLlamadas;
	a:arbol;
	n:nivelesImportancia;
	numeroMax : integer;
BEGIN
	randomize;
	
	inicializarV(v);
	cargarLlamadas(v);	//A
	
	a := nil;
	readln(n);
	procesarVector(v,a,n); //B
	
	numeroMax := retornarNumeroMax(a); //C
	writeln(numeroMax);
	
END.
