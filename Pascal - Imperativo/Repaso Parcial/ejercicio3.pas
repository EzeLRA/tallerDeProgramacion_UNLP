program ejercicio3;
{
	Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los clientes durante el agosto
	de 2022. De cada pedido se conoce el numero del cliente,dia,cantidad de combos y monto pagado.
	
	a.Implementar un modulo que lea pedidos,genere y retorner una estructura adecuada para la busqueda por numero de cliente, donde para
	cada numero de cliente se almacenen juntos todos sus pedidos(dia,cantidad de combos y monto)que realizo. La lectura finaliza con cliente
	numero 0.
	
	b.Implementar un modulo que reciba la estructura generada en a. y un numero de cliente, y retorne todos los pedidos que realizo
	dicho cliente.
	
	c.Realice un modulo recursivo que reciba la informacion retornada en el inciso b. y retorne el monto total abonado por el cliente.
}
type
	rangoDias = 1..31;
	pedido = record
		numCliente : integer;
		dia : rangoDias;
		cantCombos : integer;
		monto : real;
	end;

	lista =^ nodoL;
	nodoL = record
		dat : pedido;
		sig : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		list : lista;
		HI : arbol;
		HD : arbol;
	end;
	
procedure leerPedidos(var p:pedido);
begin
	p.numCliente := random(30);
	if(p.numCliente > 0)then begin
		p.dia := 1 + random(31);
		p.cantCombos := random(30);
		p.monto := random(30) + 1.2;
	end;
end;

procedure agregarAdelante(var l:lista; p:pedido);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dat := p;
	nuevo^.sig := nil;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; p:pedido);
begin
	if(a = nil)then begin
		new(a);
		a^.list := nil;
		agregarAdelante(a^.list,p);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.list^.dat.numCliente > p.numCliente)then
			insertarElem(a^.HI,p)
		else if(a^.list^.dat.numCliente < p.numCliente)then
			insertarElem(a^.HD,p)
		else
			agregarAdelante(a^.list,p);
	end;
end; 

procedure cargarArbol(var a:arbol);		//MODULO A
var
	p:pedido;
begin
	leerPedidos(p);
	while(p.numCliente > 0)do begin
		insertarElem(a,p);
		leerPedidos(p);
	end;
end;

//MODULO B
procedure retornarListaCliente(a:arbol; var l:lista; numCod:integer);
begin
	if(a <> nil)then begin
		if(numCod > a^.list^.dat.numCliente)then
			retornarListaCliente(a^.HD,l,numCod)
		else if(numCod < a^.list^.dat.numCliente)then
			retornarListaCliente(a^.HI,l,numCod)
		else if(numCod = a^.list^.dat.numCliente)then
			l := a^.list;
	end;
end;

//MODULO C 
function retornarMontoTotalCliente(l:lista):real;
begin
	if(l<>nil)then
		retornarMontoTotalCliente := l^.dat.monto + retornarMontoTotalCliente(l^.sig)
	else
		retornarMontoTotalCliente := 0;
end;

VAR
	a:arbol;
	lNuevo:lista;
	numCli : integer;
	
	montoTotal : real;
BEGIN
	randomize;

	a:=nil;
	cargarArbol(a);	//A

	lNuevo := nil;
	readln(numCli);
	retornarListaCliente(a,lNuevo,numCli);	//B
	
	montoTotal := retornarMontoTotalCliente(lNuevo);
	writeln(montoTotal);	//C
END.
