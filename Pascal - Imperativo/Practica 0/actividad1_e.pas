program actividad1_e;
var
	a,b,f,ale:integer;
begin
	randomize;
	readln(f);
	readln(a);
	readln(b);
	
	ale := a + random(b - a + 1);
	while(ale <> f)do begin
		writeln(ale);
		ale := a + random(b - a + 1);
	end;
	
	writeln('termino en: ',ale);
	
end.
