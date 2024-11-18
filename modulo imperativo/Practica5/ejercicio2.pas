program ejercicio2;
type
    rango = 2010..2018;
    auto = record 
        patente : integer;
        anioFabri : rango;
        marca : string [12];
        modelo : string [12];
    end;

    arbol1 = ^nodo1;
    nodo1 = record 
        info: auto;
        hI: arbol1;
        hD: arbol1;
    end;

    lista = ^nodoL;
    nodoL = record 
        elem: auto;
        sig: lista;
    end;
    arbol2 = ^nodo2;
    nodo2 = record 
        info: lista;
        hI: arbol2;
        hD: arbol2;
    end;

procedure leerAuto (var a: auto);
begin
    writeln ('Ingrese la patente del auto');
    readln (a.patente);
    if (a.patente <> -1) then begin
        writeln ('Ingrese el año de fabricacion del auto');
        readln (a.anioFabri);
        writeln ('Ingrese la marca del auto');
        readln (a.marca);
        writeln ('Ingrese el modelo del auto');
        readln (a.modelo);
    end;    
end;

procedure agregarArbol3 (var a3: arbol1; a: auto);
var 
    nue: arbol1;
begin
    if (a3 = nil) then begin
        new (nue);
        nue^.info:= a;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a3:= nue;
    end 
    else begin
        if (a.patente <= a3^.info.anioFabri) then 
            agregarArbol3 (a3^.hI, a)
        else 
            agregarArbol3 (a3^.hD, a);
    end;
end;

procedure agregarArbol1 (var a1: arbol1; a: auto);
var 
    nue: arbol1;
begin
    if (a1 = nil) then begin
        new (nue);
        nue^.info:= a;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a1:= nue;
    end 
    else begin
        if (a.patente <= a1^.info.patente) then 
            agregarArbol1 (a1^.hI, a)
        else 
            agregarArbol1 (a1^.hD, a);
    end;
end;

procedure agregarLista (var pri: lista; a: auto);
var 
    nue: lista;
begin
    new (nue);
    nue^.elem:= a;
    nue^.sig:= pri;
    pri:= nue;    
end;

procedure buscar (a2: arbol2; a: auto; var ok: boolean);
begin
    if (a2 <> nil) then begin
        if (a2^.info^.elem.marca = a.marca) then begin
            ok:= true;
            agregarLista (a2^.info, a);
        end
        else begin
            if (a.marca < a2^.info^.elem.marca) then 
                buscar (a2^.hI, a, ok)
            else 
                buscar (a2^.hD, a, ok);
        end;
    end;
end;

procedure agregarArbol2 (var a2: arbol2; a: auto);
var 
    nue: arbol2;
    pri: lista;
begin
    if (a2 = nil) then begin
        pri:= nil;
        new (nue);
        agregarLista (pri, a);
        nue^.info:= pri;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a2:= nue;
    end
    else begin
        if (a.marca <= a2^.info^.elem.marca) then 
            agregarArbol2 (a2^.hI, a)
        else 
            agregarArbol2 (a2^.hD, a);
    end;
end;

procedure cargarAutos (var a1: arbol1; var a2: arbol2);
var 
    a: auto;
    ok: boolean;
begin
    leerAuto (a);
    while (a.patente <> -1) do begin
        ok:= false;
        agregarArbol1 (a1, a);
        buscar (a2, a, ok);
        if (not ok) then 
            agregarArbol2 (a2, a);
        leerAuto (a);
    end;   
end;

function contarMarcaArbol1 (a1: arbol1; marca: string): integer;
var 
    cant: integer;
begin
    cant:= 0;
    if (a1 <> nil) then begin
        if (a1^.info.marca = marca) then 
            cant:= cant + 1;
        cant:= cant + contarMarcaArbol1 (a1^.hI, marca);
        cant:= cant + contarMarcaArbol1 (a1^.hD, marca);
    end;
    contarMarcaArbol1:= cant;
end;

procedure contar (pri: lista; var cant: integer);
begin
    while (pri <> nil) do begin
        cant:= cant + 1;
        pri:= pri^.sig;
    end;    
end;

procedure contarMarcaArbol2 (a2: arbol2; marca: string; var cant: integer; var listo: boolean);
begin
    if (a2 <> nil) then begin
        if (a2^.info^.elem.marca = marca) then begin
            listo:= true;
            contar (a2^.info, cant);
        end
        else begin
            contarMarcaArbol2 (a2^.hI, marca, cant, listo);
            if (listo <> true) then 
                contarMarcaArbol2 (a2^.hI, marca, cant, listo);
        end;
    end;    
end;

procedure armarArbol3 (a1: arbol1; var a3: arbol1);
begin
    if (a1 <> nil) then begin
        agregarArbol3 (a3, a1^.info);
        armarArbol3 (a1^.hI, a3);
        armarArbol3 (a1^.hD, a3);
    end;    
end;

procedure buscarModelo (a1: arbol1; patente: integer; var modelo: string; var listo: boolean);
begin
    if (a1 <> nil) then begin
        if (a1^.info.patente = patente) then begin
            listo:= true;
            modelo:= a1^.info.modelo;
        end
        else begin
            buscarModelo (a1^.hI, patente, modelo, listo);
            if (not listo) then 
                buscarModelo (a1^.hD, patente, modelo, listo);
        end;
    end;   
end;

procedure buscarPatente (pri: lista; patente: integer; var modelo: string; var listo: boolean);
begin
    while ((pri <> nil) and (not listo)) do begin
        if (pri^.elem.patente = patente) then begin
            listo:= true;
            modelo:= pri^.elem.modelo;
        end 
        else 
            pri:= pri^.sig;
    end;
end;

procedure buscarModelo2 (a2: arbol2; patente: integer; var modelo: string; var listo: boolean);
begin
    if (a2 <> nil) then begin
        buscarPatente (a2^.info, patente, modelo, listo);
        if (not listo) then begin
            buscarModelo2 (a2^.hI, patente, modelo, listo);
            if (not listo) then 
                buscarModelo2 (a2^.hD, patente, modelo, listo);
        end;
    end;    
end;

var 
    a1, a3: arbol1;
    a2: arbol2;
    marca, modelo: string[12];
    cant, patente: integer;
    listo: boolean;
begin
    a1:= nil;
    a2:= nil;
    cargarAutos (a1, a2);   //Cargo todos los autos que tengo en la agencia
    writeln ('Ingrese una marca');
    readln (marca);
    cant:= 0;
    cant:= cant + contarMarcaArbol1 (a1, marca);
    writeln ('La cantidad de autos encontrados fue : ', cant);
    writeln ('Ingrese una marca denuevo');
    readln (marca);
    cant:= 0;
    listo:= false;
    contarMarcaArbol2 (a2, marca, cant, listo);
    writeln ('La cantidad de autos encontrados fue : ', cant);
    armarArbol3 (a1, a3);   //armo un tercer arbol ordenado por año de fabricacion
    writeln ('Ingrese una patente para ser buscada');
    readln (patente);
    listo:= false;
    buscarModelo (a1, patente, modelo, listo);
    writeln ('El modelo del auto con dicha patente es ',modelo);
    writeln ('Ingrese una patente para ser buscada nuevamente');
    readln (patente);
    listo:= false;
    buscarModelo2 (a2, patente, modelo, listo);
    writeln ('El modelo del auto con dicha patente es ',modelo);
end.
