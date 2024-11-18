program final2019;
const 
    dimF = 5;
type 
    rango = 1.. dimF;

    producto = record 
        cod: integer;
        cantVendida: integer;
        codCli: integer;
    end;

    lista = ^nodo;
    nodo = record 
        elem: producto;
        sig: lista;
    end;

    vector = array [rango] of lista;

    producto2 = record 
        cod: integer;
        cantVendida: integer;
    end;

    lista2 = ^nodo2;
    nodo2 = record 
        elem: producto2;
        sig: lista2;
    end;


procedure inicializarVector (var v: vector);
var 
    i: integer;
begin
    for i:= 1 to dimF do
        v[i]:= nil;  
end;

procedure leerProducto (var p: producto);
begin
    writeln ('Ingrese el codigo del producto');
    readln (p.cod);
    if (p.cod <> -1) then begin
        writeln ('Ingrese la cantidad vendida del producto');
        readln (p.cantVendida);
        writeln ('Ingrese el codigo del cliente');
        readln (p.codCli);
    end;   
end;

procedure insertarOrdenado (var pri: lista; p: producto);
var 
    nue, ant, act: lista;
begin
    new (nue);
    nue^.elem:= p;
    if (pri = nil) then begin
        nue^.sig:= pri;
        pri:= nue;
    end
    else begin
        act:= pri;
        while ((act <> nil) and (pri^.elem.cod < p.cod)) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act = pri) then 
            pri:= nue
        else
            ant^.sig:= nue;
        nue^.sig:= act;
    end;
end;

procedure cargarProducto (var pri: lista; i: integer);
var 
    p: producto;
begin
    writeln ('Ingrese los productos vendidos durante el dia ',i);
    leerProducto (p);
    while (p.cod <> - 1) do begin
        insertarOrdenado (pri, p);
        leerProducto (p);
    end;   
end;

procedure cargarVector (var v: vector);
var 
    i: integer;
begin
    for i:= 1 to dimF do
        cargarProducto (v[i], i);    
end;

procedure agregarLista2 (var pri: lista2; prod: producto2);
var     
    nue, ant, act: lista2;
begin
    if (pri = nil) then begin
        new (nue);
        nue^.elem:= prod;
        pri:= nue;
    end
    else begin
        act:= pri;
        while ((act <> nil) and (act^.elem.cod < prod.cod)) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act <> nil) then begin
            if (act^.elem.cod = prod.cod) then 
                act^.elem.cantVendida:= act^.elem.cantVendida + prod.cantVendida
            else begin
                new (nue);
                nue^.elem:= prod;
                if (act = pri) then 
                   pri:= nue
                else 
                    ant^.sig:= nue;
                nue^.sig:= act;
            end;
        end;
    end;
end;

procedure comprimir (p: lista; var pri: lista2);
var 
    prod: producto2;
begin
    while (p <> nil) do begin
        prod.cod:= p^.elem.cod;
        prod.cantVendida:= p^.elem.cantVendida;
        agregarLista2 (pri, prod);
        p:= p^.sig;
    end;
end;

procedure armarLista2 (v: vector; var pri: lista2);
var 
    i: integer;
begin
    for i:= 1 to dimF do 
        comprimir (v[i], pri);
end;

procedure buscarMasVendido (pri: lista2; var proMax: producto2);
begin
    if (pri <> nil) then begin
        if (pri^.elem.cantVendida > proMax.cantVendida) then 
            proMax:= pri^.elem;
        buscarMasVendido (pri^.sig, proMax);
    end;
end;

var 
    v: vector;
    pri: lista2;
    proMax: producto2;
begin
    inicializarVector (v);
    cargarVector (v);  //cargo las listas de todos los dias 
    pri:= nil;
    writeln ('Comprimo todos los elementos de las listas');
    armarLista2 (v, pri);       //Comprimo todos los productos en una sola lista
    proMax.cantVendida:= -1;
    writeln ('Busco el producto con mas unidades vendidas');
    buscarMasVendido (pri, proMax);     //Busca el producto mas vendido
    writeln ('El producto mas vendido fue ',proMax.cod,' y se vendieron ', proMax.cantVendida,' unidades.');
end.