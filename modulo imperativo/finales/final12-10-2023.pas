program final12102023;
type 
    recital = record 
        nombre: string [15];
        fecha: string[10];
        cantCanciones: integer;
        monto: real;
    end;

    arbol = ^nodo;
    nodo = record 
        info: recital;
        hI: arbol;
        hD: arbol;
    end;

    lista = ^nodo2;
    nodo2 = record 
        elem: recital;
        sig: lista;
    end;

procedure leerRecital (var r: recital);
begin
    writeln ('Ingrese el nombre de la banda'); 
    readln (r.nombre);
    if (r.nombre <> 'ZZZ') then begin
        writeln ('Ingrese la fecha del recital'); 
        readln (r.fecha);
        writeln ('Ingrese la cantidad de canciones a cantar'); 
        readln (r.cantCanciones);
        writeln ('Ingrese el monto recaudado por las entradas'); 
        readln (r.monto);
    end;    
end;

procedure agregarArbol (var a: arbol; r: recital);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.info:= r;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (r.monto <= a^.info.monto) then 
            agregarArbol (a^.hI, r)
        else 
            agregarArbol (a^.hD, r);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    r: recital;
begin
    leerRecital (r);
    while (r.nombre <> 'ZZZ') do begin
        agregarArbol (a, r);
        leerRecital (r);
    end;    
end;

procedure agregarLista (var pri: lista; r: recital);
var 
    nue, ant, act: lista;
begin
    new (nue);
    nue^.elem:= r;
    ant:= pri;
    act:= pri;
    while ((act <> nil) and (r.monto < act^.elem.monto)) do begin
        ant:= act;
        act:= act^.sig;
    end;    
    if (ant = act) then 
        pri:= nue
    else 
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure moduloB (var a: arbol; var pri: lista; v1, v2: real);
begin
    if (a <> nil) then begin
        if ((a^.info.monto >= v1) and (a^.info.monto <= v2)) then 
            agregarLista (pri, a^.info);
        moduloB (a^.hI, pri, v1, v2);
        moduloB (a^.hD, pri, v1, v2);
    end;    
end;

function moduloC (pri: lista): integer;
var 
    cant: integer;
begin
    cant:= 0;
    if (pri <> nil) then begin
        if (pri^.elem.cantCanciones > 12) then 
            cant:= cant + 1;
        cant:= cant + moduloC (pri^.sig);
    end;    
    moduloC:= cant;
end;

procedure imprimirLista (pri: lista);
begin
    while (pri <> nil) do begin 
        writeln (pri^.elem.monto:0:2, ' |');    
        pri:= pri^.sig;
    end;
end;

var 
    a: arbol;
    v1, v2: real;
    pri: lista;
    cant: integer;
begin
    a:= nil;
    pri:= nil;
    armarArbol (a);     //armo el arbol con los recitales ingfresados
    writeln ('Ingrese un monto');
    readln (v1);
    writeln ('Ingrese un monto mas grande');
    readln (v2);
    moduloB (a, pri, v1, v2);       //creo la lista con los montos entre v1 y v2 (inclusive) ordenados de mayor a menor
    imprimirLista (pri);
    cant:= 0;
    cant:= moduloC (pri);
    writeln ('La cantidad de recitales con mas de 12 canciones es ', cant);
end.
