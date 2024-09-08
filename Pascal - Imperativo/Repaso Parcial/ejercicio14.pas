program ejercicio14;
{
	Una empresa de alquiler de autos desea procesar la informacion de sus alquileres.Implementar un programa que:
	
	A. Implementar un modulo que lea informacion de los alquileres y retorne una estructura de datos eficiente para la busqueda
	por patente. Para cada patente deben quedar almacenados junto todos sus alquileres.
	De cada alquiler se lee : dni del cliente , patente , mes y anio . La lectura finaliza con la patente 0.
	
	B. Implementar un modulo que reciba la estructura generada en A. y un DNI . Este modulo debe retornar la cantidad de alquileres
	realizados por el dni.
	
	C. Implementar un modulo que reciba la estructura generada en A. , un anio X y dos patentes A y B. Este modulo debe retornar
	la cantidad de alquileres realizados para las patentes entre A y B (incluidos) durante el anio X.
}

type
	meses = 1..12;

	alquiler = record
		dniCliente : integer;
		patente : integer;
		mes : meses;
		anio : integer;
	end;
	
	
	alquilerAuto = record
		dniCliente : integer;
		mes : meses;
		anio : integer;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : alquilerAuto;
		sig : lista;
	end;
		
	patenteAuto = record
		patente : integer;
		alquileres : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : patenteAuto;
		HI : arbol;
		HD : arbol;
	end;



procedure leerAlquiler(var alqui:alquiler);
begin
	readln(alqui.patente);
	if(alqui.patente > 0)then begin
		readln(alqui.dniCliente);
		readln(alqui.mes);
		readln(alqui.anio);
	end;
end;

procedure agregarAdelante(var l:lista; alq:alquiler);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat.dniCliente := alq.dniCliente;
	nuevo^.dat.mes := alq.mes;
	nuevo^.dat.anio := alq.anio;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; alq:alquiler);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.patente := alq.patente;
		a^.dat.alquileres := nil;
		agregarAdelante(a^.dat.alquileres,alq);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.patente > alq.patente)then
			insertarElem(a^.HI,alq)
		else if(a^.dat.patente < alq.patente)then
			insertarElem(a^.HD,alq)
		else
			agregarAdelante(a^.dat.alquileres,alq);
	end;
end;

//MODULO A

procedure armarArbol(var a:arbol);
var
	alq : alquiler;
begin
	leerAlquiler(alq);
	while(alq.patente > 0)do begin
		insertarElem(a,alq);
		leerAlquiler(alq);
	end;
end;

//MODULO B 
function procesarLista(l:lista; dni:integer):integer;
var
	cant : integer;
begin
	cant := 0;
	while(l <> nil)do begin
		if(l^.dat.dniCliente = dni)then
			cant := cant + 1;
		l := l^.sig;
	end;
	procesarLista := cant;
end;

function devolverDniAlquileres(a:arbol; dni:integer):integer;
begin
	if(a = nil)then devolverDniAlquileres := 0
	else devolverDniAlquileres := procesarLista(a^.dat.alquileres,dni) + devolverDniAlquileres(a^.HI,dni) + devolverDniAlquileres(a^.HD,dni);
end;

//MODULO C
function procesarLista2(l:lista; x:integer):integer;
var
	cant : integer;
begin
	cant := 0;
	while(l <> nil)do begin
		if(l^.dat.anio = x)then
			cant := cant + 1;
		l := l^.sig;
	end;
	procesarLista2 := cant;
end;

function moduloC(a:arbol; x,pA,pB:integer):integer;
begin
	if(a = nil)then moduloC := 0
	else begin
		if(a^.dat.patente >= pA)and(a^.dat.patente <= pB)then
			moduloC := procesarLista2(a^.dat.alquileres,x) + moduloC(a^.HI,x,pA,pB) + moduloC(a^.HD,x,pA,pB)
		else if(a^.dat.patente < pA)then
			moduloC := moduloC(a^.HD,x,pA,pB)
		else if(a^.dat.patente > pB)then
			moduloC := moduloC(a^.HI,x,pA,pB);
	end;
end;








VAR
	a:arbol;
	dni : integer;
	x,patA,patB:integer;
BEGIN
	a := nil;
	armarArbol(a);
	
	readln(dni);
	writeln(devolverDniAlquileres(a,dni));

	readln(patA);
	readln(patB);
	readln(x);
	moduloC(a,x,patA,patB);
END.
