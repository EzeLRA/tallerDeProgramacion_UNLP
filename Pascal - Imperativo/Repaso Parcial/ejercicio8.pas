program ejercicio8;

{
	Se lee informacion de las compras realizadas por los clientes a un supermercado en el año 2022. De cada compra se lee
	el codigo de cliente, numero de mes y monto gastado. La lectura finaliza cuando se lee el cliente con codigo 0.
	
	A. Realizar un modulo que lea la informacion de las compras y retorne una estructura de datos eficiente para la busqueda por codigo de
	cliente. Para cada cliente, esta estructura debe acumular el monto total gastado para cada mes del año 2022.
	
	B. Realizar un modulo que reciba la estructura generada en A. y un cliente, y retorne el mes con mayor gasto de dicho cliente.
	
	C. Realizar un modulo que reciba la estructura em A. y un numero de mes, y retorne la cantidad de clientes que no gastaron nada en dicho
	mes.
}
type
	meses = 1..12;

	compra = record
		codigoCliente : integer;
		mes : meses;
		montoGastado : real;
	end;
	
	vectorMeses = array[meses]of real;
	
	cliente = record
		codigo : integer;
		gastosMeses : vectorMeses;
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
		readln(c.mes);
		readln(c.montoGastado);
	end;
end;	

procedure inicializarV(var v:vectorMeses);
var
	i:integer;
begin
	for i:=1 to 12 do
		v[i] := 0;
end;

procedure insertarElem(var a:arbol; c:compra);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.codigo := c.codigoCliente;
		inicializarV(a^.dat.gastosMeses);
		a^.dat.gastosMeses[c.mes] := c.montoGastado;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.codigo < c.codigoCliente)then
			insertarElem(a^.HD,c)
		else if(a^.dat.codigo > c.codigoCliente)then
			insertarElem(a^.HI,c)
		else
			a^.dat.gastosMeses[c.mes] := a^.dat.gastosMeses[c.mes] + c.montoGastado;
	end;
end;

//MODULO A

procedure cargarArbol(var a:arbol);
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
procedure obtenerMax(v:vectorMeses; var montoM:real; var mesMax:meses);
var
	i:integer;
begin
	for i:=1 to 12 do begin
		if(v[i]>montoM)then begin
			montoM := v[i];
			mesMax := i;
		end; 
	end;
end;

procedure buscarCliente(a:arbol; var montoM:real; var mesMax:meses; cod:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo > cod)then
			buscarCliente(a^.HI,montoM,mesMax,cod)
		else if(a^.dat.codigo < cod)then
			buscarCliente(a^.HD,montoM,mesMax,cod)
		else if(a^.dat.codigo = cod)then
			obtenerMax(a^.dat.gastosMeses,montoM,mesMax);
	end;
end;

//MODULO C

procedure procesarArbol(a:arbol; mes:meses ; var cant:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.gastosMeses[mes] = 0)then cant := cant + 1;
		procesarArbol(a^.HI,mes,cant);
		procesarArbol(a^.HD,mes,cant);
	end;
end;



VAR
	a:arbol;
	mes,mesMax : meses;
	montoMax : real;
	cant,codigo : integer;
BEGIN
	a := nil;
	cargarArbol(a);	//A
	
	montoMax := 0;
	readln(codigo);
	buscarCliente(a,montoMax,mesMax,codigo); //B
	
	readln(mes);
	cant := 0;
	procesarArbol(a,mes,cant);	//C
END.
