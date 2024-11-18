program ejercicio1;
const
    dimF = 10;
type 
    vector = array [1..dimF] of char;

    lista = ^nodo;

    nodo = record
        elem : char;
        sig : lista;
    end;

procedure moduloF(p: lista);
begin
    if (p <> nil) then begin
        writeln (p^.elem);  
        moduloF (p^.sig);
    end;  
end;

procedure moduloG(p: lista);
begin
    if (p <> nil) then begin
        moduloG(p^.sig);
        writeln (p^.elem);
    end;
end;

procedure moduloE (var p: lista);
var 
    nue: lista;
    c: char;
begin
    writeln ('Ingrese un caracter');
    readln (c);
    if (c <> '.') then 
        moduloE (p);
    new (nue);
    nue^.elem:= c;
    nue^.sig:= p;
    p:= nue;
end;

procedure moduloD(var cant: integer);
var 
    c: char;
begin
    cant:= cant + 1;
    writeln ('Ingrese un caracter');
    readln (c);
    if (c <> '.') then 
        moduloD (cant);
end;

procedure moduloC (v: vector; dimL, pos: integer);
begin
    pos:= pos + 1;
    if (pos < dimL) then 
        moduloC (v, dimL, pos);
    writeln ('Posicion ', pos,': ', v[pos]);
end;

procedure moduloB (v: vector; dimL: integer);
var 
    i: integer;
begin
    for i:= 1 to dimL do 
        writeln ('Posicion ', i, ': ', v[i]);
end;

procedure moduloA (var v: vector; var dimL: integer);
var 
    c: char;
begin
    dimL:= dimL + 1;
    writeln ('Ingrese un caracter: ');
    readln (c);
    if ((dimL < 10) and (c <> '.')) then 
        moduloA (v, dimL);
    v[dimL]:= c;
end;

var
    v: vector;
    dimL, cant: integer;
    p: lista;
begin
    dimL:= 0;
    writeln ('--------------------------------Inciso A--------------------------------------');
    moduloA (v, dimL);
    writeln ('--------------------------------Inciso B--------------------------------------');
    moduloB (v, dimL);
    writeln ('--------------------------------Inciso C--------------------------------------');
    moduloC (v, dimL, 0);
    writeln ('--------------------------------Inciso D--------------------------------------');
    cant:= 0;
    moduloD(cant);
    writeln ('La cantidad de caracteres leidos del inciso D fue ', cant);
    writeln ('--------------------------------Inciso E--------------------------------------');
    moduloE (p);
    writeln ('--------------------------------Inciso F--------------------------------------');
    moduloF(p);
    writeln ('--------------------------------Inciso G--------------------------------------');
    moduloG(p);
end.



