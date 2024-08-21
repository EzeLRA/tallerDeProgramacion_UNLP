program actividad1;
{
	Se desea procesar la información de las ventas de productos de un comercio (como máximo 50).
	Implementar un programa que invoque los siguientes módulos:

	a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce
	 el día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
	 unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
	 ingreso de las ventas finaliza con el día de venta 0 (no se procesa).

	b. Un módulo que muestre el contenido del vector resultante del punto a).
	
	c. Un módulo que ordene el vector de ventas por código.
	
	d. Un módulo que muestre el contenido del vector resultante del punto c).
	
	e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
	 valores que se ingresan como parámetros.
	
	f. Un módulo que muestre el contenido del vector resultante del punto e).
	
	g. Un módulo que retorne la información (ordenada por código de producto de menor a
	 mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
	
	h. Un módulo que muestre la información obtenida en el punto g).
}
const
	dimF = 50;
type
	rang1 = 1..dimF;
	codigo = 1..15;
	cantRang = 0..99;
	
	venta = record
		dia : integer;
		cod : codigo;
		cantVendido : cantRang;
	end;
		
	
	Ventas =array[rang1]of venta;

procedure leerVenta(var v:venta);
begin
	randomize;
	readln(v.dia);
	if(v.dia <> 0)then begin
		v.cod := random(15);
		readln(v.cantVendido);
	end;
end;

procedure cargarVector(var v:Ventas; var dl:integer);
var
	ven : venta;
begin
	leerVenta(ven);
	while(ven.dia <>0)and(dl<dimF)do begin
		dl:=dl+1;
		v[dl] := ven;
		if (dl<>dimF)then leerVenta(ven);
	end;
end;

procedure mostrarVector(v:Ventas; dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do begin
		writeln(v[i].dia);
		writeln(v[i].cod);
		writeln(v[i].cantVendido);
		writeln('');
	end;
end;

procedure ordenarInsercion(var v:Ventas; dl:integer);
var
	aux:venta; i,j:integer;
begin
	for i:=2 to dl do begin
		aux := v[i];
		
	end;

end;



VAR
	v:Ventas;
	dl:integer;
BEGIN
	dl:=0;
	cargarVector(v,dl);
	mostrarVector(v,dl);
END.
