program ejercicio4;
{
	Una biblioteca nos ha encargado procesar la información de los préstamos realizados
	 durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
	 y mes del préstamo y cantidad de días prestados. Implementar un programa con:
	
	a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
	 los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
	 ser eficientes para buscar por ISBN.
	
		i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
		 insertarlos a la derecha.
		
		ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
		 (prestar atención sobre los datos que se almacenan).
	
	b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
	 grande.

	c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
	 pequeño.
	
	d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
	 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
	
	e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
	 módulo debe retornar la cantidad de préstamos realizados a dicho socio.
	
	f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
	 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
	 que se prestó.

	g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
	 ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
	 que se prestó.

	h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
	
	i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
	 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
	 comprendidos entre los dos valores recibidos (incluidos).
	
	j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
	 módulo debe retornar la cantidad total de préstamos realizados a los ISBN
	 comprendidos entre los dos valores recibidos (incluidos).
}
type
	
	dias = 1..31;
	meses = 1..12;

	prestamo = record
		ISBN_libro : integer;
		numeroSocio : integer;
		dia : dias;
		mes : meses;
		diasPrestado : integer;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : prestamo;
		HI : arbol;
		HD : arbol;
	end;
	
	lista =^ nodoL;
	nodoL = record
		dat : prestamo;
		sig : lista;
	end;
	
	arbol2 =^ nodo2;
	nodo2 = record
		dat : lista;
		HI : arbol2;
		HD : arbol2;
	end;
	
	arbol3 =^ nodo3;
	nodo3 = record
		ISBN_libro : integer;
		cantPrestado : integer;
		HI : arbol3;
		HD : arbol3;
	end;

//MODULO OPCIONAL
procedure generarPrestamo(var p:prestamo);
begin
	p.ISBN_libro := random(100);
	if(p.ISBN_libro <> 0)then begin
		p.numeroSocio := random(100);
		p.dia := random(31) + 1;
		p.mes := random(12) + 1;
		p.diasPrestado := random(100);
	end;
end;

procedure leerPrestamo(var p:prestamo);
begin
	readln(p.ISBN_libro);
	if(p.ISBN_libro > 0)then begin
		readln(p.numeroSocio);
		readln(p.dia);
		readln(p.mes);
		readln(p.diasPrestado);
	end;
end;

//MODULO A - 1

procedure insertarElem(var a:arbol; p:prestamo);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := p;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.ISBN_libro > p.ISBN_libro)then
			insertarElem(a^.HI,p)
		else
			insertarElem(a^.HD,p);
	end;
end;

//MODULO A - 2

procedure agregarAdelante(var l:lista; p:prestamo);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dat := p;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure insertarElem2(var a:arbol2; p:prestamo);
begin
	if(a = nil)then begin
		new(a);
		a^.dat := nil;
		agregarAdelante(a^.dat,p);
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat^.dat.ISBN_libro > p.ISBN_libro)then
			insertarElem2(a^.HI,p)
		else if(a^.dat^.dat.ISBN_libro < p.ISBN_libro)then
			insertarElem2(a^.HD,p)
		else
			agregarAdelante(a^.dat,p);
	end;
end;




//MODULO A

procedure cargarPrestamos(var a:arbol; var a2:arbol2);
var
	p:prestamo;
begin
	generarPrestamo(p);
	//leerPrestamo(p);
	while(p.ISBN_libro > 0)do begin
		insertarElem(a,p);	//1
		insertarElem2(a2,p);//2
		generarPrestamo(p);
		//leerPrestamo(p);
	end;
end;

//MODULO B

function retornarISBN_MAX(a:arbol):integer;
begin
	if(a=nil)then retornarISBN_MAX:= -1
	else if(a^.HD = nil)then retornarISBN_MAX := a^.dat.ISBN_libro
	else retornarISBN_MAX := retornarISBN_MAX(a^.HD);
end;

//MODULO C

function retornarISBN_MIN(a:arbol2):integer;
begin
	if(a=nil)then retornarISBN_MIN:= 9999
	else if(a^.HI = nil)then retornarISBN_MIN := a^.dat^.dat.ISBN_libro
	else retornarISBN_MIN := retornarISBN_MIN(a^.HI);
end;

//MODULO D
function cantidadPrestamosSocio(a:arbol; socioNum:integer):integer;
begin
	if(a=nil)then cantidadPrestamosSocio := 0
	else begin
		if(a^.dat.numeroSocio = socioNum)then cantidadPrestamosSocio := 1 + cantidadPrestamosSocio(a^.HI,socioNum) + cantidadPrestamosSocio(a^.HD,socioNum)
		else cantidadPrestamosSocio := cantidadPrestamosSocio(a^.HI,socioNum) + cantidadPrestamosSocio(a^.HD,socioNum)
	end;
end;

//MODULO E

function contarPrestamos(l:lista):integer;
var
	cant:integer;
begin
	cant := 0;
	while(l <> nil)do begin
		cant := cant + 1;
		l := l^.sig;
	end;
	contarPrestamos	:= cant;
end;

