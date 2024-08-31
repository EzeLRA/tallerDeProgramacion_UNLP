program ejercicio2;
{	
	Con el programa de la clase pasada
	
	Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
	necesario para:

	i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
	 retorne dicho valor.
	
	ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
	 módulo recursivo que retorne dicho socio.
	
	iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
	 invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.

	iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
	 entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
	 leídos y retorne la cantidad solicitada.
}

type 
     rangoEdad = 12..100;
     cadena15 = string [15];
     
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;


procedure GenerarArbol (var a: arbol);
{ 
	Modulo almacenador
}

  Procedure CargarSocio (var s: socio);
  var 
	vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  begin
    s.numero:= random (51) * 100;
    If (s.numero <> 0)
    then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;



var 
	unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 CargarSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;



procedure InformarSociosOrdenCreciente (a: arbol);
{ Informar los datos de los socios en orden creciente. OPCIONAL}
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if ((a <> nil) and (a^.HI <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HI);
    writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
    if ((a <> nil) and (a^.HD <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HD);
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

//Modulo 1
function ObtenerMax(a: arbol): integer;
begin
	if (a = nil) 
    then ObtenerMax:= 0
    else if (a^.HD = nil) then ObtenerMax:= a^.dato.numero
                          else ObtenerMax:= ObtenerMax(a^.HD)
end;

procedure informarMax(a:arbol);
var
	max:integer;
begin
	max := ObtenerMax(a);
	if(max=0)then
		writeln('Sin elementos')
	else
		writeln('Numero de Socio maximo: ',max);
	writeln;
end;

//Modulo 2
procedure ObtenerMinSocio(a: arbol; var s:socio);
begin
	if (a = nil) 
    then s.numero := 9999
    else if (a^.HI = nil) then s := a^.dato
                          else ObtenerMinSocio(a^.HI,s);
end;

procedure informarMinSocio(a:arbol);
var
	minS:socio;
begin
	ObtenerMinSocio(a,minS);
	if(minS.numero = 9999)then
		writeln('Arbol Vacio')
	else
		writeln ('Numero: ', minS.numero, ' Nombre: ', minS.nombre, ' Edad: ', minS.edad);
end;

//Modulo 3
function buscarNumero(a: arbol; num:integer):boolean; 
begin
	if (a = nil)then buscarNumero:= false
	else
		if(a^.dato.numero < num)and(a^.HD <> nil)then
			buscarNumero := buscarNumero(a^.HD,num)
		else if (a^.dato.numero > num)and(a^.HI <> nil)then
			buscarNumero := buscarNumero(a^.HI,num)
		else if (a^.dato.numero = num) then
			buscarNumero := true
		else 
			buscarNumero := false;
			
		//buscarNumero := (a^.dato.numero = num) OR buscarNumero(a^.HI,num) OR buscarNumero(a^.HD,num); Desventaja: Recorre todo el arbol(Siendo este ordenado)
end;

procedure InformarNumero_Existe(a:arbol; num:integer);
begin
	if(buscarNumero(a,num)=false)then
		writeln('No se encontro el numero')
	else
		writeln('Se encontro el numero');
	writeln;
end;

//Modulo 4
procedure contarNumerosRango(a: arbol; num1,num2:integer; var cant:integer); 
begin
	if(a <> nil)then begin
		
		if((a^.dato.numero >= num1)and(a^.dato.numero <= num2))then
			cant := cant + 1;
		contarNumerosRango(a^.HI,num1,num2,cant);
		contarNumerosRango(a^.HD,num1,num2,cant);
		
	end;
			
end;


VAR
	a:arbol;
	cant,num,num1,num2:integer;
BEGIN

	a:=nil;
	cant := 0;
	
	GenerarArbol(a);
	InformarSociosOrdenCreciente(a);
	
	informarMax(a);	//1
	
	informarMinSocio(a);	//2
	
	writeln;
	readln(num);
	
	InformarNumero_Existe(a,num);	//3
	
	readln(num1); readln(num2);
	
	contarNumerosRango(a,num1,num2,cant);	//4
	
	writeln;
	writeln(cant);
	
END.

