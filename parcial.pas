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
	
	notaynum=record
		numalumnos:nalumnos;
		notaprom:real;
	end;
	
	arbol2=^nodo2;
	
	nodo2=record
		dato2:notaynum;
		HI:arbol2;
		HD:arbol2;
	end;

//type//

var 
	a:arbol;
	a2:arbol2;

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
		l:=nuevo;
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
		agregarlista(a^.dato.listamn);
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

//Parte 2//

procedure armararbol2 (var a2:arbol2; a:arbol);
var
	aux:arbol;
begin
	if (a=nil) then
	begin
		writeln('la lista esta vacia');
	end
	else
	begin
		leerarbol(a,aux);
		agregararbol2(a2, aux);
		//parte sin terminar//
	end;
end;

BEGIN
	a:=nil;
	armararbol(a);
	a2:=nil;
END.