function cantidadPrestamosSocio2(a:arbol2; socioNum:integer):integer;
begin
	if(a=nil)then cantidadPrestamosSocio2 := 0
	else begin
		if(a^.dat^.dat.numeroSocio = socioNum)then cantidadPrestamosSocio2 := contarPrestamos(a^.dat) + cantidadPrestamosSocio2(a^.HI,socioNum) + cantidadPrestamosSocio2(a^.HD,socioNum)
		else cantidadPrestamosSocio2 := cantidadPrestamosSocio2(a^.HI,socioNum) + cantidadPrestamosSocio2(a^.HD,socioNum)
	end;
end;

//MODULO F
procedure insertarElem3(var a:arbol3; p:prestamo);
begin
	if(a = nil)then begin
		new(a);
		a^.ISBN_libro := p.ISBN_libro;
		a^.cantPrestado := 1;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.ISBN_libro > p.ISBN_libro)then
			insertarElem3(a^.HI,p)
		else if(a^.ISBN_libro < p.ISBN_libro)then
			insertarElem3(a^.HD,p)
		else a^.cantPrestado := a^.cantPrestado + 1;
	end;
end;

procedure procesarArbol(a:arbol; var a3:arbol3);
begin
	if(a <> nil)then begin
		insertarElem3(a3,a^.dat);
		procesarArbol(a^.HI,a3);
		procesarArbol(a^.HD,a3);
	end;
end;

//MODULO G

procedure insertarElem4(var a:arbol3; isbnLibro,cant:integer);
begin
	if(a = nil)then begin
		new(a);
		a^.ISBN_libro := isbnLibro;
		a^.cantPrestado := cant;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.ISBN_libro > isbnLibro)then
			insertarElem4(a^.HI,isbnLibro,cant)
		else if(a^.ISBN_libro < isbnLibro)then
			insertarElem4(a^.HD,isbnLibro,cant);
	end;
end;

procedure procesarArbol2(a:arbol2; var a4:arbol3);
begin
	if(a <> nil)then begin
		insertarElem4(a4,a^.dat^.dat.ISBN_libro,contarPrestamos(a^.dat));
		procesarArbol2(a^.HI,a4);
		procesarArbol2(a^.HD,a4);
	end;
end;

//MODULO H
procedure imprimirArbolM_D(a:arbol3);
begin
	if(a<>nil)then begin
		imprimirArbolM_D(a^.HI);
		writeln(a^.ISBN_libro);
		writeln(a^.cantPrestado);
		writeln;
		imprimirArbolM_D(a^.HD);
	end;
end;

//MODULO I
function obtenerCantTotalRango(a:arbol; cod1,cod2:integer):integer;
begin
	if(a = nil)then obtenerCantTotalRango := 0
	else begin
		if(a^.dat.ISBN_libro >= cod1)and(a^.dat.ISBN_libro <= cod2)then
		//Recuenta desde los parametros
			obtenerCantTotalRango := 1 + obtenerCantTotalRango(a^.HI,cod1,cod2) + obtenerCantTotalRango(a^.HD,cod1,cod2)
		else if(a^.dat.ISBN_libro < cod1)then
		//Valora el limite inferior
			obtenerCantTotalRango := obtenerCantTotalRango(a^.HD,cod1,cod2)
		else if(a^.dat.ISBN_libro > cod2)then
		//Valora el limite superior
			obtenerCantTotalRango := obtenerCantTotalRango(a^.HI,cod1,cod2);
	end;
end;

//MODULO J
function obtenerCantTotalRango2(a:arbol2; cod1,cod2:integer):integer;
begin
	if(a = nil)then obtenerCantTotalRango2 := 0
	else begin
		if(a^.dat^.dat.ISBN_libro >= cod1)and(a^.dat^.dat.ISBN_libro <= cod2)then
		//Recuenta desde los parametros
			obtenerCantTotalRango2 := contarPrestamos(a^.dat) + obtenerCantTotalRango2(a^.HI,cod1,cod2) + obtenerCantTotalRango2(a^.HD,cod1,cod2)
		else if(a^.dat^.dat.ISBN_libro < cod1)then
		//Valora el limite inferior
			obtenerCantTotalRango2 := obtenerCantTotalRango2(a^.HD,cod1,cod2)
		else if(a^.dat^.dat.ISBN_libro > cod2)then
		//Valora el limite superior
			obtenerCantTotalRango2 := obtenerCantTotalRango2(a^.HI,cod1,cod2);
	end;
end;



VAR
	a:arbol;
	a2:arbol2;
	a3,a4:arbol3;
BEGIN
	randomize;

	a := nil;
	a2 := nil;
	a3 := nil;
	a4 := nil;
	
	cargarPrestamos(a,a2);	      		      //A
	writeln(retornarISBN_MAX(a)); 		      //B
	writeln(retornarISBN_MIN(a2));		      //C
	writeln(cantidadPrestamosSocio(a,60));    //D
	writeln(cantidadPrestamosSocio2(a2,50));  //E
	procesarArbol(a,a3);					  //F
	procesarArbol2(a2,a4);					  //G
	imprimirArbolM_D(a4);					  //H
	writeln(obtenerCantTotalRango(a,20,40));  //I
	writeln(obtenerCantTotalRango2(a2,20,40));//J
END.
