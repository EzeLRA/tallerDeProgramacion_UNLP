program ejercicio4;
const
	min = 100;
	max = 150;
	num = 120;
type
	lista =^ nodo;
	nodo = record
		dat : integer;
		sig : lista;
	end;

procedure insertarOrdenado(var l:lista; elem:integer);
var
	act,ant,nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat:=elem;
	nuevo^.sig:=nil;
	
	act:=l;
	ant:=act;
	
	while(act <> nil)and(elem>act^.dat)do begin
		ant := act;
		act := act^.sig;
	end;
	
	if(act = ant)then begin
		l:= nuevo;
	end else begin
		ant^.sig := nuevo;
		nuevo^.sig := act;
	end;
	
end;

procedure cargarOrdenado(var l:lista);
var
	elem:integer;
begin
	elem := min + random(max-min+1);
	while(elem <> num)do begin
		insertarOrdenado(l,elem);
		elem := min + random(max-min+1);
	end;
end;

procedure imprimirOrdenado(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dat);
		l := l^.sig;
	end;
end;

function buscarElementoOrdenado(l:lista; elem:integer):boolean;
var
	cumple:boolean;
begin
	cumple:=false;
	while(l<>nil)and(l^.dat < elem)do
		l := l^.sig;
	cumple := (l<>nil)and(l^.dat = elem);
	buscarElementoOrdenado := cumple;
end;

var
	l:lista;
	elem:integer;
begin
	randomize;
	l:=nil;
	cargarOrdenado(l);
	imprimirOrdenado(l);
	
	readln(elem);
	writeln(buscarElementoOrdenado(l,elem));
end.
