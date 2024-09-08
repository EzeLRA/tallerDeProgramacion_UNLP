program recursivoVector;

const 
	dimF = 5;
type
	vector = array[1..dimF]of integer;
	
	
procedure iniciarV(var v:vector; i:integer);
begin
	if(i < dimF)then begin
		v[i] := 0;
		iniciarV(v,i+1);
	end;
end;	

procedure randomVector(var v:vector; i:integer);
begin
	if(i <= dimF)then begin
		v[i] := random(10) + 1;
		randomVector(v,i+1);
	end;
end;

function cerosCant(v:vector; i:integer):integer;
begin
	if(i <= dimF)then begin
		if(v[i] = 0)then cerosCant := 1 + cerosCant(v,i+1)
		else cerosCant := 0 + cerosCant(v,i+1);
	end else
		cerosCant := 0;
end;

procedure imprimirV(v:vector; i:integer);
begin
	if(i <= dimF)then begin
 		writeln(v[i]);
 		imprimirV(v,i+1);
 	end;
end;

function numerosPares(v:vector; i:integer):integer;
begin
	if(i <= dimF)then begin
		if((v[i]MOD 2) = 0)then numerosPares := 1 + numerosPares(v,i+1)
		else numerosPares := 0 + numerosPares(v,i+1);
	end else
		numerosPares := 0;
end;

function numerosImpares(v:vector; i:integer):integer;
begin
	if(i <= dimF)then begin
		if((v[i]MOD 2) = 1)then numerosImpares := 1 + numerosImpares(v,i+1)
		else numerosImpares := 0 + numerosImpares(v,i+1);
	end else
		numerosImpares := 0;
end;

VAR
	v : vector;
BEGIN
	randomize;
	iniciarV(v,1);
	randomVector(v,1);
	imprimirV(v,1);
	writeln;
	writeln(numerosImpares(v,1));
END.
