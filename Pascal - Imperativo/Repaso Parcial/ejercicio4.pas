program ejercicio4;
{
	Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los clientes.
	Implementar un programa en Pascal con:
	
	A. Un modulo que lea la informacion de las asistencias realizadas en las sucursales y genere una estructura con codigo de cliente,
	dni de cliente, fecha y cantidad de minutos que asistio a la sucursal, agrupados por sucursal. Para cada sucursal, los clientes deben
	estar ordenados por codigo de cliente. De cada asistencia se lee: codigo de sucursal(1..5),dni del cliente, codigo de cliente,fecha y
	cantidad de minutos que asistio. La lectura finaliza con el codigo de cliente -1 , el cual no se procesa.
	
	B. (EN EL AÑO 2024 NO SE VIO EL CONCEPTO DE MERGE)
}
const
	dimF = 5;

type
	sucursalesCod = 1..dimF;

	asistencia = record
		codCliente : integer;
		dni : integer;
		fecha : integer;
		minutosPresente : integer;
		codSucursal : sucursalesCod;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : asistencia;
		HI : arbol;
		HD : arbol;
	end;
	
	vectorSucursales = array[sucursalesCod]of arbol;

procedure leerAsistencia(var asis:asistencia);
begin
	readln(asis.codCliente);
	if(asis.codCliente > -1)then begin
		readln(asis.dni);
		readln(asis.fecha);
		readln(asis.minutosPresente);
		readln(asis.codSucursal);
	end;
end;

procedure insertarElem(var a:arbol; asi:asistencia);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := asi;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.codCliente > asi.codCliente)then
			insertarElem(a^.HI,asi)
		else
			insertarElem(a^.HD,asi);
	end;
end;

procedure inicializarVector(var v:vectorSucursales);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure cargarAsistencias(var v:vectorSucursales);
var
	a:asistencia;
begin
	leerAsistencia(a);
	while(a.codCliente > -1)do begin
		insertarElem(v[a.codSucursal],a);
		leerAsistencia(a);
	end;
end;


VAR
	v:vectorSucursales;

BEGIN
	inicializarVector(v);
	cargarAsistencias(v);
END.
