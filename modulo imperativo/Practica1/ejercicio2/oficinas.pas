program oficinas;
const 
    dimF = 5;
type 
    oficina = record
        id: integer;
        dni: string[10];
        expensa: double;
    end;

    vector = array [1..dimF] of oficina;


    procedure leer (var o: oficina);
    begin
        writeln ('Ingrese el codigo de identificacion de la oficina');
        readln (o.id);
        if (o.id <> -1) then begin
            writeln ('Ingrese el dni del propietario de la oficina');
            readln (o.dni);
            writeln ('Ingrese el valor de la expensa de la oficina');
            readln (o.expensa);
        end;    
    end;

    procedure generarVector (var v: vector; var dimL: integer);
    var 
        o: oficina;
    begin
        dimL:= 0;
        leer(o);
        while (o.id <> -1) and (dimL < dimF) do begin
            dimL:= dimL +1;
            v[dimL]:= o;
            leer(o);
        end;
    end;

    procedure insercion (var v: vector; dimL: integer);
    var 
        i,j : integer;
        actual: oficina;
    begin
        for i:= 2 to dimL do begin
            actual:= v[i];
            j:= i -1;
            while ((j > 0) and (v[j].id > actual.id)) do begin
                v[j+1]:= v[j];
                j:= j -1;
            end;
            v[j+1]:= actual;
        end;    
    end;

    procedure mostrar (v: vector; dimL: integer);
    var 
        i: integer;
        o: oficina;
    begin
        for i:= 1 to dimL do begin
            o:= v[i];
            writeln ('El codigo de id es ',o.id,', el dni del propietario es ',o.dni,' y la expensa que paga es ',o.expensa:0:2);
        end;    
    end;

var 
    v: vector;
    dimL: integer;
begin
    dimL:= 0;
    generarVector (v, dimL);
    if (dimL > 0) then begin
        insercion (v, dimL);
        writeln ('En la primera posicion se encuentra la oficina con id',v[1].id);
        mostrar (v, dimL);
    end
    else
        writeln ('No se han ingresado oficinas');
end.
