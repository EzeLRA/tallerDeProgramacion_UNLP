program ejercicio11;
{
	Play Station Store quiere procesar las compras realizadas por sus clientes durante el anio 2022
	
	A. Implementar un modulo que lea las compras de videojuegos. De cada compra se lee codigo del videojuego,codigo de cliente,dia y mes.
	La lectura finaliza con el codigo de cliente 0. Se deben retornar dos estructuras:
		
		1.Una estructura eficiente para la busqueda por codigo de cliente.
		2.Otra estructura que almacena la cantidad de compras realizadas en cada mes.
		
	B. Implementar un modulo que reciba la estructura generada en a.1 y un codigo de cliente,retorne todas las compras que realizo dicho
	cliente.
	
	C. Implementar un modulo que reciba la estructura generada en a.2 y retorne la misma estructura ordenada por cantidad de mayor a menor. 
}

type
	dias = 1..31;
	meses = 1..12;
	
	compra = record
		codigoJuego : integer;
		codigoCliente : integer;
		dia : dias;
		mes : meses;
	end;
	
	
	
	
	
	lista =^ nodoL;
	nodoL = record
		dat : compra;
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
	
	
	
	
	
	comprasMes = array[meses]of integer;
	
	
	
procedure inicializarV(var v:comprasMes);
var
	i:integer;
begin
	for i:=1 to 12 do
		v[i] := 0;
end;

procedure leerCompras(var c:compra);
begin
	readln(c.codigoCliente);
	if(c.codigoCliente > 0)then begin
		readln(c.codigoJuego);
		readln(c.dia);
		readln(c.mes);
	end;
end;	

procedure agregarAdelante(var l:lista; c:compra);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := c;
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

procedure moduloA(var a:arbol; var v:comprasMes);
var
	c:compra;
begin
	leerCompras(c);
	while(c.codigoCliente > 0)do begin
		v[c.mes] := v[c.mes] + 1;
		insertarElem(a,c);
		leerCompras(c);
	end;
end;

//Modulo b

procedure moduloB(a:arbol; cod:integer; var li:lista);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo < cod)then
			moduloB(a^.HD,cod,li)
		else if(a^.dat.codigo > cod)then
			moduloB(a^.HI,cod,li)
		else
			li := a^.dat.compras;
	end;
end;

//modulo c

procedure ordenarSeleccion(var v:comprasMes);
var
	i,j,pos,aux : integer;
begin
	for i:=1 to 11 do begin
		pos := i;
		for j:=i to 12 do begin
			if(v[i] > v[j])then pos := j; 
		end;
		aux := v[i];
		v[i] := v[pos];
		v[pos] := aux;
	end;
end;






VAR
	v:comprasMes;
	a:arbol;

	clienteCod : integer;
	listaCliente : lista;

BEGIN
	a := nil;
	inicializarV(v);
	
	moduloA(a,v);
	
	readln(clienteCod);
	listaCliente := nil;
	moduloB(a,clienteCod,listaCliente);
	
	ordenarSeleccion(v);
END.
