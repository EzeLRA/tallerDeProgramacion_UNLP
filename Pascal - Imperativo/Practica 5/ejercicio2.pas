program ejercicio2;
{
	Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
	 los autos en venta. Implementar un programa que:
	
	a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
	 modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
	
	i. Una estructura eficiente para la búsqueda por patente.
	
	ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
	 almacenar todos juntos los autos pertenecientes a ella.
	
	b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
	 cantidad de autos de dicha marca que posee la agencia.
	
	c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
	 la cantidad de autos de dicha marca que posee la agencia.
	
	d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
	 la información de los autos agrupados por año de fabricación.
	
	e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
	 modelo del auto con dicha patente.
	
	f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
	 modelo del auto con dicha patente.
}

const
	dim1 = 2010;
	dimF = 2018;
type
	
	anios = 2010..dimF;
	
	auto = record
		patente : integer;
		anioFabricado : anios;
		marca : String;
		modelo : String;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : auto;
		sig : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : auto;
		HI : arbol;
		HD : arbol;
	end;
	
	arbol2 =^ nodo2;
	nodo2 = record
		dat : lista;
		HI : arbol2;
		HD : arbol2;
	end;
	
	vectorAnios = array[anios]of lista;
	
procedure generarAuto(var a:auto);
var
	marcas : array[0..6]of string = ('Toyota','Chevrolet','MMM','Hyundai','Peugeot','KIA','Ford');
	modelos : array[0..3]of string = ('AAA','BBB','CCC','DDD');
begin
	a.marca := marcas[random(7)];
	if(a.marca <> 'MMM')then begin
		a.patente := random(100);
		a.anioFabricado := 2010 + random(9);
		a.modelo := modelos[random(4)];
	end;
end;	

procedure imprimirAuto(a:auto);
begin
	writeln(a.marca);
	writeln(a.patente);
	writeln(a.anioFabricado);
	writeln(a.modelo);
	writeln;
end;

//MODULO A - 1
procedure insertarElemento(var a:arbol; au:auto);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := au; 
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.patente > au.patente)then
			insertarElemento(a^.HI,au)
		else
			insertarElemento(a^.HD,au);
	end;
end;

//MODULO A - 2
procedure agregarAdelante(var l:lista; a:auto);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := a;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElemento2(var a2:arbol2; a:auto);
begin
	if(a2 = nil)then begin
		new(a2);
		a2^.dat := nil; 
		agregarAdelante(a2^.dat,a);
		a2^.HI := nil;
		a2^.HD := nil;
	end else begin
		if(a2^.dat^.dat.marca = a.marca)then
			agregarAdelante(a2^.dat,a)
		else begin
			insertarElemento2(a2^.HI,a);
			insertarElemento2(a2^.HD,a);
		end;
	end;
end;

//MODULO A
procedure generarArboles(var a:arbol; var a2:arbol2);
var
	au : auto;
begin
	generarAuto(au);
	while(au.marca <> 'MMM')do begin
		insertarElemento(a,au);
		insertarElemento2(a2,au);
		generarAuto(au);
	end;
end;

//MODULO B
function contarAutosMarca(a:arbol; marca:String):integer;
begin
	if(a=nil)then contarAutosMarca := 0
	else if(a^.dat.marca = marca)then contarAutosMarca := 1 + contarAutosMarca(a^.HI,marca) + contarAutosMarca(a^.HD,marca)
	else contarAutosMarca := contarAutosMarca(a^.HI,marca) + contarAutosMarca(a^.HD,marca);
end;

//MODULO C
function contarAutosLista(l:lista):integer;
var
	cant:integer;
begin
	cant := 0;
	while(l <> nil)do begin
		cant := cant + 1;
		l := l^.sig;
	end;
	contarAutosLista := cant;
end;

function contarAutosMarca2(a:arbol2; marca:String):integer;
begin
	if(a=nil)then contarAutosMarca2 := 0
	else if(a^.dat^.dat.marca = marca)then contarAutosMarca2 := contarAutosLista(a^.dat) + contarAutosMarca2(a^.HI,marca) + contarAutosMarca2(a^.HD,marca)
	else contarAutosMarca2 := contarAutosMarca2(a^.HI,marca) + contarAutosMarca2(a^.HD,marca);
end;

//MODULO D
procedure iniciarVector(var v:vectorAnios);
var
	i:anios;
begin
	for i:=dim1 to dimF do
		v[i] := nil;
end;

procedure cargarVector(a:arbol; var v:vectorAnios);
begin
	if(a <> nil)then begin
		agregarAdelante(v[a^.dat.anioFabricado],a^.dat);
		cargarVector(a^.HI,v);
		cargarVector(a^.HD,v);
	end;
end;

//MODULO E
function obtenerModeloPatente(a:arbol; patente:integer):String;
begin
	if(a = nil)then obtenerModeloPatente := ''
	else begin
		if(a^.dat.patente > patente)then
			obtenerModeloPatente := obtenerModeloPatente(a^.HI,patente)
		else if(a^.dat.patente < patente)then
			obtenerModeloPatente := obtenerModeloPatente(a^.HD,patente)
		else if(a^.dat.patente = patente)then
			obtenerModeloPatente := a^.dat.modelo
		else
			obtenerModeloPatente := '';
	end;
end;

//MODULO F
function buscarAutoLista(l:lista; pat:integer):String;
begin
	while(l <> nil)and(l^.dat.patente <> pat)do
		l := l^.sig;
	if(l <> nil)then 
		buscarAutoLista := l^.dat.modelo
	else
		buscarAutoLista := '';
end;

procedure obtenerModeloPatente2(a:arbol2; pat:integer; var model:String);
begin
	if(a <> nil)then begin
		model := buscarAutoLista(a^.dat,pat);
		if(model = '')then begin
			obtenerModeloPatente2(a^.HI,pat,model);
			obtenerModeloPatente2(a^.HD,pat,model);
		end;
	end;
end;


//MODULO OPCIONAL
procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirAuto(a^.dat);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l <> nil)do begin
		imprimirAuto(l^.dat);
		l := l^.sig;
	end;
end;

procedure imprimirArbol2(a:arbol2);
begin
	if(a <> nil)then begin
		imprimirArbol2(a^.HI);
		imprimirLista(a^.dat);
		imprimirArbol2(a^.HD);
	end;
end;



VAR
	a:arbol; a2:arbol2;
	marcaB : String;
	v : vectorAnios;
	pate : integer;
	model : String; // F
BEGIN
	randomize;
	a:=nil;
	a2:=nil;
	generarArboles(a,a2);    			  //A
	
	//imprimirArbol(a);
	imprimirArbol2(a2);
	
	marcaB := 'Toyota';	
	
	writeln(contarAutosMarca(a,marcaB));  //B
	writeln(contarAutosMarca2(a2,marcaB));//C
	iniciarVector(v);
	cargarVector(a,v);					  //D
	
	readln(pate);	//Lectura opcional
	
	//writeln(obtenerModeloPatente(a,pate));  //E
	
	model := '';							//F
	obtenerModeloPatente2(a2,pate,model);
	if(model <> '')then
		writeln(model)
	else
		writeln('No se encotro');
	
END.
