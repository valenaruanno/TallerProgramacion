program ejercicio3;
type  

    moduloB = record 
        dni: integer;
        anioI: integer;
    end;

    listaB = ^nodoLB;
    nodoLB = record
        info: moduloB;
        sig: listaB;
    end;

    final = record
        cod: integer;
        nota: integer;
    end;

    lista = ^nodo;
    nodo = record 
        dato: final;
        sig: lista;
    end;

    alumno = record
        legajo: integer;
        dni: integer;
        anioI: integer;
        finales: lista;
    end;

    arbol = ^nodoA;
    nodoA = record  
        info : alumno;
        hI: arbol;
        hD: arbol;
    end;
procedure listar (pri: listaB);
begin
    while (pri <> nil) do begin
        writeln (pri^.info.dni, ' | ');
        pri:= pri^.sig;
    end;
end;

procedure analizarNotas (pri: lista; var cant: integer; var notas: real);
begin
    while (pri <> nil) do begin
        cant:= cant + 1;
        notas:= notas + pri^.dato.nota;
        pri:= pri^.sig;
    end;    
end;

procedure buscarPromedio (a: arbol; var legajoProm: integer; var prom: real);
var 
    cant: integer;
    notas: real;
begin
    if (a <> nil) then begin
        cant:= 0;
        notas:= 0;
        analizarNotas (a^.info.finales, cant, notas);
        if (notas / cant > prom) then begin
            legajoProm:= a^.info.legajo;
            prom:= notas / cant;
        end;
        buscarPromedio (a^.hI, legajoProm, prom);
        buscarPromedio (a^.hD, legajoProm, prom);
    end;
end;

procedure buscarDniMax (a: arbol; var dniMax: integer);
begin
    if (a <> nil) then begin
        if (a^.info.dni > dniMax) then 
            dniMax:= a^.info.dni;
        buscarDniMax (a^.hI, dniMax);
        buscarDniMax (a^.hD, dniMax);
    end;    
end;

procedure buscarLegajoMax (a: arbol; var legajoMax: integer);
begin
    if (a <> nil) then begin
        if (a^.info.legajo > legajoMax) then 
            legajoMax:= a^.info.legajo;
        buscarLegajoMax (a^.hI, legajoMax);
        buscarLegajoMax (a^.hD, legajoMax);
    end;    
end;

procedure agregarListaB (var pri: listaB; i: moduloB);
var 
    nue: listaB;
begin
    new (nue);
    nue^.info:= i;
    nue^.sig:= pri;
    pri:= nue;    
end;

procedure listaModuloB (a: arbol; var pri: listaB; l: integer);
var 
    i: moduloB;
begin
    if (a <> nil) then begin
        if (a^.info.legajo < l) then begin 
            i.dni:= a^.info.dni;
            i.anioI:= a^.info.anioI;
            agregarListaB (pri, i);
        end;
        listaModuloB (a^.hI, pri, l);
        listaModuloB (a^.hD, pri, l);
    end;
end;

procedure agregarLista (var pri: lista; f: final);
var 
    nue: lista;
begin
    new (nue);
    nue^.dato:= f;
    nue^.sig:= pri;
    pri:= nue;    
end;

procedure leerFinal (var f: final);
begin
    writeln ('Ingrese el codigo de la materia o -1 para cortar el ingreso de materias');
    readln (f.cod);
    if (f.cod <> -1) then begin
        writeln ('Ingrese la nota que obtuvo');
        readln (f.nota);
    end;    
end;

procedure leerInfo (var i: alumno);
var 
    pri: lista;
    f: final;
begin
    pri:= nil;
    writeln ('Ingrese el legajo del alumno');
    readln (i.legajo);
    if (i.legajo <> 0) then begin
        writeln ('Ingrese el dni del alumno');
        readln (i.dni);
        writeln ('Ingrese el año en el que ingreso el alumno');
        readln (i.anioI);
        leerFinal (f);
        while (f.cod <> -1) do begin
            agregarLista (pri, f);
            leerFinal (f);
        end;
        i.finales:= pri;
    end;
end;

procedure agregarArbol (var a: arbol; i: alumno);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.info:= i;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (i.legajo <= a^.info.legajo) then 
            agregarArbol (a^.hI, i)
        else 
            agregarArbol (a^.hD, i);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    i: alumno;
begin
    leerInfo (i);
    while (i.legajo <> 0) do begin
        agregarArbol (a, i);
        leerInfo (i);
    end;    
end;

var 
    a: arbol;
    pri: listaB;
    legajo, legajoMax, dniMax, legajoProm: integer;
    prom: real;
begin
    pri:= nil;
    a:= nil;
    armarArbol (a);     //armamos el arbol con los distintos estudiantes
    writeln ('Ingrese un legajo para conformar la lista');
    readln (legajo);
    listaModuloB (a, pri, legajo);       //retorna una lista con los legajo de  menores al parametro 
    listar (pri);
    legajoMax:= -1;
    buscarLegajoMax (a, legajoMax);     //busqueda del legajo mas grande 
    writeln ('El legajo max es ',legajoMax);
    dniMax:= -1;
    buscarDniMax (a, dniMax);     //busqueda del dni mas grande 
    writeln ('El dni max es ',dniMax);
    prom:= -1;
    buscarPromedio (a, legajoProm, prom);       //busco el alumno con promedioMax
    writeln ('El alumno con mayor promedio es ',legajoProm,', con un promedio de ',prom:0:2);
end.