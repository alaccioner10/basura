{
3.- Implementar un programa que invoque a los siguientes módulos.
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
program baldu;
const
	dimF = 20;
	min=300;
	max=1550;
	
type 
	indice=1..20;
	vector=array [1..DimF] of integer;
	rangorandom=300..1550;
	
	
var 
	v:vector;
	ini, fin: indice;
	pos:indice;
	DimL:integer;

procedure CargarVector (var v:vector; var dimL:integer; var fin:indice);
var
	n:rangorandom;
begin
	n:=random(max-min+1)+min;
	if(dimL<dimF) then
	begin	
		dimL:=dimL+1;
		v[dimL]:=n;
		cargarvector(v,dimL,min,max);
	end;

end;

procedure mostrarvector (v:vector);
var
	i:integer;
	
begin
	for i:=1 to dimF do
	begin
		writeln(v[i]);
	end;
end;

procedure Ordenarvector (var v:vector; DimL:integer);
var
	i, j, actual:integer;
begin
	for i:=2 to DimL do
	begin
		actual:=v[i];
		j:=i-1;
		while (j>0) and (v[j]>actual) do
		begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
	med:indice;
begin
	med:=(ini+fin) div 2;
	while (fin>=ini) and (v[medio] <> dato) do
	begin
		if (dato>v[medio]) then
		begin
			ini:=medio+1;
		end
		else
		begin
			fin:=medio-1;
		end;
		med:=(ini+fin) div 2;
	end;
	if (fin>=ini)then
	begin
		pos:=medio;
	end
	else
	begin
		post:=-1;
	end;
end;


BEGIN
	randomize;
	dimL:=0;
	cargarvector(v,diml);
	ordenarvector(v,DimL);
	ini:=1;
	fin:=20;
	mostrarvector(v);
	
END.
