program untitled;

type
	nalumnos=0..7000;
	codigmateria=300..356;
	notafinales=0..10;
	
	mateynot=record
		codigo:codigmateria;
		nota:notafinales;
	end;
	
	lista=^nodoL;
	
	nodoL=record
		datoL:mateynot;
		sig:lista;
	end;
	
	Numylist=record
		numalumnos:nalumnos;
		Listamn:Lista;
	end;
	
	arbol=^nodo;
	
	nodo=record
		dato:numylist;
		HI:arbol;
		HD:arbol;
	end;

//type//

var 
	a:arbol;

//tengo que ponerme a armar la estructura que arme el arbol y la lista//

//TERCERO//
procedure agregarlista (var L:lista);
var
	nuevo,aux:lista;
begin
	if (L=nil) then
	begin
		new(nuevo);
		readln(nuevo^.datoL.nota);
		readln(nuevo^.datoL.codigo);
	end
	else
	begin
		aux:=L;
		new(nuevo);
		L:=nuevo;
		nuevo^.sig:=aux;
	end;
end;
//SEGUNDO//
procedure leerdato (var auxa:numylist);
begin
	readln(auxa.numalumnos);
	if (auxa.numalumnos <> 0) then
	begin
		agregarlista(auxa.listamn);
	end;
end;

//CUARTO//
procedure agregar (var a:arbol ; auxa:numylist);
begin
	if (a=nil) then
	begin
		new(a);
		a^.dato:=auxa;
		a^.HI:=nil;
		A^.HD:=nil;
	end
	else
	begin
		if(auxa.numalumnos < a^.dato.numalumnos) then
		begin
			agregar(a^.HI, auxa);
		end
		else
		begin
			if (auxa.numalumnos > a^.dato.numalumnos) then
			begin
				agregar(a^.HD,auxa);
			end
			else
			begin
				agregarlista(a^.dato.listamn);
			end;
		end;
	end;
end;
//PRIMERO//
procedure armararbol (var a:arbol);
var
	auxa:numylist;
begin
	leerdato(auxa);
	while (auxa.numalumnos <> 0) do
	begin
		agregar(a, auxa);
		leerdato(auxa);
	end;

end;

BEGIN
	a:=nil;
	armararbol(a);
	
END.

