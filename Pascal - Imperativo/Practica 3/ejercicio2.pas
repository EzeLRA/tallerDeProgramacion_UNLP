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
	writeln('Codigo Producto: ',v.codigoProducto);
	writeln('Fecha: ',v.fecha);
	writeln('Unidades vendidas: ',v.unidadesVendidas);
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

procedure generarArbol1(var a:arbol);		//A - 1 - 3	//Este arbol almacena los codigos distintos por la izquierda y las iguales a la derecha
			
var
	v:venta;
begin
	generarVenta(v);
	while(v.codigoProducto <> 0)do begin
		insertarElem(a,v);
		generarVenta(v);
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

procedure generarArbol2(var a:arbol);		//A - 2		Este arbol guarda en los codigos repetidos la suma de las unidades vendidas(No tiene codigos repetidos)
var
	v:venta;
begin
	generarVenta(v);
	while(v.codigoProducto <> 0)do begin
		insertarElem2(a,v);
		generarVenta(v);
	end;
end;

procedure retornarArboles(var a1,a2,a3:arbol);
begin
	generarArbol1(a1);
	generarArbol2(a2);
	generarArbol1(a3);
end;

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirVenta(a^.dat);
		imprimirArbol(a^.HD);
	end;
end;

//B
function sumarCantidadesFecha(a:arbol; f:integer):integer;
begin
	if(a = nil)then sumarCantidadesFecha:=0
	else begin
		if(a^.dat.fecha = f)then sumarCantidadesFecha := a^.dat.unidadesVendidas + sumarCantidadesFecha(a^.HI,f) + sumarCantidadesFecha(a^.HD,f)
		else sumarCantidadesFecha := sumarCantidadesFecha(a^.HI,f) + sumarCantidadesFecha(a^.HD,f) 
	end;
end;

//C

procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
begin
	if (nuevoValor >= maxValor) then
	begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	end;
end;
	
procedure codigoMasVenta(a: arbol; var maxCodigo: integer; var maxNum: integer);
begin
	if (a <> nil) then
	begin
		actualizarMaximo(maxNum,maxCodigo,a^.dat.unidadesVendidas,a^.dat.codigoProducto);
		codigoMasVenta(a^.HI, maxCodigo,maxNum);
		codigoMasVenta(a^.HD, maxCodigo,maxNum);
	end; 
end;

procedure obtenerMaximo(a:arbol);
var
	maxNum,maxCod:integer;
begin
	if(a <> nil)then begin
		maxNum := -1;
		codigoMasVenta(a,maxCod,maxNum);
		writeln(maxCod);
		writeln(maxNum);
	end;
end;


//D
procedure recorrerHojaDerecha(a:arbol; var cant:integer);
begin
	while(a <> nil)do begin
		cant := cant + 1;
		a := a^.HD;
	end;
end;

procedure obtenerMaximoCodVentas(a:arbol; var maxNum,maxCodigo:integer);
var
	cant:integer;
begin
	if(a <> nil)then begin
		cant := 1;
		recorrerHojaDerecha(a^.HD,cant);

		actualizarMaximo(maxNum,maxCodigo,cant,a^.dat.codigoProducto);
		
		obtenerMaximoCodVentas(a^.HI,maxNum,maxCodigo);
	end;
end;

procedure retornarMaxCodVentas(a:arbol);
var
	maxNum,maxCodigo:integer;
begin
	maxNum:=0;
	obtenerMaximoCodVentas(a,maxNum,maxCodigo);
	writeln('Codigo Max: ', maxCodigo);
end;



VAR
	a1,a2,a3:arbol;
	f:integer;
BEGIN
	randomize;
	a1:=nil;
	a2:=nil;
	a3:=nil;
	retornarArboles(a1,a2,a3);
	imprimirArbol(a1);
	
	
	writeln;
	write('Ingrese fecha: ');
	readln(f);
	writeln('Cantidad total vendida en ese fecha: ',sumarCantidadesFecha(a1,f));
	
	writeln;
	imprimirArbol(a2);
	obtenerMaximo(a2);
	
	writeln;
	imprimirArbol(a3);
	retornarMaxCodVentas(a3);
END.
