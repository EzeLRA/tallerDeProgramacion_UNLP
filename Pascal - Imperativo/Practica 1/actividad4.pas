program actividad4;
{
	Una librería requiere el procesamiento de la información de sus productos. De cada
	 producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
	
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	
	a. Lea los datos de los productos y los almacene ordenados por código de producto y
	 agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
	 cuando se lee el precio 0.
	
	b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
	
	c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
	 puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
	 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
	
	d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
	 métodos vistos en la teoría.
	
	e. Muestre los precios del vector resultante del punto d).
	
	f. Calcule el promedio de los precios del vector resultante del punto d).
}
const
	dimF = 8;
	dimF2 = 30;
type
	codigoRubro = 1..dimF;
	
	producto = record
		codigo:integer;
		codRubro:codigoRubro;
		precio:real;
	end;
	
	lista =^ nodo;
	nodo = record
		dat:producto;
		sig:lista;
	end;
	
	vectorRubros = array[codigoRubro]of lista;
	
	vectorRubro3 = array[1..dimF2]of producto;
	
procedure inicializarV(var v:vectorRubros);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure insertarOrdenado(var l:lista; p:producto);
var
	nuevo,ant,act:lista;
begin
	new(nuevo);
	nuevo^.dat:=p;
	
	act:=l;
	ant:=act;
	
	while(act<>nil)and(act^.dat.codigo > p.codigo)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act=ant)then
		l:=nuevo
	else
		ant^.sig := nuevo;
	
	nuevo^.sig := act;
	
end;

procedure leerProducto(var p:producto);
begin
	readln(p.precio);
	if(p.precio > 0)then begin
		readln(p.codRubro);
		readln(p.codigo);
	end;
end;

procedure cargarProductos(var v:vectorRubros);	//A
var
	p:producto;
begin
	leerProducto(p);
	while(p.precio > 0)do begin
		insertarOrdenado(v[p.codRubro],p);
		leerProducto(p);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dat.codigo);
		l:=l^.sig;
	end;
end;

procedure mostrarCodigosRubro(v:vectorRubros);	//B
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln('Rubro: ',i);
		writeln('Codigos:');
		imprimirLista(v[i]);
	end;
end;

procedure generarVector(var v2:vectorRubro3; var dl:integer; l:lista);	//C
begin
	while(dl<dimF)and(l<>nil)do begin
		dl:=dl+1;
		v2[dl] := l^.dat;
		l := l^.sig;
	end;
end;

procedure ordenarInsercion(var v:vectorRubro3; dl:integer); //D
var
	j,i:integer;
	actual:producto;
begin
	for i:=2 to dl do begin
		actual:= v[i];
		j:= i-1; 
		while (j > 0)and(v[j].precio > actual.precio) do      
		begin
			v[j+1]:= v[j];
			j:= j - 1;                  
        end;  
		v[j+1]:= actual;
	end;
end;

procedure imprimirVector(v:vectorRubro3; dl:integer);	//E
var
	i:integer;
begin
	for i:= 1 to dl do
		writeln(v[i].precio);
end;

function obtenerPromedio(v:vectorRubro3; dl:integer):real;	//F
var
	cant,i:integer;
	total:real;
begin
	cant:=0;
	total:=0;
	for i:= 1 to dl do begin
		total := total + v[i].precio;
		cant := cant + 1;
	end;
	obtenerPromedio:= total / cant;
end;




VAR
	v:vectorRubros;
	v2:vectorRubro3;
	dl2:integer;
BEGIN
	inicializarV(v);
	cargarProductos(v);					//A
	mostrarCodigosRubro(v);				//B
	
	dl2:=0;
	generarVector(v2,dl2,v[3]);			//C
	
	ordenarInsercion(v2,dl2);			//D
	
	imprimirVector(v2,dl2);				//E
	
	writeln(obtenerPromedio(v2,dl2));	//F
END.
