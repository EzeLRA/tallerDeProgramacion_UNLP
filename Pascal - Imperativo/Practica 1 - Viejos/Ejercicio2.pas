program ejercicio2.pas;
{	Implementar un programa que procese informacion de propiedades que estan a la venta en una inmobiliaria. Se pide:
* 	
* 	A.Implementar un modulo para almacenar en una estructura adecuada, las propiedades agrupadas por zona. Las propiedades de una misma zona
* 	 deben quedar ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el codigo, el tipo de propiedad y el precio
* 	 total. De cada propiedad se lee: zona(1 a 5),codigo de propiedad,tipo de propiedad, cantidad de metros cuadrados y precio del metro cuadrado.
* 	 La lectura finaliza cuando se ingresa el precio del metro cuadrado -1.
* 
* 	B.Implementar un modulo que reciba la estructura generada en A. , un numero de zona y un tipo de propiedad y retorne los codigos de las
* 	 propiedades del numero de la zona recibida y del tipo recibido.
* 
* }

type
	zona = 1..5;
	
	propiedad = record
		numeroZona : zona;
		codigo : integer;
		tipo : String;
		mts2Cant : real;
		precioMts2 : real;
	end;
	
	listaPropiedades =^ nodo;
	nodo = record
		dat : propiedad;
		precioTotal : real;
		sig : listaPropiedades;
	end;
	
	vectorZonas = array[zona]of listaPropiedades;
	
procedure leerPropiedad(var p:propiedad);
begin
	readln(p.numeroZona);
	readln(p.codigo);
	readln(p.tipo);
	readln(p.mts2Cant);
	readln(p.precioMts2);
end;

function calcularPrecioTotal(mts : real; precioMts : real):real;
begin
	calcularPrecioTotal := (mts * precioMts);
end;

procedure inicializarVector(var V:vectorZonas);
var
	i:integer;
begin
	for i:=1 to 5 do
		V[i] := nil;
end;

procedure insertarOrdenado(var L:listaPropiedades;p:propiedad);
var
	nuevo,pri,ant : listaPropiedades;
begin
	new(nuevo);
	nuevo^.dat := p;
	nuevo^.precioTotal := calcularPrecioTotal(p.mts2Cant,p.precioMts2);
	nuevo^.sig := L;
	
	pri := L;
	ant := pri;
	
	while(pri <> nil)and(p.tipo < pri^.dat.tipo)do begin
		ant := pri;
		pri := pri^.sig;
	end;
	if(pri = ant)then
		L := nuevo
	else begin
		ant^.sig := nuevo;
		nuevo^.sig := pri;
	end;
		
end;


//B
procedure InformarZonaYProp(zV:vectorZonas; n:zona ; t:String);
begin
	while(zV[n]<>nil)and(t < zV[n]^.dat.tipo)do begin
		zV[n] := zV[n]^.sig;
	end;
	while(zV[n]<>nil)and(t = zV[n]^.dat.tipo)do begin
		writeln(zV[n]^.dat.codigo);
		zV[n] := zV[n]^.sig;
	end;
end;

VAR
	zonasV: vectorZonas;
	p:propiedad;
	
	n:zona;
	t:String;
	
BEGIN
	inicializarVector(zonasV); //A
	leerPropiedad(p);
	
	while(p.precioMts2 <> -1)do begin
		insertarOrdenado(zonasV[p.numeroZona],p); //A
		leerPropiedad(p);
	end;
	
	//B
	readln(n);
	readln(t);
	InformarZonaYProp(zonasV,n,t);
END.
