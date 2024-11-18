program ejercicio2;

procedure imprimir(num: integer);
var 
    resto: integer;
begin
    if num <> 0 then begin
        resto := num DIV 10;
        imprimir(resto);
        writeln(num MOD 10);
    end;
end;  

var 
    num: integer;
begin
    writeln('Ingrese un numero');
    readln(num);
    while num <> 0 do begin
        imprimir(num);
        writeln('Ingrese un numero');
        readln(num);
    end;
end.
