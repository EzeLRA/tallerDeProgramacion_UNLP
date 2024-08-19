program rand_actividad1;
var 
	ale,i: integer;
begin
	randomize;
	for i:=1 to 20 do begin
		ale := random (100);
		writeln ('N:',i);
		writeln ('Numero aleatorio: ', ale);
	end;
end.
