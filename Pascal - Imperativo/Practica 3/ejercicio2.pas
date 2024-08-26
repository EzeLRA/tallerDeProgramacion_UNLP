program ejercicio2;
{
	Escribir un programa que:
	
	a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
	 Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
	 con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
	
	i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
	 producto. Los códigos repetidos van a la derecha.
	
	ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	 código de producto. Cada nodo del árbol debe contener el código de producto y la
	 cantidad total de unidades vendidas.
	
	iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	 código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
	 las ventas realizadas del producto.


					///// Nota: El módulo debe retornar TRES árboles. /////


	b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
	total de productos vendidos en la fecha recibida.

	c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
	con mayor cantidad total de unidades vendidas.

	d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
	con mayor cantidad de ventas.
}

type
	venta = record
		codigoProducto: integer;
		fecha: integer;				//Se lo considera solo el dia (1..31)
		unidadesVendidas: integer;
	end;
	
	arbol =^ nodo;
	
	nodo = record
		dat : venta;
		HI	: arbol;
		HD	: arbol;
	end;
	
	
	

procedure generarVenta(var v:venta);		//A
begin
	v.codigoProducto :=	random(51);
	if(v.codigoProducto <> 0)then begin
		v.fecha := random(32) + 1;
		v.unidadesVendidas := random(100);
		v.codigoProducto :=	random(51);
	end;
end;

procedure imprimirVenta(v:venta);
begin
	writeln(v.codigoProducto);
	writeln(v.fecha);
	writeln(v.unidadesVendidas);
	writeln;
end;



//Generadores de arboles


procedure insertarElem(var a:arbol; v:venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := v;
		a^.HI := nil; a^.HD:=nil;
	end else if(a^.dat.codigoProducto = v.codigoProducto)then
		insertarElem(a^.HD,v)
	else if(a^.dat.codigoProducto < v.codigoProducto)then insertarElem(a^.HI,v);
	
end;

procedure generarArbol1(var a:arbol);		//A - 1 - 3
var
	v:venta;
begin
	generarVenta(v);
	while(v.codigoProducto <> 0)do begin
		insertarElem(a,v);
		generarVenta(v);
	end;
end;


procedure recorrerArbol(a:arbol);
begin
	if(a<>nil)then begin
		recorrerArbol(a^.HI);
		imprimirVenta(a^.dat);
		recorrerArbol(a^.HD);
	end;
end;



procedure insertarElem2(var a:arbol; v:venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := v;
		a^.HI := nil; a^.HD:=nil;
	end else if(a^.dat.codigoProducto > v.codigoProducto)then insertarElem2(a^.HD,v)
	else if(a^.dat.codigoProducto < v.codigoProducto)then insertarElem2(a^.HI,v)
	else a^.dat.unidadesVendidas := a^.dat.unidadesVendidas + v.unidadesVendidas;
end;

procedure generarArbol2(var a:arbol);		//A - 2
var
	v:venta;
begin
	generarVenta(v);
	while(v.codigoProducto <> 0)do begin
		insertarElem2(a,v);
		generarVenta(v);
	end;
end;




VAR
	a1,a2:arbol;
BEGIN
	randomize;
	a1:=nil;
	a2:=nil;
	generarArbol1(a1);
	recorrerArbol(a1);
	writeln;
	generarArbol2(a2);
	recorrerArbol(a2);
END.
