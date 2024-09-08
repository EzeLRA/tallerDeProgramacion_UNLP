program ejercicio13;
{
	El hipermercado Carrefour necesita un sistema para obtener estadisticas sobre las compras realizadas por sus cliente.
	
	A. Implementar un modulo que lea informacion de todas las compras de 2023, los almacene y retorne una estructura
	de datos eficiente para la busqueda por codigo de cliente donde para cada codigo de cliente se almacenen juntas
	todas sus compras. De cada compra se conoce: codigo de cliente, numero de factura, cantidad de productos y monto.
	La lectura finaliza con el codigo de cliente 0.
	
	B. Implementar un modulo que reciba la estructura gneerada en A. , un codigo de cliente y retorne la cantidad de compras y el monto 
	total gastado por dicho cliente durante el 2023.
	
	C. Realizar un modulo que reciba la estructura generada en A. y dos numeros de factura X e Y , y retorne todas las ventas cuyo numero
	de factura esten entre X e Y (incluidos).
}

type
	
	compra = record
		codigoCliente : integer;
		numeroFactura : integer;
		cantidadProductos : integer;
		monto : real;
	end;
	
	
	
	compraCli = record
		numeroFactura : integer;
		cantProductos : integer;
		monto : real;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : compraCli;
		sig : lista;
	end;
	
	cliente = record
		codigo : integer;
		compras : lista;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : cliente;
		HI : arbol;
		HD : arbol;
	end;
	
procedure leerCompras(var c:compra);
begin
	readln(c.codigoCliente);
	if(c.codigoCliente > 0)then begin
		readln(c.numeroFactura);
		readln(c.cantidadProductos);
		readln(c.monto);
	end;
end;
	
procedure agregarAdelante(var l:lista; c:compra);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat.numeroFactura := c.numeroFactura;
	nuevo^.dat.cantProductos := c.cantidadProductos;
	nuevo^.dat.monto := c.monto;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem(var a:arbol; c:compra);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.codigo := c.codigoCliente;
		a^.dat.compras := nil;
		agregarAdelante(a^.dat.compras,c);
		a^.HI := nil;
		a^.HD := nil; 
	end else begin
		if(a^.dat.codigo > c.codigoCliente)then
			insertarElem(a^.HI,c)
		else if(a^.dat.codigo < c.codigoCliente)then
			insertarElem(a^.HD,c)
		else
			agregarAdelante(a^.dat.compras,c);
	end;
end;

//modulo a

procedure cargarCompras(var a:arbol);
var
	c:compra;
begin
	leerCompras(c);
	while(c.codigoCliente > 0)do begin
		insertarElem(a,c);
		leerCompras(c);
	end;
end;

//MODULO B

procedure procesarLista(l:lista; var comprasCant:integer; var montoT:real);
begin
	while(l <> nil)do begin
		comprasCant := comprasCant + 1;
		montoT := montoT + l^.dat.monto;
		l := l^.sig;
	end;
end;

procedure buscarDNI(a:arbol; cod:integer; var compraCant:integer; var montoT:real);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo < cod)then
			buscarDNI(a^.HD,cod,compraCant,montoT)
		else if(a^.dat.codigo > cod)then
			buscarDNI(a^.HI,cod,compraCant,montoT)
		else
			procesarLista(a^.dat.compras,compraCant,montoT);
	end;
end;

//modulo C
function procesarLista2(l:lista; x,y:integer):integer;
var
	cant:integer;
begin
	cant := 0;
	while(l <> nil)do begin
		if(l^.dat.numeroFactura >= x)and(l^.dat.numeroFactura <= y)then
			cant := cant + 1;
		l := l^.sig;
	end;
	procesarLista2 := cant ;
end;

function procesarArbol(a:arbol; x,y:integer):integer;
begin
	if(a = nil)then procesarArbol := 0
	else begin
		procesarArbol := procesarLista2(a^.dat.compras,x,y) + procesarArbol(a^.HI,x,y) + procesarArbol(a^.HD,x,y);
	end;
end;


VAR
	a:arbol;
	x,y,cantVentas,cantT,cod : integer;
	montoT : real;
BEGIN
	a := nil;
	cargarCompras(a);

	cantT := 0;
	montoT := 0;
	readln(cod);
	buscarDNI(a,cod,cantT,montoT);
	
	readln(x); readln(y);
	cantVentas := procesarArbol(a,x,y);
END.
