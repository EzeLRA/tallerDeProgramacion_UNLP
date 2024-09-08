program ejercicio7;

{
	La municipalidad de La Plata necesita un sistema que le permita recolectar las denuncias realizadas por los ciudadanos.
	Teniendo en cuenta que las denuncias las puede hacer cualquier ciudadano , debera proporcionar categoria de denuncia
	(1:corte de luz en la via publica,2:auto mal estacionado,3:recoleccion de residuos,4:ruidos molestos,5:semaforo roto,6:bache en la calle),
	su DNI,la direccion,la direccion(Nº de calle y Nº de altura) y el mes , dia y la hora.
	
	Implementar en pascal:
	
	A. Un modulo que genere el alta de todas las denuncias almacenando toda la informacion en una estructura agrupada por categoria
	y ordenada por numero de calle. La carga finaliza hasta leer el DNI igual a cero.
	
	//Faltan incisos ; No se vio en el anio 2024 el conceptop de Merge
}
const
	dimF = 6;
type
	categoriasDenuncia = 1..dimF;
	meses = 1..12;
	dias = 1..31;
	horas = 0..23;
	
	denuncia = record
		DNI : integer;
		categoria : categoriasDenuncia;
		numCalle : integer;
		numAltura : integer;
		mes : meses;
		dia : dias;
		hora : horas;
	end;
	
	lista =^ nodo;
	nodo = record
		dat : denuncia;
		sig : lista;
	end;
	
	vectorCategorias = array[categoriasDenuncia]of lista;

procedure leerDenuncias(var d:denuncia);
begin
	readln(d.DNI);
	if(d.DNI > 0)then begin
		readln(d.categoria);
		readln(d.numCalle);
		readln(d.numAltura);
		readln(d.mes);
		readln(d.dia);
		readln(d.hora);
	end;
end;

procedure insertarOrdenado(var l:lista; d:denuncia);
var
	nuevo,act,ant : lista;
begin
	new(nuevo);
	nuevo^.dat := d;
	act := l;
	ant := act;
	
	while(act <> nil)and(act^.dat.numCalle > d.numCalle)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = ant)then
		l := nuevo
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure iniciarV(var v:vectorCategorias);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

//MODULO A

procedure cargarVector(var v:vectorCategorias);
var
	d:denuncia;
begin
	leerDenuncias(d);
	while(d.DNI > 0)do begin
		insertarOrdenado(v[d.categoria],d);
		leerDenuncias(d);
	end;
end;



VAR
	v:vectorCategorias;
	
BEGIN
	iniciarV(v);
	cargarVector(v);	//A
	
END.
