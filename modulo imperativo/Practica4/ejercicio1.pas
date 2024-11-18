program ejercicio1;
type 
    venta = record 
        cod: integer;
        codProd: integer;
        unidades: integer;
        precio: real;
    end;

    producto = record 
        codProd: integer;
        unidades: integer;
        monto: real;
    end;

    arbol = ^nodo;

    nodo = record
        info : producto;
        hI: arbol;
        hD: arbol;
    end;

procedure leerVenta (var v: venta);
begin
    writeln ('Ingrese el codigo de la venta');
    readln (v.cod); 
    if (v.cod <> - 1) then begin
        writeln ('Ingrese el codigo del producto vendido');
        readln (v.codProd); 
        writeln ('Ingrese la cantidad de unidades vendidas');
        readln (v.unidades); 
        writeln ('Ingrese el precio por unidad del producto');
        readln (v.precio); 
    end;   
end;

procedure buscar (var a: arbol; v: venta; var ok: boolean);
begin
    if (a <> nil) then begin
        if (a^.info.codProd = v.codProd) then begin
            a^.info.unidades:= a^.info.unidades + v.unidades;
            a^.info.monto:= v.precio * a^.info.unidades;
            ok:= true;
        end
        else begin
            buscar (a^.hI, v, ok);
            if (not ok) then 
                buscar (a^.hD, v, ok);
        end;
    end;    
end;

procedure agregarProducto (var a: arbol; v: venta);
var 
    p: producto;
    aux: arbol;
begin
    if (a = nil) then begin
        new (aux);
        p.codProd:= v.codProd;
        p.unidades:= v.unidades;
        p.monto:= p.unidades * v.precio;
        aux^.info:= p;
        aux^.hI:= nil;
        aux^.hD:= nil;
        a:= aux;
    end
    else begin
        if (v.codProd <= a^.info.codProd) then 
            agregarProducto (a^.hI, v)
        else
            agregarProducto (a^.hD, v);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    v: venta;
    ok: boolean;
begin
    leerVenta (v);
    while (v.cod <> -1) do begin
        ok:= false;
        buscar (a, v, ok);
        if (not ok) then 
            agregarProducto (a, v);
        leerVenta (v);
    end;    
end;

procedure imprimirArbol (a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol (a^.hI);
        writeln ('El codigo del producto es ', a^.info.codProd,', se han vendido ',a^.info.unidades,' unidades y el monto total de sus ventas es $', a^.info.monto:0:3);
        writeln ('-----------------------------------------------------------------------------------------------------------------------------------------------');
        imprimirArbol (a^.hD); 
    end;    
end;

procedure buscarMaxUnidades (a: arbol; var codMax, maxUnidades: integer);
begin
    if (a <> nil) then begin
        if (a^.info.unidades > maxUnidades) then begin
            maxUnidades:= a^.info.unidades;
            codMax:= a^.info.codProd;
        end;
        buscarMaxUnidades (a^.hI, codMax, maxUnidades);
        buscarMaxUnidades (a^.hD, codMax, maxUnidades);
    end;    
end;

procedure buscarCantidad (a: arbol; codProd: integer; var cant: integer);
begin
    if (a <> nil) then begin
        if (a^.info.codProd < codProd) then 
            cant:= cant + 1;
        buscarCantidad (a^.hI, codProd, cant);
        buscarCantidad (a^.hD, codProd, cant);
    end;    
end;

procedure buscarConCodigo (a: arbol; codProdMin, codProdMax: integer; var montoTot: real);
begin
    if ( a <> nil) then begin
        if ((a^.info.codProd > codProdMin) and (a^.info.codProd < codProdMax)) then 
            montoTot:= montoTot + a^.info.monto;
        buscarConCodigo (a^.hI, codProdMin, codProdMax, montoTot);
        buscarConCodigo (a^.hD, codProdMin, codProdMax, montoTot);
    end;    
end;

var 
    a: arbol;
    maxUnidades, codMax, codProd, cant, codProdMin, codProdMax: integer;
    montoTot: real;
begin
    a:= nil;
    armarArbol (a);     //armo el arbol segun lo pedido en el inciso A
    imprimirArbol (a);   //imprimo el arbol ordenado por codigo de producto
    maxUnidades:= -1;
    buscarMaxUnidades (a, codMax, maxUnidades);      //Retorno el codigo de producto con mas unidades vendidas
    writeln ('El codigo de producto con mas unidades vendias es: ', codMax);
    cant:= 0;
    writeln ('Ingrese un codigo de producto paara saber cuantos mas hay con menor que el suyo');
    readln (codProd);
    buscarCantidad (a, codProd, cant);                  //busco la cantidad de productos con codigo menor al pasado
    writeln ('La cantidad de productos con codigo menor al especificado es: ', cant);
    writeln ('Ingrese un codigo de producto');
    readln (codProdMin);
    writeln ('Ingrese un codigo de producto mayor que el anterior');
    readln (codProdMax);
    if (codProdMax < codProdMin) then begin
        codProd:= codProdMin;
        codProdMin:= codProdMax;
        codProdMax:= codProd;
    end;
    montoTot:= 0;
    buscarConCodigo (a, codProdMin, codProdMax, montoTot);
    writeln ('El monto total entre todos los productos comprendidos es ', montoTot:0:2);
end.