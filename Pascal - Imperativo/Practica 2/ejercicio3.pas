program ejercicio3;
{
	Implementar un programa que invoque a los siguientes módulos.
	
	a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
	 y menores a 1550 (incluidos ambos).
	
	b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
	 en la práctica anterior)

	c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
	 encabezado:
	
	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
	Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
	en el vector.
}
const

	dimF= 20;

	min = 300;
	max = 1550;

type

	rang	= 1..dimF;

	Vector	= array[rang]of integer;




procedure cargarVector(var v:Vector; i:rang);
begin
	if(i<dimF)then begin
		v[i] := min + random(max - min + 1);
		cargarVector(v,i+1);
	end else if(i = dimF)then v[i] := min + random(max - min + 1);
end;

procedure imprimirV(v:Vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		writeln(v[i]);
end;


procedure ordenarInsercion(var v:Vector);		
var
	actual:integer; i,j:rang; 
begin
	for i:= 2 to dimF do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0)and(v[j] > actual) do      
		begin
			v[j+1]:= v[j];
			j:= j - 1;                  
        end;  
		v[j+1]:= actual; 
	end;
end;

procedure busquedaDicotomica(v: Vector; ini,fin:rang; dato:integer; var pos:integer);
var
	medio:rang;
begin
	
	medio := (ini +	fin) DIV 2;
	
	while(ini <= fin)and(dato <> v[medio])do begin
		if(dato < v[medio])then
			fin:=medio-1
		else ini:=medio+1;
		medio := (ini+fin) DIV 2;
	end;
	
	if(ini <= fin)and(dato = v[medio])then pos:=medio
	else pos:=-1;
	
end;


	
	
	
	
VAR
	v:Vector;
	x:integer;
	pos:integer;
BEGIN
	randomize;
	cargarVector(v,1);						//A
	imprimirV(v);
	writeln('');
	ordenarInsercion(v);					//B
	imprimirV(v);
	readln(x);
	busquedaDicotomica(v,1,dimF,x,pos);		//C
	writeln(pos);
END.
