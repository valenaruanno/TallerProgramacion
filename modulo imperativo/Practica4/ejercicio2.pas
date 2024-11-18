program ejercicio2;
type 
    prestamo = record 
        isbn: integer;
        numSocio: integer;
        dia: integer;
        mes: integer;
        cantDias: integer;
    end;

    arbol1 = ^nodo1;
    nodo1 = record 
        info : prestamo;
        hI: arbol1;
        hD: arbol1;
    end;

    lista = ^nodoL;
    nodoL = record 
        elem: prestamo;
        sig: lista;
    end;
    arbol2 = ^nodo2;
    nodo2 = record  
        info : lista;
        hI: arbol2;
        hD: arbol2;
    end;

procedure leerPrestamo (var p: prestamo);
begin
    writeln ('Ingrese el ISBN del libro');
    readln (p.isbn);
    if (p.isbn <> -1) then begin
        writeln ('Ingrese el numero de socio');
        readln (p.numSocio);
        writeln ('Ingrese el dia en que se presto el libro');
        readln (p.dia);
        writeln ('Ingrese el numero de mes en el que se presto el libro');
        readln (p.mes);
        writeln ('Ingrese el numero de dias que se presto');
        readln (p.cantDias);
    end;    
end;

procedure agregarArbol1 (var a1: arbol1; p: prestamo);
var 
    nuevo: arbol1;
begin
    if (a1 = nil) then begin
        new (nuevo);
        nuevo^.info:= p;
        nuevo^.hI:= nil;
        nuevo^.hD:= nil;
        a1:= nuevo;
    end
    else begin
        if (p.isbn <= a1^.info.isbn) then 
            agregarArbol1 (a1^.hI, p)
        else 
            agregarArbol1 (a1^.hD, p);
    end;
end;


procedure agregar (var pri: lista; p: prestamo);
var 
    nue: lista;
begin
    new (nue);
    nue^.elem:= p;
    nue^.sig:= pri;
    pri:= nue;    
end;

procedure buscar (a2: arbol2; p: prestamo; var esta: boolean);
begin
    if (a2 <> nil) then begin
        if (a2^.info^.elem.isbn = p.isbn) then begin
            esta:= true;
            agregar (a2^.info, p);
        end
        else begin
            buscar (a2^.hI, p, esta);
            if (esta = false) then 
                buscar (a2^.hD, p, esta);
        end;    
    end;
end;

procedure agregarNuevoArbol2 (var a2: arbol2; p: prestamo);
var 
    pri: lista;
    nue : arbol2;
begin
    if (a2 = nil) then begin
        pri:= nil;
        agregar (pri, p);
        new (nue);
        nue^.info:= pri;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a2:= nue;
    end
    else begin
        if (p.isbn <= a2^.info^.elem.isbn) then 
            agregarNuevoArbol2 (a2^.hI, p)
        else 
            agregarNuevoArbol2 (a2^.hD, p);
    end;
end;

procedure armarArboles (var a1: arbol1; var a2: arbol2);
var 
    p: prestamo;
    esta: boolean;
begin
    leerPrestamo (p);
    while (p.isbn <> - 1) do begin
        esta:= false;
        agregarArbol1 (a1, p);
        buscar (a2, p, esta);
        if (not esta) then 
            agregarNuevoArbol2 (a2, p);
        leerPrestamo (p);
    end;    
end;

procedure buscarIsbnMax (a1: arbol1; var isbnMax: integer);
begin
    if (a1^.hD = nil) then 
        isbnMax:= a1^.info.isbn
    else 
        buscarIsbnMax (a1^.hD, isbnMax);
end;

procedure buscarIsbnMin (a2: arbol2; var isbnMin: integer);
begin
    if (a2^.hI = nil) then 
        isbnMin:= a2^.info^.elem.isbn
    else 
        buscarIsbnMin (a2^.hI, isbnMin);   
end;

var 
    a1: arbol1;
    a2: arbol2;
    isbnMax, isbnMin: integer;
begin
    a1:= nil;
    a2:= nil;
    armarArboles (a1, a2);     //armamos los arboles 
    isbnMax:= -1;
    if (a1 <> nil) then 
        buscarIsbnMax (a1, isbnMax); //Buscamos el maximo ISBN 
    writeln ('El maximo ISBN es ', isbnMax);
    isbnMin:= 9999;
    if (a1 <> nil) then 
        buscarIsbnMin (a2, isbnMin); //Buscamos el minimo ISBN 
    writeln ('El minimo ISBN es ', isbnMin);
end.