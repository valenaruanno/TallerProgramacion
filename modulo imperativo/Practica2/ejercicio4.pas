program ejercicio4;
const 
    dimF = 20;
type 
    vector = array[1..dimF] of integer;


procedure moduloC (v: vector; var suma: integer; pos: integer);
begin
    if (pos <= 20) then begin
        suma:= suma + v[pos];
        moduloC(v, suma, pos + 1);
    end;
end;

procedure moduloB (v: vector; var max: integer; pos: integer);
begin
    if (pos <= 20) then begin
        if (v[pos] > max) then 
            max:= v[pos];
        moduloB (v, max, pos + 1);
    end;    
end;

procedure moduloA (var v: vector; var dimL : integer);
var 
    num: integer;
begin
    if (dimL <= 20) then begin
        num:= Random (100);
        v[dimL]:= num;
        dimL:= dimL + 1;
        moduloA (v, dimL);
    end;  
end;

var 
    v: vector;
    max, index, i, suma: integer;
begin
    Randomize;
    index:= 1;
    max:= -1;
    suma:= 0;
    moduloA (v, index); 
    moduloB (v, max, 1);    //Busca el maximo dentro del vector
    moduloC (v, suma, 1);    //Devuleve la suma de los elementos
    for i:= 1 to dimF do
        writeln ('Pos ',i,': ', v[i]);
    writeln ('Maximo: ', max);
    writeln ('Suma: ', suma);
end.
