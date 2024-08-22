program actividad2;
{
	El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
	 las expensas de dichas oficinas.
	
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
	 se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
	 finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

	b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
	 oficina.
	
	c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

const
	dimF = 300;
type
	oficina = record
		codIdentificacion : integer;
		dniPropietario : integer;
		valorExpensa : real;
	end;
	
	oficinas = array[1..dimF]of oficina;

procedure leerOficina(var o:oficina);
begin
	readln(o.codIdentificacion);
	if(o.codIdentificacion <> -1)then begin
		readln(o.dniPropietario);
		readln(o.valorExpensa);
	end;
end;

procedure cargarOficinas(var v:oficinas; var dl:integer);	//A
var
	o:oficina;
begin
	leerOficina(o);
	while(o.codIdentificacion <> -1)and(dl<dimF)do begin
		dl := dl + 1;
		v[dl] := o;
		if(dl<dimF)then leerOficina(o);
	end;
end;

procedure mostrarOficinas(v:oficinas; dl:integer);	//Opcional
var
	i:integer;
begin
	for i:= 1 to dl do begin
		writeln(v[i].codIdentificacion);
		writeln(v[i].dniPropietario);
		writeln(v[i].valorExpensa);
	end;
end;

procedure ordenarInsercion(var v:oficinas; dl:integer); //B
var
	i,j:integer;
	actual: oficina;		
begin
	for i:= 2 to dl do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0)and(v[j].codIdentificacion > actual.codIdentificacion) do      
		begin
			v[j+1]:= v[j];
			j:= j - 1;                  
        end;  
		v[j+1]:= actual; 
	end;
end;

Procedure ordenarSeleccion(var v:oficinas; dl:integer);		//C
var 
	i, j, pos:integer; item:oficina;			
begin
	for i:=1 to (dl-1) do begin {busca el mínimo y guarda en pos la posición}
		pos := i;
        for j := i+1 to dl do
			if v[j].codIdentificacion < v[pos].codIdentificacion then pos:=j;

        {intercambia v[i] y v[p]}
        item := v[ pos ];   
        v[ pos ] := v[ i ];   
        v[ i ] := item;
	end;
end;






VAR
	V:oficinas;
	dl:integer;

BEGIN
	dl:=0;
	cargarOficinas(V,dl);	//A
	writeln('');
	mostrarOficinas(V,dl);
	ordenarInsercion(V,dl);	//B
	writeln('');
	mostrarOficinas(V,dl);
	ordenarSeleccion(V,dl); //C
	writeln('');
	mostrarOficinas(V,dl);
END.
