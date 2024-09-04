program ejercicio4;
{
	 Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
	  se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
	  código de igual a 0. Se pide:
	 
	 a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
	  se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
	 
	 b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
	  reclamos efectuados por ese DNI.
	 
	 c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
	  reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
	 
	 d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
	  los reclamos realizados en el año recibido.
}
type

	reclamo = record
		codigo : integer;
		DNIpersona : integer;
		anio : integer;
		tipo : String;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : reclamo;
		sig : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		li : lista;
		cant : integer;
		HI : arbol;
		HD : arbol;
	end;
	
	lista2 =^ nodo2;
	nodo2 = record
		dat : integer;
		sig : lista2;
	end;

//MODULO OPCIONAL

procedure generarReclamos(var r:reclamo);
var
	aux : array[0..2]of String=('AB','CB','DF');
begin
	r.codigo := random(50);
	r.DNIpersona := random(100);
	r.anio := 2000 + random(25);
	r.tipo := aux[random(3)];
end;

procedure leerReclamos(var r:reclamo);
begin
	readln(r.codigo);
	if(r.codigo > 0)then begin
		readln(r.DNIpersona);
		readln(r.anio);
		readln(r.tipo);
	end;
end;

procedure agregarAdelante(var l:lista; r:reclamo);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := r;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; r:reclamo);
begin
	if(a = nil)then begin
		new(a);
		a^.li := nil;
		agregarAdelante(a^.li,r);
		a^.cant := 1;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.li^.dat.DNIpersona < r.DNIpersona)then
			insertarElem(a^.HD,r)
		else if(a^.li^.dat.DNIpersona > r.DNIpersona)then
			insertarElem(a^.HI,r)
		else begin
			agregarAdelante(a^.li,r);
			a^.cant := a^.cant + 1;
		end;
	end;
end;

//MODULO A

procedure moduloA(var a:arbol);
var
	r:reclamo;
begin
	//leerReclamos(r);
	generarReclamos(r);
	while(r.codigo > 0)do begin
		insertarElem(a,r);
		generarReclamos(r);
		//leerReclamos(r);
	end;
end;

//MODULO B

function moduloB(a:arbol; dni:integer):integer;
begin
	if(a = nil)then moduloB := 0
	else begin
		if(a^.li^.dat.DNIpersona > dni)then
			moduloB := moduloB(a^.HI,dni)
		else if(a^.li^.dat.DNIpersona < dni)then
			moduloB := moduloB(a^.HD,dni)
		else if(a^.li^.dat.DNIpersona = dni)then
			moduloB := a^.cant
		else
			moduloB := 0;
	end;
end;

//MODULO C

function moduloC(a:arbol; dni1,dni2:integer):integer;
begin
	if(a = nil)then moduloC := 0
	else begin
		if(a^.li^.dat.DNIpersona >= dni1)and(a^.li^.dat.DNIpersona <= dni2)then
			moduloC := a^.cant + moduloC(a^.HI,dni1,dni2) + moduloC(a^.HD,dni1,dni2)
		else if(a^.li^.dat.DNIpersona < dni1)then
			moduloC := moduloC(a^.HD,dni1,dni2)
		else if(a^.li^.dat.DNIpersona > dni2)then
			moduloC := moduloC(a^.HI,dni1,dni2);
	end;
end;

//MODULO D 

//CORREGIR: Debe almacenar los codigos en una nueva lista para retornar

procedure agregarAdelante2(var l:lista2; cod:integer);
var
	nuevo : lista2;
begin
	new(nuevo);
	nuevo^.dat := cod;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure anioCodigos(l:lista; var lNuevo:lista2; anio:integer);
begin
	while(l <> nil)do begin
		if(l^.dat.anio = anio)then
			agregarAdelante2(lNuevo,l^.dat.codigo);
		
		l := l^.sig;
	end;
end;

procedure moduloD(a:arbol; anio:integer; var l:lista2);
begin
	if(a <> nil)then begin
		anioCodigos(a^.li,l,anio);
		moduloD(a^.HI,anio,l);
		moduloD(a^.HD,anio,l);
	end;
end;

//MODULO OPCIONAL

procedure imprimirReclamo(r:reclamo);
begin
	writeln(r.codigo);
	writeln(r.DNIpersona);
	writeln(r.anio);
	writeln(r.tipo);
end;

procedure imprimirLista(l:lista);
begin
	while(l <> nil)do begin
		imprimirReclamo(l^.dat);
		writeln;
		l := l^.sig;
	end;
end;

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirLista(a^.li);
		writeln;
		writeln;
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirLista2(l:lista2);
begin
	while(l <> nil)do begin
		writeln(l^.dat);
		writeln;
		l := l^.sig;
	end;
end;


VAR
	a:arbol;
	anio,cant1,cant2,dni,dni1,dni2:integer;
	lAnio:lista2;
BEGIN
	a := nil;
	moduloA(a);	//A
	imprimirArbol(a);

	writeln;
	readln(dni);
	cant1 := moduloB(a,dni);	//B
	writeln(cant1);
	
	readln(dni1); readln(dni2);
	cant2 := moduloC(a,dni1,dni2);	//C
	writeln(cant2);
	
	lAnio := nil;	
	readln(anio);
	moduloD(a,anio,lAnio); //D
	imprimirLista2(lAnio);
	
END.
