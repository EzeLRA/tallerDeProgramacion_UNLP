program actividad1_d;
var 
	ale,i,n,a,b: integer;
begin
	randomize;
	
	readln(n);
	readln(a);	//minimo
	readln(b);	//maximo
	
	for i:=1 to n do begin
		ale := a + random(b - a + 1);	// minimo + (maximo - minimo + 1) "Se suma 1 porque la instruccion random devuelve numeros del 0 a N"
		writeln(ale);
	end;
	
end.
