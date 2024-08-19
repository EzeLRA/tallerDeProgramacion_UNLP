program ejercicio3.pas;

procedure informarHasta();
var
	x:String;
begin
	readln(x);
	if(x <> 'x')then begin
		writeln('hola');
		informarHasta();
	end;
end;

BEGIN
	informarHasta();
END.
