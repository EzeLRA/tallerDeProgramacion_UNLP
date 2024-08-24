program ejercicio4;
{
	Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
	equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
	el número 0 (cero).
	
	Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
	¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
	próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}

procedure imprimirBinario(x:integer);
begin
	if(x>0)then begin
		imprimirBinario(x DIV 2);
		write(x MOD 2);
	end;
end;

VAR
	x:integer;
BEGIN
	readln(x);
	while(x > 0)do begin
		imprimirBinario(x);
		writeln('');
		readln(x);
	end;
END.
