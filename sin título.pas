program untitled;

var 
  ale, A,B,F: integer;

BEGIN
  writeln('ingrese un numero: ');
  Readln(A);
  writeln('ingrese un numero: ');
  readln(B);
  writeln('ingrese un numero: ');
  readln(F);
  randomize;
  ale:=random(b-a+1)+a;
  while (ale <> F) do
  begin
    writeln('el numero aleatorio es: ', ale);
    ale:=random(b-a+1)+a;
  end;
END.

