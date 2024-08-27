{
   practico.pas
   
   Copyright 2024 alumnos <alumnos@LAB09-08>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program practico;
type
  vector = array [1..50] of integer;
  
procedure cargarVector(v:vector);
var
  min, max, n, i: integer;
begin
  min:= 10;
  max:= 20;
  randomize;
  for i:= 1 to 50 do begin           //lo que hizo esta mal, es con while att yo)
    n:= random(max - min + 1) + min;
    if (n| <> 0) then
      v[i]:= n;
  end;
end;

var
  v: vector;
begin
  cargarVector(v);
end.
