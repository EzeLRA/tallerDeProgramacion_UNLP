program pruebaArboles;
type
	arbol =^ nodo;
	nodo = record
		dat : integer;
		HI : arbol;
		HD : arbol;
	end;

//Insercion
procedure agregarElem(var a:arbol; x:integer);
begin
	if(a = nil)then begin
		new(a);
		a^.dat:= x;
		a^.HI := nil;
		a^.HD := nil;
	end else if(a^.dat > x)then
		agregarElem(a^.HI,x)
	else
		agregarElem(a^.HD,x);
end;

//Tipos de recorridos
procedure preorden(a:arbol);
begin
	if(a<>nil)then begin
		writeln(a^.dat);
		preorden(a^.HI);
		preorden(a^.HD);
	end;
end;

procedure enorden(a:arbol);
begin
	if(a <> nil)then begin
		enorden(a^.HI);
		writeln(a^.dat);
		enorden(a^.HI);
	end;
end;

procedure postorden(a:arbol);
begin
	if(a<>nil)then begin
		preorden(a^.HI);
		preorden(a^.HD);
		writeln(a^.dat);
	end;
end;



VAR
	a: arbol;
	x:integer;
BEGIN
	a:=nil;
	randomize;
	
	for x:=1 to 10 do begin
		agregarElem(a,random(100));
	end;
	
	writeln('');
	preorden(a);
END.
