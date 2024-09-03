program ejercicio1;
{
	El administrador de un edificio de oficinas tiene la información del pago de las expensas
	de dichas oficinas. Implementar un programa con:
	a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
	administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
	propietario y valor de la expensa. La lectura finaliza cuando llega el código de
	identificación 0.
	b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
	código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
	vistos en la cursada.
	c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
	generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
	retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
	Luego el programa debe informar el DNI del propietario o un cartel indicando que no
	se encontró la oficina.
	d) Un módulo recursivo que retorne el monto total de las expensas.
}

const
  dimF = 3;

type
  
  oficina = record
    codigo : integer;
    DNIpropietario : integer;
    valorExpensa : real;
  end;
  
  vector = array[1..dimF]of oficina;
  
procedure leerOficina(var o:oficina);
begin
  readln(o.codigo);
  if(o.codigo > 0)then begin
    readln(o.DNIpropietario);
    readln(o.valorExpensa);
   end;
end;

procedure insertarElemV(var v:vector; var dl:integer; o:oficina);
begin
  if(dl < dimF)then begin
    dl := dl + 1;
    v[dl] := o;
  end;
end;

//MODULO OPCIONAL
procedure generarOficina(var o:oficina);
begin
	o.codigo := random(100);
	if(o.codigo > 0)then begin
		o.DNIpropietario := random(100);
		o.valorExpensa := random(100) * 0.2 ;
	end;
end;

procedure imprimirVector(v:vector; dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do begin
		writeln(v[i].codigo);
		writeln(v[i].DNIpropietario);
		writeln(v[i].valorExpensa :4:3);
		writeln;
	end;
end;

//MODULO A

procedure cargarVector(var v:vector; var dl:integer);
var
  o:oficina;
begin
  //leerOficina(o);
  generarOficina(o);
  while(o.codigo > 0)and(dl<dimF)do begin
    insertarElemV(v,dl,o);
    if(o.codigo > 0)then generarOficina(o);	//leerOficina(o);
  end;
end;

//MODULO B 

procedure ordenarVector(var v:vector; dl:integer);
var
	pos,i,j:integer;
	aux : oficina;
begin
	for i:=1 to dl-1 do begin
		pos := i; //Por precaucion ante ningun desplazamiento
		for j:=i to dl do begin
			if(v[i].codigo > v[j].codigo)then pos:=j;
		end;
		aux := v[i];
		v[i] := v[pos];
		v[pos] := aux;
	end;
end;

//MODULO C

function busquedaDicotomica(v:vector; dl:integer; cod:integer):integer;
var
	inf,sup,med:integer;
begin
	inf:=1;
	sup:=dl;
	med:= (inf + sup) DIV 2;
	while(v[med].codigo <> cod)and(inf<=sup)do begin
		if(v[med].codigo < cod)then
			inf := med + 1
		else
			sup := med - 1;
		med := (inf + sup) DIV 2;
	end;
	if(v[med].codigo = cod)then
		busquedaDicotomica := med
	else
		busquedaDicotomica := 0;
end;

//MODULO D
function montoTotal(v:vector; dl:integer):real;
begin
	if(dl>1)then
		montoTotal := montoTotal(v,dl-1) + v[dl].valorExpensa
	else
		montoTotal := v[dl].valorExpensa;
end;

VAR
  v:vector;
  pos,dl:integer;
  
BEGIN
	randomize;
	dl:=0;
	cargarVector(v,dl);				   //A
	ordenarVector(v,dl);			   //B
	imprimirVector(v,dl);
	writeln;
	pos := busquedaDicotomica(v,dl,20);//C
	if(pos = 0)then
		writeln('No se encontro la oficina')
	else
		writeln('DNI propietario: ',v[pos].DNIpropietario);
	writeln(montoTotal(v,dl) :4:4);		   //D
END.
