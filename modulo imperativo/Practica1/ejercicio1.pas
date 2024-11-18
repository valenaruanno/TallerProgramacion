program comercio;
const 
    maxVen = 99;
    cod = 15;
type 
    codigo = 1..cod;
    maxVendida = 1..maxVen;
    venta = record 
        dia: integer;
        codProd: codigo;
        cantVen: maxVendida;
    end;

    vector = array [maxVendida] of venta;


    procedure leer (var ven: venta);
    begin
        writeln ('Ingrese el dia de la venta en formato numerico');
        readln (ven.dia);
        if (ven.dia <> 0) then begin
            ven.codProd:= Random (1 - 15) + 1;
            writeln ('Ingrese la cantidad vendida del producto, que como maximo es 99');
            readln (ven.cantVen);
        end;
    end;

    procedure armarVector (var v: vector; var dimF: integer);
    var 
        ven: venta; 
    begin
        Randomize;
        leer (ven);
        while (ven.dia <> 0) do begin
            dimF:= dimF + 1;
            v[dimF]:= ven;
            leer(ven);
        end;
    end;


    procedure mostrarVector (var v: vector; dimF: integer);
    var 
        ven: venta;
        i: integer;
    begin
        for i:= 1 to dimF do begin
            ven:= v[i];
            writeln ('La venta se realizo el dia', ven.dia,' , el codigo de producto es ',ven.codProd,' y la cantidad vendida fue ',ven.cantVen);
        end;
    end;

    procedure ordenarVector (var v: vector; dimF: integer);
    var 
        i, j, pos: integer;
        ven: venta;
    begin
        for i:= 1 to dimF do begin
            pos:= i;
            for j:= i+1 to dimF do begin
                if (v[j].codProd < v[pos].codProd) then 
                    pos:= j;
            end;
            ven:= v[pos];
            v[pos]:= v[i];
            v[i]:= ven;
        end;    
    end;

var 
    v: vector;
    dimF: integer;
begin
    dimF:= 0;
    armarVector (v, dimF);
    mostrarVector (v, dimF);
    ordenarVector (v, dimF);
    mostrarVector (v, dimF);
end.
