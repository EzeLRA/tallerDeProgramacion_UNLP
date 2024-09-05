program ejercicio2;

{
	Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra
	 se conoce codigo del cliente,dia,cantidad de productos y monto pagado.
	 
		A. Implementar un modulo que lea compras,genere y retorne una estructura adecuada para la busqueda por codigo del cliente, donde
		para cada codigo de cliente se almacenan juntas todas sus compras(dia,cantidad de productos y monto) que realizo. La lectura finaliza
		con cantidad de productos 0.
		
		B. Implementar un modulo que reciba la estructura generada en a. y un codigo de cliente y retorne todas las compras de dicho cliente
		
		C. Realizar un modulo recursivo que reciba la estructura que retorna el inciso b. y retorne el monto de la compra con mayor cantidad 
		de productos

		IMPLEMENTAR EL PROGRAMA PRINCIPAL CON LOS MODULOS.
}
type
	rangoDias = 1..31;
	registro = record
		codCliente : integer;
		dia : rangoDias;
		cantProductos : integer;
		monto : real;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : registro;
		sig : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		list : lista;
		HI : arbol;
		HD : arbol;
	end;


//MODULO OPCIONAL
procedure imprimirRegistro(r:registro);
begin
	writeln(r.codCliente);
	writeln(r.dia);
	writeln(r.cantProductos);
	writeln(r.monto);
end;
procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		imprimirRegistro(l^.dat);
		writeln;
		l := l^.sig;
	end;
end;
procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirLista(a^.list);
		writeln;
		imprimirArbol(a^.HD);
	end;
end;



//MODULO A

procedure leerRegistro(var r:registro);
begin
	r.cantProductos := random(30);
	if(r.cantProductos > 0)then begin
		r.codCliente := 1+ random(99);
		r.monto := 0.8 + random(90);
		r.dia := 1 + random(31);
	end;
end;

procedure agregarElem(var l:lista; r:registro);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := r;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; r:registro);
begin
	if(a = nil)then begin
		new(a);
		a^.list := nil;
		agregarElem(a^.list,r);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.list^.dat.codCliente > r.codCliente)then
			insertarElem(a^.HI,r)
		else if(a^.list^.dat.codCliente < r.codCliente)then
			insertarElem(a^.HD,r)
		else 
			agregarElem(a^.list,r);
	end;
end;

procedure moduloA(var a:arbol);
var
	r:registro;
begin
	leerRegistro(r);
	while(r.cantProductos > 0)do begin
		insertarElem(a,r);
		leerRegistro(r);
	end;
end;


//MODULO B
procedure moduloB(a:arbol; cod:integer; var l:lista);
begin
	if(a <> nil)then begin
		if(a^.list^.dat.codCliente < cod)then
			moduloB(a^.HD,cod,l)
		else if(a^.list^.dat.codCliente > cod)then
			moduloB(a^.HI,cod,l)
		else if(a^.list^.dat.codCliente = cod)then
			l := a^.list;
	end;
end;

//MODULO C
procedure retornarProductosMax(l:lista; var cantM:integer; var montoMax:real);
begin
	if(l <> nil)then begin
		if(l^.dat.cantProductos > cantM)then begin
			cantM := l^.dat.cantProductos;
			montoMax := l^.dat.monto;
		end;
		retornarProductosMax(l^.sig,cantM,montoMax);
	end;
end;

VAR
	a:arbol;
	lNuevo:lista;
	cantM,cod:integer;
	montoMax:real;
BEGIN
	randomize;
	a := nil;
	moduloA(a);	//A
	
	imprimirArbol(a);
	
	lNuevo := nil;
	readln(cod);
	moduloB(a,cod,lNuevo);	//B
	
	imprimirLista(lNuevo);
	
	cantM := -1;
	montoMax := 0;
	retornarProductosMax(lNuevo,cantM,montoMax); //C
	writeln(cantM);
	writeln(montoMax);
END.
