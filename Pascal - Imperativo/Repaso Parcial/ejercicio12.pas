program ejercicio12;

{
	Aerolineas Argentinas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el codigo de vuelo, codigo del
	cliente, codigo ciudad destino y monto del pasaje.
	
	A. Implementar un modulo que lea pasajes, genere y retorne una estructura adecuada para la busqueda por codigo de ciudad destino,
	donde para cada codigo de ciudad  destino se almacenan juntos todos los pasajes(codigo de vuelo, codigo de cliente y monto del pasaje).
	La lectura finaliza con el monto de pasaje 0.
	
	B. Implementar un modulo que reciba la estructura generada en A. y un codigo  de ciudad destino y retorne todos los pasajes hacia esa 
	ciudad destino.
	
	C. Realizar un modulo que reciba la estructura generada en A. y retorne el codigo de ciudad de destino con mayor cantidad de pasajes
	vendidos.
}

type
	
	pasaje = record
		codigoVuelo : integer;
		codigoCliente : integer;
		codigoCiudad : integer;
		monto : real;
	end;
	
	
	
	
	pasajeCiudad = record
		codigoVuelo : integer;
		codigoCliente : integer;
		monto : real;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : pasajeCiudad;
		sig : lista;
	end;

	ciudadDestino = record
		codigo : integer;
		pasajes : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : ciudadDestino;
		HI : arbol;
		HD : arbol;
	end;
	
	
	
procedure leerPasajes(var p:pasaje);
begin
	readln(p.monto);
	if(p.monto > 0)then begin
		readln(p.codigoVuelo);
		readln(p.codigoCliente);
		readln(p.codigoCiudad);
	end;
end;
	
procedure agregarAdelante(var l:lista; p:pasaje);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dat.codigoVuelo := p.codigoVuelo;
	nuevo^.dat.codigoCliente := p.codigoCliente;
	nuevo^.dat.monto := p.monto;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; p:pasaje);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.codigo := p.codigoCiudad;
		a^.dat.pasajes := nil;
		agregarAdelante(a^.dat.pasajes,p);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.codigo > p.codigoCiudad)then
			insertarElem(a^.HI,p)
		else if(a^.dat.codigo < p.codigoCiudad)then
			insertarElem(a^.HD,p)
		else
			agregarAdelante(a^.dat.pasajes,p);
	end;
end;

//MODULO A

procedure cargarPasajes(var a:arbol);
var
	p:pasaje;
begin
	leerPasajes(p);
	while(p.monto > 0)do begin
		insertarElem(a,p);
		leerPasajes(p);
	end;
end;

//MODULO B 
procedure buscarCiudad(a:arbol; cod:integer; var l:lista);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo > cod)then
			buscarCiudad(a^.HI,cod,l)
		else if(a^.dat.codigo < cod)then
			buscarCiudad(a^.HD,cod,l)
		else
			l := a^.dat.pasajes;
	end;
end;

//MODULO C
function devolverPasajesCant(l:lista):integer;
var
	cant : integer;
begin
	cant := 0;
	while(l <> nil)do begin
		cant := cant + 1;
		l := l^.sig;
	end;
	devolverPasajesCant := cant;
end;



procedure procesarMaxCiudad(a:arbol; var codMax,cant,cantMax:integer);
begin
	if(a <> nil)then begin
		cant := devolverPasajesCant(a^.dat.pasajes);
		if(cantMax < cant)then begin
			cantMax := cant;
			codMax := a^.dat.codigo;
		end;
		procesarMaxCiudad(a^.HI,codMax,cant,cantMax);
		procesarMaxCiudad(a^.HD,codMax,cant,cantMax);
	end;
end;





VAR
	a:arbol;
	codCiudad : integer;
	pasajesCiu : lista;
	
	codMax,cant,cantMax : integer;
BEGIN
	a := nil;
	cargarPasajes(a);	//A
	
	pasajesCiu := nil;
	readln(codCiudad);
	buscarCiudad(a,codCiudad,pasajesCiu); //B
	
	cantMax := -1;
	procesarMaxCiudad(a,codMax,cant,cantMax); //C
END.
