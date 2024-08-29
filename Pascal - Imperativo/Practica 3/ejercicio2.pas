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
	
	//Registro para Arbol 1
	venta = record
		codigoProducto: integer;
		fecha: integer;			
		unidadesVendidas: integer;
	end;
	
	//Registro para Arbol 2
	producto = record
		codigo: integer;
		unidadesT: integer;
	end; 
	
	//Registro para Arbol 3
	infoVen = record
		fecha: integer;
		unidadesVendidas: integer;
	end;
		//Lista
		listaV =^ nodoL;
		nodoL = record
			dat : infoVen;
			sig : listaV;
		end;
	
	//Arbol 1
	arbol =^ nodo;
	nodo = record
		dat : venta;
		HI	: arbol;
		HD	: arbol;
	end;
	
	//Arbol 2
	arbol2 =^ nodo2;
	nodo2 = record
		dat : producto;
		HI : arbol2;
		HD : arbol2;
	end;
	
	//Arbol 3
	arbol3 =^ nodo3;
	nodo3 = record
		cod : integer;
		lista : listaV;
		HI : arbol3;
		HD : arbol3;
	end;
	
	
	
	

procedure generarVenta(var v:venta);		//A
begin
	v.codigoProducto :=	random(51);
	if(v.codigoProducto <> 0)then begin
		v.fecha := random(1000);
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
	end else if(a^.dat.codigoProducto >= v.codigoProducto)then
		insertarElem(a^.HD,v)
	else if(a^.dat.codigoProducto < v.codigoProducto)then insertarElem(a^.HI,v);
	
end;

procedure insertarElem2(var a:arbol2; v:venta);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.codigo := v.codigoProducto;
		a^.dat.unidadesT := v.unidadesVendidas;
		a^.HI := nil; a^.HD:=nil;
	end else if(a^.dat.codigo > v.codigoProducto)then insertarElem2(a^.HD,v)
	else if(a^.dat.codigo < v.codigoProducto)then insertarElem2(a^.HI,v)
	else a^.dat.unidadesT := a^.dat.unidadesT + v.unidadesVendidas;
end;

procedure agregarAdelante(var l:listaV; v:venta);
var
	n:listaV;
begin
	new(n);
	n^.dat.fecha := v.fecha;
	n^.dat.unidadesVendidas := v.unidadesVendidas;
	n^.sig := l;
	l := n;
end;

procedure insertarElem3(var a:arbol3; v:venta);
begin
	if(a = nil)then begin
		new(a);
		a^.cod := v.codigoProducto;
		a^.lista := nil;
		agregarAdelante(a^.lista,v);
		a^.HI := nil; a^.HD:=nil;
	end else if(a^.cod = v.codigoProducto)then
		agregarAdelante(a^.lista,v)
	else if(a^.cod < v.codigoProducto)then insertarElem3(a^.HI,v)
	else if(a^.cod > v.codigoProducto)then insertarElem3(a^.HD,v);
end;




//Modulo A

procedure retornarArboles(var a1:arbol; var a2:arbol2; var a3:arbol3);
var
	v:venta;
begin
	generarVenta(v);
	while(v.codigoProducto <> 0)do begin
		insertarElem(a1,v);
		insertarElem2(a2,v);
		insertarElem3(a3,v);
		generarVenta(v);
	end;
end;


//Opcional

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.HI);
		imprimirVenta(a^.dat);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirArbol2(a:arbol2);
begin
	if(a <> nil)then begin
		imprimirArbol2(a^.HI);
		writeln('Codigo: ',a^.dat.codigo);
		writeln('Unidades Total: ',a^.dat.unidadesT);
		writeln;
		imprimirArbol2(a^.HD);
	end;
end;

procedure imprimirLista(l:listaV);
begin
	while(l<>nil)do begin
		writeln('fecha: ',l^.dat.fecha);
		writeln('unidades vendidas: ',l^.dat.unidadesVendidas);
		l := l^.sig;
	end;
end;

procedure imprimirArbol3(a:arbol3);
begin
	if(a <> nil)then begin
		imprimirArbol3(a^.HI);
		writeln('Codigo: ',a^.cod);
		imprimirLista(a^.lista);
		writeln;
		imprimirArbol3(a^.HD);
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
	
procedure codigoMasVenta(a:arbol2; var maxCodigo:integer; var maxNum:integer);
begin
	if (a <> nil) then
	begin
		actualizarMaximo(maxNum,maxCodigo,a^.dat.unidadesT,a^.dat.codigo);
		codigoMasVenta(a^.HI, maxCodigo,maxNum);
		codigoMasVenta(a^.HD, maxCodigo,maxNum);
	end; 
end;

procedure obtenerMaximo(a:arbol2);
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
procedure contarLista(l:listaV; var cant:integer);
begin
	while(l <> nil)do begin
		cant := cant + 1;
		l := l^.sig;
	end;
end;

procedure obtenerMaximoCodVentas(a:arbol3; var maxNum,maxCodigo:integer);
var
	cant:integer;
begin
	if(a <> nil)then begin
		cant := 1;
		contarLista(a^.lista,cant);

		actualizarMaximo(maxNum,maxCodigo,cant,a^.cod);
		
		obtenerMaximoCodVentas(a^.HI,maxNum,maxCodigo);
		obtenerMaximoCodVentas(a^.HD,maxNum,maxCodigo);
	end;
end;

procedure retornarMaxCodVentas(a:arbol3);
var
	maxNum,maxCodigo:integer;
begin
	maxNum:=0;
	obtenerMaximoCodVentas(a,maxNum,maxCodigo);
	writeln('Codigo Max: ', maxCodigo);
end;



VAR
	a1:arbol;
	a2:arbol2;
	a3:arbol3;
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
	imprimirArbol2(a2);
	obtenerMaximo(a2);

	
	writeln;
	imprimirArbol3(a3);
	retornarMaxCodVentas(a3);
	
END.

