program ejercicio9;

{
	Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido se conoce:
	DNI del cliente , nombre , fecha y monto a abonar por el pedido.
	
	Se pide que:
	
	1. Lea la informacion de los pedidos telefonicos,hasta ingresar uno con monto 0. A partir de esto,
	genere una estructura que almacena para cada DNI del cliente , su nombre y una lista con
	informacion de la fecha y monto de los pedidos realizados. La estructura debe estar ordenada
	por DNI y ser eficiente para la busqueda para dicho criterio.
	
	Con la estructura del Incisiso 1:
	
	2. Informar la cantidad de clientes que realizaron pedidos en una fecha que se lee por teclado
	
	3. Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide
	con uno ingresado.
}

type

	pedido = record
		DNI_cliente : integer;
		nombre : string;
		fecha : integer;
		monto : real;
	end;
	
	
	
	
	pedidoCli = record
		fecha : integer;
		monto : real;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : pedidoCli;
		sig : lista;
	end;
	
	cliente = record
		DNI : integer;
		nombre : string;
		pedidos : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : cliente;
		HI : arbol;
		HD : arbol;
	end;



procedure leerPedidos(var p:pedido);
begin
	readln(p.monto);
	if(p.monto > 0)then begin
		readln(p.DNI_cliente);
		readln(p.nombre);
		readln(p.fecha);
	end;
end;

procedure agregarAdelante(var l:lista; fecha:integer; monto:real);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat.fecha := fecha;
	nuevo^.dat.monto := monto;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure cargarCliente(var cl:cliente; p:pedido);
begin
	cl.DNI := p.DNI_cliente;
	cl.nombre := p.nombre;
	cl.pedidos := nil;
	agregarAdelante(cl.pedidos,p.fecha,p.monto);
end;

procedure insertarElem(var a:arbol; p:pedido);
begin
	if(a = nil)then begin
		new(a);
		cargarCliente(a^.dat,p);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.DNI > p.DNI_cliente)then
			insertarElem(a^.HI,p)
		else if(a^.dat.DNI < p.DNI_cliente)then
			insertarElem(a^.HD,p)
		else
			agregarAdelante(a^.dat.pedidos,p.fecha,p.monto);
	end;
end;

//MODULO A

procedure cargarPedidos(var a:arbol);
var
	p:pedido;
begin
	leerPedidos(p);
	while(p.monto > 0)do begin
		insertarElem(a,p);
		leerPedidos(p);
	end;
end;

//MODULO B
function procesarLista(l:lista; f:integer):boolean;
var
	cumple : boolean;
begin
	cumple := false;
	while(l <> nil)and(cumple = false)do begin
		if(l^.dat.fecha = f)then
			cumple := true;
		l := l^.sig
	end;
	procesarLista := cumple;
end;

function procesarArbol(a:arbol; f:integer):integer;
begin
	if(a = nil)then procesarArbol:=0
	else if(procesarLista(a^.dat.pedidos,f)=true)then procesarArbol := 1 + procesarArbol(a^.HI,f) + procesarArbol(a^.HD,f)
	else procesarArbol := procesarArbol(a^.HI,f) + procesarArbol(a^.HD,f);
end;

//MODULO C

procedure informarDatos(l:lista);
var
	cantT : integer;
	montoT : real;
begin
	cantT := 0;
	montoT := 0;
	while(l <> nil)do begin
		cantT := cantT + 1;
		montoT := montoT + l^.dat.monto;
		l := l^.sig;
	end;
	writeln(cantT);
	writeln(montoT);
end;

procedure moduloC(a:arbol; dni:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.DNI > dni)then
			moduloC(a^.HI,dni)
		else if(a^.dat.DNI < dni)then
			moduloC(a^.HD,dni)
		else
			informarDatos(a^.dat.pedidos);
	end else
		writeln('No se encontro');
end;


VAR
	a:arbol;
	fecha,dni : integer;
BEGIN
	a := nil;
	cargarPedidos(a);
	
	readln(fecha);
	writeln(procesarArbol(a,fecha));
	
	readln(dni);
	moduloC(a,dni);
END.
