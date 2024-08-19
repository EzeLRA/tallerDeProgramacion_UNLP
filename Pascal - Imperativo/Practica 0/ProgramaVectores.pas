program ProgramaVectores;
const
	dimF = 50;
type
	Vector = array[1..dimF]of integer;

procedure cargarVector(var V:Vector; var dL:integer ; min,max:integer);
var
	ale:integer;
begin
	ale := min + random(max - min + 1);
	while(dL < dimF)and(ale <> 0)do begin
		dL := dL + 1;
		V[dL] := ale;
		ale := min + random(max - min + 1);
	end;
end;

procedure imprimirAdelante(V:Vector; dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do
		writeln(V[i]);
end;

procedure imprimirAtras(V:Vector; dl:integer);
var
	i:integer;
begin
	for i:=dl downto 1 do
		writeln(V[i]);
end;

var
	V:Vector;	dl:integer;
begin
	randomize;
	dl := 0;
	cargarVector(V,dl,0,20);
	imprimirAdelante(V,dl);
	writeln('');
	imprimirAtras(V,dl);
end.
