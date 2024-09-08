program ejecicio10;
{
	Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes.
	
	A. Implementar un modulo que lea informacion de las atenciones. De cada atencion se lee: DNI del paciente,numero de mes,
	y codigo de diagnostico(1 a 15). La lectura finaliza con el mes 0. 
	
	El modulo debe retornar dos estructuras de datos:
		1. Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe almacenarse la cantidad total de 
		atenciones recibidas.
		2. Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico.
		
	B. Implementar un modulo que reciba la estructura generada en a.1 , dos numeros de DNI y un valor entero X. Este modulo debe retornar
	la cantidad de pacientes con mas de X atenciones cuyos DNI estan entre los 2 numeros de DNI recibidos.
	
	C.  Implementar un modulo recursivo que reciba la estructura generada en a.2, y retorne la cantidad de diagnosticos para los cuales
	la cantidad de atenciones fue cero.
}
const
	dimF = 15;
type

	codigosDiagnostico = 1..dimF;
	
	meses = 1..12;
	
	atencion = record
		DNI_Paciente : integer;
		mes : meses;
		codigoDiagnostico : codigosDiagnostico;
	end;
	
	
	
	paciente = record
		DNI : integer;
		cantAtenciones : integer;
	end;
	
	arbol =^ nodo;
	nodo = record
		dat : paciente;
		HI : arbol;
		HD : arbol;
	end;
	
	DiagnosticosCant = array[codigosDiagnostico]of integer;
	
	
procedure iniciarV(var v:DiagnosticosCant);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := 0;
end;

procedure leerAtenciones(var ate:atencion);
begin
	readln(ate.mes);
	if(ate.mes <> 0)then begin
		readln(ate.DNI_paciente);
		readln(ate.codigoDiagnostico);
	end;
end;

procedure insertarElem(var a:arbol; ate:atencion);
begin
	if(a = nil)then begin
		new(a);
		a^.dat.DNI := ate.DNI_paciente;
		a^.dat.cantAtenciones := 1;
		a^.HI := nil;
		a^.HD := nil;
	end else begin
		if(a^.dat.DNI < ate.DNI_paciente)then
			insertarElem(a^.HD,ate)
		else if(a^.dat.DNI > ate.DNI_paciente)then
			insertarElem(a^.HI,ate)
		else 
			a^.dat.cantAtenciones := a^.dat.cantAtenciones + 1;
	end;
end;

procedure ModuloA(var a:arbol; var v:DiagnosticosCant);
var
	ate:atencion;
begin
	leerAtenciones(ate);
	while(ate.mes <> 0)do begin
		insertarElem(a,ate);
		v[ate.codigoDiagnostico] := v[ate.codigoDiagnostico] + 1;
		leerAtenciones(ate);
	end;
end;




function ModuloB(a:arbol; dni1,dni2,x:integer):integer;
begin
	if(a = nil)then ModuloB:=0
	else begin
		if(a^.dat.DNI >= dni1)and(a^.dat.DNI <= dni2)then begin
			
			if(a^.dat.cantAtenciones > x)then ModuloB := 1 + ModuloB(a^.HI,dni1,dni2,x) + ModuloB(a^.HD,dni1,dni2,x)
			else ModuloB := ModuloB(a^.HI,dni1,dni2,x) + ModuloB(a^.HD,dni1,dni2,x);
		
		end else if(a^.dat.DNI < dni1)then
			ModuloB := ModuloB(a^.HD,dni1,dni2,x)
		else if(a^.dat.DNI > dni2)then
			ModuloB := ModuloB(a^.HI,dni1,dni2,x);
	end;
end;



function ModuloC(v:DiagnosticosCant; i:integer):integer;
begin
	if(i <= dimF)then begin
		if(v[i] = 0)then ModuloC := 1 + ModuloC(v,i+1)
		else ModuloC := 0 + ModuloC(v,i+1);
	end else
		ModuloC := 0;
end;



VAR
	a:arbol;
	v:DiagnosticosCant;
	dni1,dni2,x,cant:integer;
BEGIN
	iniciarV(v);
	a := nil;
	ModuloA(a,v);
	
	readln(dni1);
	readln(dni2);
	readln(x);
	cant := ModuloB(a,dni1,dni2,x);
	
	writeln(ModuloC(v,1));
END.
