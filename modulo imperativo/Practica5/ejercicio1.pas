program ejercicio1;
const 
    dimF = 3; // = 3000 oficinas 
type 
    oficina = record 
        cod: integer;
        dniPropietario: integer;
        valor: real;
    end;

    vector = array [1..dimF] of oficina;

procedure leerOficina (var o: oficina);
begin
    writeln ('Ingrese el codigo de la oficina');
    readln (o.cod);
    if (o.cod <> -1) then begin
        writeln ('Ingrese el dni del propietario');
        readln (o.dniPropietario);
        writeln ('Ingrese el valor');
        readln (o.valor);
    end;
end;

procedure cargarVector (var v: vector; var dimL: integer);
var 
    o: oficina;
begin
    leerOficina (o);
    while (o.cod <> - 1) do begin
        dimL:= dimL + 1;
        v[dimL]:= o;
        leerOficina (o);
    end;    
end;

procedure ordenarVector (var v: vector; dimL: integer);
var 
    i,j,pos: integer;
    item: oficina;
begin
    for i:= 1 to (dimL -1) do begin
        pos:= i;
        for j:= i + 1 to dimL  do begin
            if (v[j].cod < v[pos].cod) then
                pos:= j;
        end;
        item:= v[pos];
        v[pos]:= v[i];
        v[i]:= item;
    end;     
end;

procedure buscarDicotomicamente (v: vector; dimL: integer; var cod: integer; var ofi: oficina);
var 
    limI, limS, medio: integer;
begin
    limI:= 1;
    limS:= dimL;
    medio:= (limI + limS) DIV 2;
    while ((limI <= limS) and (v[medio].cod <> cod)) do begin
        if (v[medio].cod < cod) then 
            limI:= medio + 1
        else 
            limS:= medio -1;
        medio:= (limI + limS) DIV 2;
    end;    
    if (v[medio].cod = cod) then begin
        ofi:= v[medio];
        cod:= medio;
    end
    else 
        cod:= 0;
end;

function calcularMonto (v: vector; dimL, cant: integer): real;
var 
    monto: real;
begin
    monto:= 0;
    if (cant <= dimL) then 
        monto:= monto + v[cant].valor + calcularMonto (v, dimL, cant + 1);
    calcularMonto:= monto;   
end;

var
    v: vector;
    dimL, i: integer;
    cod, cant: integer;
    ofi: oficina;
    montoTot: real;
begin
    dimL:= 0;
    montoTot:= 0;
    cargarVector (v, dimL); //cargo el vector
    ordenarVector (v, dimL); // utilizo el mètodo de seleccion
    for i:= 1 to dimL do
        writeln ('El dni del propietario de la oficina ',v[i].cod,' es ', v[i].dniPropietario);
    writeln ('Ingrese un codigo por el cual buscar en el vector');
    readln (cod);
    buscarDicotomicamente (v, dimL, cod, ofi);  //Busco y retorno en la variable OF la oficina deseada
    if (cod = 0) then 
        writeln ('La oficina con el codigo proporcionado no se encuentra en el vector')
    else 
        writeln ('El dni del propietario de la oficina buscada es ', ofi.dniPropietario);
    cant:= 1;
    montoTot:= montoTot + calcularMonto (v, dimL, cant);
    writeln ('El monto total es ', montoTot:0:2);
end.