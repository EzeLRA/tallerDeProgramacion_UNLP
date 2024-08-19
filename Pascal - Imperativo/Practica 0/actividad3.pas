program ProgramaListas;
const
	min = 100;
	max = 150;
type
	lista =^ nodo;
	nodo = record
		dat : integer;
		sig : lista;
	end;

procedure agregarAdelante(var l:lista; elem:integer);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dat := elem;
	nuevo^.sig := l;
	l:=nuevo;
end;

procedure cargarLista(var l:lista);
var
	dat : integer;
begin
	dat := min + random(max-min+1);
	while(dat <> 120)do begin
		agregarAdelante(l,dat);
		dat := min + random(max-min+1);
	end;
end;

procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.dat);
		l:= l^.sig;
	end;
end;

function buscarElemento(l:lista; elem:integer):boolean;
var
	cumple : boolean;
begin
	cumple := false;
	while(l<>nil)and(cumple = false)do begin
		cumple := (l^.dat = elem); 
		l:= l^.sig;
	end;
	buscarElemento := cumple;
end;


var
	l:lista;
	elem:integer;
begin
	l := nil;
	randomize;
	
	cargarLista(l);
	imprimirLista(l);
	
	readln(elem);
	
	writeln(buscarElemento(l,elem));
	
end.
