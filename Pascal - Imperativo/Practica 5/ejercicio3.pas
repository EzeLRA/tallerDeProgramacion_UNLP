program ejercicio3;
{
	Un supermercado requiere el procesamiento de sus productos. De cada producto se
	 conoce código, rubro (1..10), stock y precio unitario. Se pide:
	 
	a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
	 vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
	 más eficiente posible. El ingreso finaliza con el código de producto igual a 0.

	b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
	 de producto y retorne si dicho código existe o no para ese rubro.

	c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
	 rubro, el código y stock del producto con mayor código.

	d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
	 retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
	 ingresados.
}
const
	dimF = 10;

type

	rubros = 1..dimF;
	
	producto = record
		codigo : integer;
		rubro : rubros;
		stock : integer;
		precioUnitario : real;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : producto;
		HI : arbol;
		HD : arbol;
	end;
	
	vectorRubros = array[rubros]of arbol;

//MODULO A

procedure iniciarV(var v:vectorRubros);
var
	i:rubros;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure insertarElem(var a:arbol; p:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dat := p;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.codigo > p.codigo)then
			insertarElem(a^.HI,p)
		else
			insertarElem(a^.HD,p);
	end;
end;

procedure leerProductos(var p:producto);
begin
	readln(p.codigo);
	if(p.codigo <> 0)then begin
		readln(p.rubro);
		readln(p.stock);
		readln(p.precioUnitario);
	end;
end;

procedure cargarProductos(var v:vectorRubros);
var
	p:producto;
begin
	leerProductos(p);
	while(p.codigo <> 0)do begin
		insertarElem(v[p.rubro],p);
		leerProductos(p);
	end;
end;

//MODULO B
function codigoRubroExisteArbol(a:arbol; r:rubros; c:integer):boolean;
begin
	if(a = nil)then codigoRubroExisteArbol := false
	else begin
		if(a^.dat.codigo > c)then
			codigoRubroExisteArbol := codigoRubroExisteArbol(a^.HI,r,c)
		else if(a^.dat.codigo < c)then
			codigoRubroExisteArbol := codigoRubroExisteArbol(a^.HD,r,c)
		else
			codigoRubroExisteArbol := (a^.dat.codigo = c);
	end;
end;

function buscarCodigoRubroV(v:vectorRubros; r:rubros; c:integer):boolean;
begin
	buscarCodigoRubroV := codigoRubroExisteArbol(v[r],r,c);
end;

//MODULO C
procedure procesarMax(a:arbol; var codM,stockM:integer);
begin
	if(a <> nil)then begin
		if(a^.dat.codigo > codM)then begin
			codM := a^.dat.codigo;
			stockM := a^.dat.stock;
		end;
		procesarMax(a^.HI,codM,stockM);
		procesarMax(a^.HD,codM,stockM);
	end;
end;

procedure informarMaxRubros(v:vectorRubros);
var
	i,codM,stockM:integer;
begin
	for i:=1 to dimF do begin
		codM := -1;
		stockM := 0;
		
		procesarMax(v[i],codM,stockM);
		
		writeln(codM);
		writeln(stockM);
	end;
end;

//MODULO D

function sumarStockCodigos(a:arbol; c1,c2:integer):integer;
begin
	if(a = nil)then sumarStockCodigos := 0
	else begin
		if(a^.dat.codigo >= c1)and(a^.dat.codigo <= c2)then
			sumarStockCodigos := a^.dat.stock + sumarStockCodigos(a^.HI,c1,c2) + sumarStockCodigos(a^.HD,c1,c2)
		else if(a^.dat.codigo < c1)then
			sumarStockCodigos := sumarStockCodigos(a^.HD,c1,c2)
		else if(a^.dat.codigo > c2)then
			sumarStockCodigos := sumarStockCodigos(a^.HI,c1,c2);
	end;
end;

procedure informarStocksRubros(v:vectorRubros; c1,c2:integer);
var
	i,stock:integer;
begin
	for i:=1 to dimF do begin
		stock := 0;
		
		stock := sumarStockCodigos(v[i],c1,c2);
		
		writeln(stock);
	end;
end;


VAR
	v:vectorRubros;
	ru:rubros;
	c1,c2,cod:integer;
	
BEGIN
	iniciarV(v);
	cargarProductos(v);	//A
	
	readln(ru);
	readln(cod);
	writeln(buscarCodigoRubroV(v,ru,cod)); //B
	
	informarMaxRubros(v);	//C
	
	readln(c1);
	readln(c2);
	informarStocksRubros(v,c1,c2); 	//D
	
END.

