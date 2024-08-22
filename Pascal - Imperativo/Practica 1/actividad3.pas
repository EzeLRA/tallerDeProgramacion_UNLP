program actividad3;

{
	Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
	 diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
	 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
	 promedio otorgado por las críticas.
	
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	
	a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
	 género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
	 código de la película -1.
	
	b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
	 obtenido entre todas las críticas, a partir de la estructura generada en a)..
	
	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
	 métodos vistos en la teoría.
	
	d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
	 del vector obtenido en el punto c).
}
const
	dimF = 8;
type
	codigosGeneros = 1..dimF;
	
	pelicula = record
		codigo : integer;
		codGenero : codigosGeneros;
		puntajePromedio : real;
	end;
	
	listaPeliculas =^ nodo;
	nodo = record
		dat : pelicula;
		sig : listaPeliculas;
	end;
	
	vectorGeneros =array[codigosGeneros]of listaPeliculas;	//A
	
	puntajeMaxGenCod = array[codigosGeneros]of pelicula;	//B

procedure iniciarV(var V:vectorGeneros);
var
	i:integer;
begin
	for i:=1 to dimF do
		V[i] := nil;
end;

procedure leerPelicula(var p:pelicula);
begin
	readln(p.codigo);
	if(p.codigo > -1)then begin
		readln(p.codGenero);
		readln(p.puntajePromedio);
	end;
end;

procedure agregarAtras(var L,ultL:listaPeliculas; p:pelicula);
var
	nuevo:listaPeliculas;
begin
	new(nuevo);
	nuevo^.dat := p;
	nuevo^.sig := nil;
	
	if(L=nil)then
		L:=nuevo
	else
		ultL^.sig := nuevo;
	ultL:=nuevo;
	
end;

procedure cargarV(var v:vectorGeneros);	//A 
var
	i:integer;
	p:pelicula;
	ultL:vectorGeneros;
begin
	//Inicializa "ult" para el algoritmo de agregarAtras con "ult"
	for i:=1 to dimF do
		ultL[i] := v[i];
		
	leerPelicula(p);
	while(p.codigo > -1)do begin
		agregarAtras(v[p.codGenero],ultL[p.codGenero],p);
		leerPelicula(p);
	end;
end;

procedure procesarLista(l:listaPeliculas; var pM:pelicula);
begin
	while(l <> nil)do begin
		if(pM.puntajePromedio < l^.dat.puntajePromedio)then begin
			pM := l^.dat;
		end;
		l := l^.sig;
	end;
end;

procedure procesarV(var v2:puntajeMaxGenCod; v:vectorGeneros);	//B
var
	i:integer;
	pM:pelicula;
begin
	for i:=1 to dimF do begin
		pM.codigo := 0;
		pM.puntajePromedio := -9999;
		procesarLista(v[i],pM);
		v2[i] := pM;
	end;
end;

procedure ordenarInsercion(var v:puntajeMaxGenCod);		//C
var
	i,j:integer; actual:pelicula;
begin
	for i:= 2 to dimF do begin 
		actual:= v[i];
		j:= i-1; 
		while (j > 0)and(v[j].puntajePromedio > actual.puntajePromedio) do      
		begin
			v[j+1]:= v[j];
			j:= j - 1;                  
        end;  
		v[j+1]:= actual; 
	end;
end;


VAR
	v:vectorGeneros;
	v2:puntajeMaxGenCod;
BEGIN
	iniciarV(v);
	cargarV(v);						//A
	procesarV(v2,v);				//B
	ordenarInsercion(v2);			//C
	writeln(v2[1].codigo);			//D
	writeln(v2[dimF].codigo);		//D
	
END.
