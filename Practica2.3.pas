{3.- Implementar un programa que invoque a los siguientes módulos.
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

Program Ejercicio3;
const
	dimF = 20;
	max =  1550;
	min = 300;
	
type
	indice = -1..dimF+1;
	vectorEnteros = array [1..dimF] of integer;
	
procedure cargarVector (var v: vectorEnteros);

	procedure CargarVectorRecursivo (var v: vectorEnteros; pos: integer);
	var
		num: integer;
	begin
		if (pos < dimF) then begin
			num:= random(max - min + 1) + min;
			pos:= pos + 1;
			v[pos]:= num;
			CargarVectorRecursivo(v, pos); 
		end;	
	end;
	
var
	pos: integer;
begin
	pos:= 0;
	CargarVectorRecursivo(v, pos);
end;
	
procedure Imprimir (v: vectorEnteros);
var
	i: integer;
begin
	for i:= 1 to dimF do
		write('------');
	writeln();
	for i:= 1 to dimF do begin
		write(v[i]);
		write(' | ');
	end;
	writeln();
	for i:= 1 to dimF do
		write('------');
end;
		

	
procedure Ordenar (var v: vectorEnteros);
var
	i, j, actual: integer;
begin
	for i:= 2 to dimF do begin
		actual:= v[i];
		j:= i-1;
		while ((j > 0) and (v[j] > actual)) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;

Procedure busquedaDicotomica (v: vectorEnteros; ini,fin: indice; dato:integer; var pos: indice);
var
	medio: indice;
begin
	medio:= (fin + ini) DIV 2;
	while ((fin >= ini) AND (v[medio] <> dato)) do begin
		if (dato > v[medio]) then
			ini:= medio + 1
		else
			fin:= medio - 1;
		medio:= (fin + ini) DIV 2;
	end;
	if (fin >= ini) then
		pos:= medio
	else
		pos:= -1;
end;

var
	v: vectorEnteros;
	num: integer;
	pos: indice;
Begin 
	randomize;
	cargarVector(v); {a}
	Imprimir(v);
	Ordenar(v); {b}
	writeln();
	Imprimir(v);
	writeln();
	writeln('INGRESE UN NUMERO PARA BUSCAR:'); readln(num);
	busquedaDicotomica(v,1,dimF, num, pos); {c}
	if (pos <> -1) then
		writeln('EL NUMERO ',num,' SE ENCUENTRA EN LA POSICION ',pos,'.')
	else
		writeln('EL NUMERO NO SE ENCUENTRA EN EL VECTOR.');
end.
