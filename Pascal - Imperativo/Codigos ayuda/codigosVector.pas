program practicaVectores;
const
	dimF = 5;
type
	vector = array[1..dimF]of integer;

procedure agregarElem(var v:vector; var dl:integer; num:integer);
begin
	if(dl<dimF)then begin
		dl := dl + 1;
		v[dl] := num;
	end;
end;

procedure cargarVector(var v:vector; var dl:integer);
var
	num:integer;
begin
	readln(num);
	while(num >= 0)and(dl < dimF)do begin
		agregarElem(v,dl,num);
		if (dl < dimF)then readln(num);
	end;
end;

procedure cargarVector2(var v:vector; var dl:integer);
var
	i,num:integer;
begin
	for i:=1 to dimF do begin
		num := random(10) + 1;
		agregarElem(v,dl,num);
	end;
end;

procedure ordenarSeleccion(var v:vector; dl:integer);
var
	pos,i,j:integer;
	aux:integer;
begin
	for i:=1 to dl-1 do begin
		pos := i;
		for j:=i to dl do
			if(v[i] < v[j])then pos := j;
		aux := v[i];
		v[i] := v[pos];
		v[pos] := aux;
	end;
end;

procedure ordenarInsercion(var v:vector; dimL:integer);
var 
	i, j, actual: integer;
begin

	for i:= 2 to dimL do begin
   		actual:=v[i];
   		j:= i-1;
   		while (j > 0) and (v[j] > actual) do begin
     			v[j+1]:=v[j];
     			j := j-1;
     		end;
		v[j+1] := actual;
	end;
end;

function BusquedaBinaria(var v:vector; dimL,x:integer):boolean;
Var
	pri, ult, medio: integer;
Begin
    pri := 1;
    ult := dimL;
    medio := (pri + ult) div 2;
    While (pri <= ult) and (x <> v [medio]) do begin
		If (x < v [ medio ]) then
			ult:= medio -1
        else
            pri:= medio+1 ;
        medio := (pri + ult) div 2;
    end;
    BusquedaBinaria := (x = v[medio]);
End ;


procedure imprimirVector(v:vector; dl:integer);
var
	i:integer;
begin
	for i:= 1 to dl do
		writeln(v[i]);
end;

VAR
	v:vector;
	dl:integer;
	num:integer;
BEGIN
	randomize;
	
	dl:=0;
	cargarVector2(v,dl);
	ordenarSeleccion(v,dl);
	writeln;
	imprimirVector(v,dl);
	
	//writeln;
	//readln(num);
	//writeln(BusquedaBinaria(v,dl,num));
	
END.
