program ejercicio3;
type
    final = record
        cod: integer;
        codMate: integer;
        nota: integer;
    end;

    infoMates = record
        cod: integr;
        nota: integer;
    end;

    listaM = ^mate
    mate = record   
        elem: infoMates;
        sig: listaM;
    end;

    infoArbol = record
        codAlu : integer;
        mates: listaM;
    arbol = ^nodo;

    nodo = record
        info: infoArbol;
        hI: arbol;
        hD: arbol;
    end;

    lista = ^nodoL;

    nodoL = record
        elem: final;
        sig: lista;
    end;

    vector = array [1..30] of lista;

procedure inicializarVector (var v: vector);
var 
    i: integer;
begin
    for i:= 1 to 30 do 
        v[i]:= nil;
end;

procedure leerFinal (var f: final);
begin
    writeln ('Ingrese la nota obtenida por el alumno');
    readln (f.nota);
    if (f.nota <> - 1) then begin
        writeln ('Ingrese el codigo del alumno');
        readln (f.cod);
        writeln ('Ingrese el codigo de la materia rendida');
        readln (f.codMate);         
    end;   
end;

procedure agregarLista (var pri: listaM; f: final);
var 
    nue: listaM;
begin
    new (nue);
    nue^.elem.cod:= f.codMate;
    nue^.elem.nota:= f.nota;
    nue^.sig:= pri;
    pri:= nue;
end;

procedure agregarArbol (var a: arbol; f: final);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.info.codAlu:= f.cod;
        nue^.info.mates:= nil;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (a^.info.cod <= f.cod) then 
            agregarArbol (a^.hI, f)
        else    
            agregarArbol(a^.hD, f);
    end;
end;

procedure agregarVector (var pri: lista; f: final);
var 
    nue: lista;
begin
    new (nue);
    nue^.elem:= f;
    nue^.sig:= pri;
    pri:= nue;
end;

procedure buscar (var a: arbol; f: final; var esta: boolean);
var 
    nue: listaM;
begin
    if (a <> nil) then begin
        if (a^.info.cod = f.cod) then begin
            agregarLista (a^.info.mates, f);
            esta:= true;
        end
        else begin
            buscar (a^.hI, f, esta);
            if (not esta) then 
                buscar (a^.hD, f, esta);
        end;
    end;    
end;

procedure armarEstructuras (var a: arbol; var v: vector);
var 
    f: final;
    esta: boolean;
begin
    leerFinal (f);
    while (f.nota <> -1) do begin
        esta:= false;
        if (f.nota >= 4) then begin
            buscar (a, f, esta);
            if (not esta) then 
                agregarArbol (a, f);
        end;
        agregarVector (v[codMate], f);
    end;    
end;

var 
    a: arbol;
    v: vector;
begin
    inicializarVector (v);
    armarEstructuras (a,v);     //Armamos el vector con la informacion

end.