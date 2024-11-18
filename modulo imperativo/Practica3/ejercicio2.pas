program ejercicio2;
type    

    venta = record  
        codProd: integer;
        fecha: string[10]
        uniVendidas: integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato: venta;
        hI: arbol;
        hD: arbol;
    end;

procedure buscar(a: arbol; cod: integer; var aux: arbol);
begin
    if (a <> nil) then begin
        encontre:= false;
        if (a^.dato.codProd = cod) then begin
            encontre:= true;
            aux:= a;
        end
        else begin
            if (cod <= a^.dato.codProd) then 
                buscar (a^.hI, cod, aux);
            if (aux <> nil) then 
                buscar (a^.hD, cod, aux);
        end;
    end;
end;

procedure agregarArbol (var a: arbol; v: venta);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.dato:= v;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (v.codProd <= a^.dato.codProd) then 
            agregarArbol (a^.hI, v)
        else 
            agregarArbol (a^.hD, v);
    end;
end;

procedure buscarRepetido (a : arbol; var v: venta);
begin
    if (a <> nil) then begin
        if (a^.dato.codProd = v.codProd) then begin 
            v.uniVendidas:= v.uniVendidas + a^.dato.uniVendidas;
            buscarRepetido (a^.hI, v);
        end;
    end;
end;

procedure segundoArbol (a: arbol; var a2: arbol);
var 
    v: venta;
begin
    if (a <> nil) then begin
        v:= a^.dato;
        buscarRepetido (a^.hI, v);
        agregarArbol (a2, v);
        segundoArbol (a^hI, a2^.hI);
        segundoArbol (a^hD, a2^.hD);
    end;
end;

procedure leerVenta (var v: venta);
begin
    writeln ('Ingrese el codigo del producto');
    readln (v.codProd);
    if (v.codProd <> 0) then begin
        writeln ('Ingrese la fecha en que se vendio');
        readln (v.fecha);
        writeln ('Ingrese la cantidad de unidades vendidas');
        readln (v.uniVendidas);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    v: venta;
begin
    leerVenta (v);
    while (v.codProd <> 0) do begin
        agregarArbol (a, v);
        leerVenta (v);
    end;    
end;

var
    a, a2, aux: arbol;
    cod: integer;
    v: venta;
begin
    a:= nill;
    a2:= nil;
    aux:= nil;
    armarArbol (a);
    segundoArbol (a, a2);
    writeln ('Ingrese un codigo de producto para buscar cuantas unidades se han vendido del mismo');
    readln (cod);
    buscar(a, cod, aux);
    if (aux <> nil) then begin
        v:= aux^.dato;
        buscarRepetido (aux^.hI, v);
        writeln ('La cantidad de unidades que se vendieron del producto es: ', v.uniVendidas);
    end
    else 
        writeln ('El producto que introdujo no se encuentra en stock');
    writeln ('Ingrese un codigo de producto para buscar cuantas unidades se han vendido del mismo');
    readln (cod);
    buscar(a, cod, aux);
    if (aux <> nil) then
        writeln ('La cantidad de unidades que se vendieron del producto es: ', v.uniVendidas)
    else 
        writeln ('El producto que introdujo no se encuentra en stock');
end.