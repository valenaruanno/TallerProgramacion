program final622024;
type 
    alumnos = record 
        dni: string[10];
        nombre: string[15];
        tiempo: real;
    end;

    arbol = ^nodoA;
    nodoA = record 
        elem: alumnos;
        hI: arbol;
        hD: arbol;
    end;

    lista = ^nodoL;
    nodoL = record
        elem: alumnos;
        sig: lista;
    end;

procedure leerAlumno(var a: alumnos);
begin
    writeln ('Ingrese el dni del alumno');
    readln (a.dni);
    if (a.dni <> '0') then begin
        writeln ('Ingrese el nombre del alumno');
        readln (a.nombre);
        writeln ('Ingrese el tiempo del alumno');
        readln (a.tiempo);
    end;    
end;

procedure cargarArbol (var a: arbol; alu: alumnos);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.elem:= alu;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (alu.tiempo <= a^.elem.tiempo) then 
            cargarArbol (a^.hI, alu)
        else 
            cargarArbol (a^.hD, alu);
    end;
end;

procedure moduloA (var a: arbol);
var 
    alu: alumnos;
begin
    leerAlumno(alu);
    while (alu.dni <> '0') do begin
        cargarArbol (a, alu);
        leerAlumno (alu);
    end;
end;

procedure agregarLista (var pri, ult: lista; a: arbol);
var 
    nue: lista;
begin
    new (nue);
    nue^.elem:= a^.elem;
    nue^.sig:= nil;
    if (pri = nil) then 
        pri:= nue
    else 
        ult^.sig:= nue;
    ult:= nue;  
end;

procedure moduloB (a: arbol; var pri, ult: lista; r1, r2: real);
begin
    if (a <> nil) then begin
        moduloB (a^.hI, pri, ult, r1, r2);
        if ((a^.elem.tiempo >= r1) and (a^.elem.tiempo <= r2)) then 
            agregarLista (pri, ult, a);
        moduloB (a^.hD, pri, ult, r1, r2);
    end;    
end;

function moduloC (a: arbol): arbol;
begin
    while (a^.hI <> nil) do  
        a:= a^.hI;
    moduloC:= a;   
end;

procedure imprimirArbol (a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol (a^.hI);
        write (a^.elem.tiempo, '| ');
        imprimirArbol (a^.hD);
    end;    
end;

procedure imprimirLista (pri: lista);
begin
    while (pri <> nil) do begin
        write (pri^.elem.tiempo, '| ');
        pri:= pri^.sig;
    end;
end;

var 
    a, min: arbol;
    pri, ult: lista;
    r1, r2: real;
begin
    a:= nil;
    pri:= nil;
    ult:= nil;
    moduloA (a); //leo toda la info y armo el arbol
    writeln ('----------------------------------------Imprimo el arbol-----------------------------------');
    imprimirArbol (a);
    writeln ('');
    writeln ('Ingrese un tiempo');
    readln (r1);
    writeln ('Ingrese otro tiempo mayor al primero');
    readln (r2);
    moduloB (a, pri, ult, r1, r2);  //armo la lista a partir de los rangos
        writeln ('----------------------------------------Imprimo la lista-----------------------------------');
    imprimirLista (pri);
    writeln (' ');
    min:= moduloC (a);
    if (a = nil) then   
        writeln ('Es nil');
    writeln ('El dni del alumno mas rapido es ', min^.elem.dni);
end.
