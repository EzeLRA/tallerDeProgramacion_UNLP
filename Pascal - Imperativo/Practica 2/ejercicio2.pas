program ejercicio2;
{
	Escribir un programa que:
	
	a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
	 “random” en el rango 100-200. Finalizar con el número 100.
	
	b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
	 mismo orden que están almacenados.
	
	c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
	 la lista en orden inverso al que están almacenados.
	
	d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
	 valor de la lista.
	
	e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
	 verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}

const
	min = 100;
	max = 200;
	corte = 100;
type
	lista =^ nodo;
	nodo = record
		dat : integer;
		sig : lista;
	end;

procedure generarListaAux(var l:lista);
var
	nuevo:lista;
	i:integer;
begin
	for i:=1 to 10 do begin
		new(nuevo);
		nuevo^.dat := i;
		nuevo^.sig := l;
		l:=nuevo;
	end;
end;


procedure generarLista(var l:lista);	//A
var
	nuevo:lista;
	valor:integer;
begin
	valor := min + random(max-min+1);
	if(valor <> corte)then begin
		new(nuevo);
		nuevo^.dat := valor;
		nuevo^.sig := l;
		l:=nuevo;
		generarLista(l);
	end;
end;



procedure imprimirLista1(l:lista);	//C
begin
	if(l<>nil)then begin
		writeln(l^.dat);
		imprimirLista1(l^.sig);
	end;
end;

procedure imprimirLista2(l:lista);	//B
begin
	if(l<>nil)then begin
		imprimirLista2(l^.sig);
		writeln(l^.dat);
	end;
end;

procedure procesarMinimo(l:lista; var m:integer);
begin
	if(l<>nil)then begin
		if(m>l^.dat)then m:= l^.dat;
		procesarMinimo(l^.sig,m);
	end;
end;

function obtenerMinimo(l:lista):integer;
var
	m:integer;
begin
	m:=9999;
	procesarMinimo(l,m);
	obtenerMinimo := m;
end;

//Revisar

function buscarValor(l:lista; valor: integer): boolean;	//E
begin
	if(l<>nil)then begin
		if(valor = l^.dat)then BuscarValor:=true
		else BuscarValor:= BuscarValor(l^.sig,valor);
	end else BuscarValor:=false;
end; 



VAR
	l:lista;
	num:integer;
BEGIN
	randomize;
	l:=nil;
	generarLista(l);				//A
	imprimirLista2(l);				//B	Muestra desde el primero al ultimo
	writeln('');
	imprimirLista1(l);				//C	Muestra desde el ultimo al primero
	writeln('');
	writeln(obtenerMinimo(l));		//D
	writeln('');
	readln(num);
	writeln(buscarValor(l,num));	//E
END.
