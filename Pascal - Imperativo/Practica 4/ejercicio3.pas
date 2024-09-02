program ejercicio3;
{
	Implementar un programa modularizado para una librería. Implementar módulos para:
	
	a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
	 código de producto. De cada producto deben quedar almacenados su código, la
	 cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
	 venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
	 ingreso de las ventas finaliza cuando se lee el código de venta -1.
	
	b. Imprimir el contenido del árbol ordenado por código de producto.
	
	c. Retornar el código de producto con mayor cantidad de unidades vendidas.
	
	d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
	 que se recibe como parámetro.
	 
	e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
	 valores recibidos (sin incluir) como parámetros.
}

type
	producto = record
		codigo : integer;
		totalVendido : integer;
		montoTotal : real;
	end;
	venta = record
		codigo : integer;
		codigoProd : integer;
		cantVendido : integer;
		precioUnitario : real;
	end;
	
	lista =^ nodo;
	nodo = record
		dat : venta;
		sig : lista;
	end;
	
	arbol =^ nodoA;
	
	nodoA = record
		dat : producto;
		ventas : lista;
		HI : arbol;
		HD : arbol;
	end;

//MODULO OPCIONAL
procedure generarVentas(var v:venta);
begin
	v.codigo := random(10)-1;
	if(v.codigo <> -1)then begin
		v.codigoProd := random(1000);
		v.cantVendido := random(100);
		v.precioUnitario := random(100) * 1.2;
	end;
end;


//MODULO A

procedure leerVentas(var v:venta);
begin
	readln(v.codigo);
	if(v.codigo <> -1)then begin
		readln(v.codigoProd);
		readln(v.cantVendido);
		readln(v.precioUnitario);
	end;
end;

procedure agregarAdelante(var l:lista; v:venta);
var
	n:lista;
begin
	new(n);
	n^.dat := v;
	n^.sig := l;
	l := n;
end;

procedure insertarElem(var a:arbol; v:venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.codigo := v.codigoProd;
		a^.dat.totalVendido := v.cantVendido;
		a^.dat.montoTotal := v.precioUnitario;
		a^.ventas := nil;
		agregarAdelante(a^.ventas,v);
		a^.HI := nil;
		a^.HD := nil;
	end else if(a^.dat.codigo < v.codigoProd)then
		insertarElem(a^.HD,v)
	else if (a^.dat.codigo > v.codigoProd)then
		insertarElem(a^.HI,v)
	else begin
		a^.dat.totalVendido := a^.dat.totalVendido + v.cantVendido;
		a^.dat.montoTotal := a^.dat.montoTotal + v.precioUnitario;
		agregarAdelante(a^.ventas,v);
	end;
end;

procedure cargarVentas(var a:arbol);
var
	v:venta;
begin
	generarVentas(v);
	//leerVentas(v);
	while(v.codigo <> -1)do begin
		insertarElem(a,v);
		generarVentas(v);
		//leerVentas(v);
	end;
end;

//MODULO B
procedure imprimirProducto(p:producto);
begin
	writeln('........................');
	writeln('Codigo: ',p.codigo);
	writeln('Monto total: ',p.montoTotal);
	writeln('Total vendido: ',p.totalVendido);
	writeln('........................');
end;

procedure imprimirVenta(v:venta);
begin
	writeln('Codigo venta: ', v.codigo);
	writeln('Cantidad vendida: ', v.cantVendido);
	writeln('Precio unitario: ', v.precioUnitario);
end;

procedure imprimirLista(l:lista);
begin
	writeln('_________Ventas__________');
	while(l<>nil)do begin
		imprimirVenta(l^.dat);
		l := l^.sig;
	end;
	writeln('_________________________');
	writeln;
end;

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirProducto(a^.dat);
		imprimirLista(a^.ventas);
		imprimirArbol(a^.HD);
	end;
end;

//MODULO C

procedure obtenerMaxCod(a:arbol; var cod,max:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.totalVendido > max)then begin
			max := a^.dat.totalVendido;
			cod := a^.dat.codigo;
		end;
		obtenerMaxCod(a^.HI,cod,max);
		obtenerMaxCod(a^.HD,cod,max);
	end;
end;

//MODULO D

function codigosMenoresA(a:arbol; cod:integer):integer;
begin
	if(a=nil)then
		codigosMenoresA := 0
	else begin
		if(a^.dat.codigo < cod)then codigosMenoresA := 1 + codigosMenoresA(a^.HI,cod) + codigosMenoresA(a^.HD,cod)
		else codigosMenoresA := codigosMenoresA(a^.HI,cod) + codigosMenoresA(a^.HD,cod);
	end;
end;

//MODULO E
procedure obtenerMontoTotalRango(a:arbol; cod1,cod2:integer; var monto:real);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo > cod1)and(a^.dat.codigo < cod2)then begin
		//Recuenta desde los parametros
			monto := monto + a^.dat.montoTotal;
			obtenerMontoTotalRango(a^.HI,cod1,cod2,monto);
			obtenerMontoTotalRango(a^.HD,cod1,cod2,monto);
		end else if(a^.dat.codigo < cod1)then
		//Valora el limite inferior
			obtenerMontoTotalRango(a^.HD,cod1,cod2,monto)
		else if(a^.dat.codigo > cod2)then
		//Valora el limite superior
			obtenerMontoTotalRango(a^.HI,cod1,cod2,monto);
	end;
end;



VAR
	a:arbol;
	cod1,cod2,cod,codM,max:integer;
	total:real;
BEGIN
	randomize;
	a:=nil;
	
	max := -1;
	total := 0;	
	
	cargarVentas(a);	//A
	imprimirArbol(a);	//B
	writeln;
	writeln;
	obtenerMaxCod(a,codM,max);	//C
	writeln('Codigo con mas unidades vendidas: ',codM);
	writeln;
	writeln;
	readln(cod);
	writeln(codigosMenoresA(a,cod));		//D
	writeln;
	writeln;
	readln(cod1); readln(cod2);
	obtenerMontoTotalRango(a,cod1,cod2,total);	//E
	writeln('Monto Total entre esos productos: ',total);
END.
