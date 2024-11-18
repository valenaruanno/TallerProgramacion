program ejercicio1;
type    

    socio = record
        num: integer;
        nombre: string[10];
        edad: integer;
    end;

    arbol = ^nodo;

    nodo = record 
        dato: socio;
        hI: arbol;
        hD: arbol;
    end;

procedure informeParesDecreciente (a: arbol);
begin
    if (a <> nil) then begin
        informeParesDecreciente (a^.hD);
        if (a^.dato.num MOD 2 = 0) then 
            write (a^.dato.num, ' | ');
        informeParesDecreciente (a^.hI);
    end;    
end;

procedure informeCreciente (a: arbol);
begin
    if (a <> nil) then begin
        informeCreciente (a^.hI);
        write (a^.dato.num, ' | '); 
        informeCreciente (a^.hD);
    end;    
end;

function edades (a: arbol): integer;
var 
    tot: integer;
begin
    tot:= 0;
    if (a <> nil) then 
        tot:= tot + a^.dato.edad + edades(a^.hI) + edades(a^.hD);
    edades:= tot;
end;

procedure cuantosSocios (a: arbol; var cant: integer);
begin
    if (a <> nil) then begin
        cant:= cant + 1;
        cuantosSocios (a^.hI, cant);
        cuantosSocios (a^.hD, cant);
    end;
end;

function buscarSocioNombre (a: arbol; nombre: string): boolean;
var 
    si: boolean;
begin
    si:= false;
    if (a^.dato.nombre = nombre) then 
        si:= true
    else begin
        if (a^.hI <> nil) then 
            si:= buscarSocioNombre (a^.hI, nombre);
        if ((si = false) and (a^.hD <> nil)) then 
            si:= buscarSocioNombre (a^.Hd, nombre);
    end;    
    buscarSocioNombre:= si;
end;

function buscarSocio (a: arbol; num: integer): boolean;
var 
    si: boolean;
begin
    si:= false;
    if (a^.dato.num = num) then 
        si:= true
    else begin
        if (a^.hI <> nil) then 
            si:= buscarSocio (a^.hI, num);
        if ((si = false) and (a^.hD <> nil)) then 
            si:= buscarSocio (a^.Hd, num);
    end;    
    buscarSocio:= si;
end;

procedure adicionoEdad (a: arbol);
begin
    if (a <> nil) then begin
        a^.dato.edad:= a^.dato.edad + 1;
        adicionoEdad (a^.hI);
        adicionoEdad (a^.hD);
    end;    
end;

procedure mayorEdad (a: arbol; var edadMax: integer);
begin
    if (a <> nil) then begin
        mayorEdad (a^.hI, edadMax);
        mayorEdad(a^.hD, edadMax);
        if (a^.dato.edad > edadMax) then 
            edadMax:= a^.dato.edad;
    end;    
end;

procedure socioMin (a: arbol; var min: socio);
begin
    if (a^.hI <> nil) then 
        socioMin (a^.hI, min)
    else 
        min:= a^.dato;    
end;

procedure socioMax (a: arbol; var max: integer);
begin
    if (a^.hD <> nil) then 
        socioMax (a^.hD, max)
    else 
        max:= a^.dato.num;
end;

procedure leerSocio (var s: socio);
begin
    writeln ('Ingrese el numero de socio');
    readln (s.num); 
    if (s.num <> 0) then begin
        writeln ('Ingrese el nombre del socio');
        readln (s.nombre);
        writeln ('Ingrese la edad del socio');
        readln(s.edad);
    end;
end;

procedure agregar (var a: arbol; s: socio);
var 
    nue: arbol;
begin
    if (a = nil) then begin
        new (nue);
        nue^.dato:= s;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (s.num <= a^.dato.num) then 
            agregar (a^.hI, s)
        else 
            agregar (a^.hD, s);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    s: socio;
begin
    leerSocio (s);
    while (s.num <> 0) do begin
        agregar (a,s);
        leerSocio(s);
    end;
end;

var 
    a: arbol;
    max, edadMax, num, cant, e: integer;
    min : socio;
    existe: boolean;
    nombre: string[10];
begin
    a:= nil;
    armarArbol (a);     //armo todo el arbol
    max:= -1;
    socioMax (a, max);       //busco el numero de socio mas grande 
    writeln ('El numero de socio mas grande es ', max);
    min.num:= 9999;
    socioMin (a, min);      //busco el socio con numero mas chico
    writeln ('El numero de socio mas chico es ',min.num,' , es del socio ', min.nombre, ' y tiene ', min.edad,' años.');
    edadMax:= -1;
    mayorEdad (a, edadMax);     //busco el numero de socio con mayor edad
    writeln ('El numero de socio con mayor edad es ', edadMax);
    adicionoEdad (a);           //adiciono en uno la edad de todos los socios
    writeln ('Ingrese un numero de socio para que sea buscado');
    readln (num);
    existe:= buscarSocio (a, num);
    writeln ('Resultado de la busqueda por el numero de socio ingresado: ',existe);
    writeln ('Ingrese un nombre de socio para que sea buscado');
    readln (nombre);
    existe:= buscarSocioNombre (a, nombre);
    writeln ('Resultado de la busqueda por el numero de socio ingresado: ',existe);
    cant:= 0;
    cuantosSocios (a, cant);
    writeln ('La cantidad de socios es: ', cant);
    e:= 0;
    e:= e + edades (a);     //suma las edades de todos los socios y las almacena en la variable e
    writeln ('El promedio de edad es: ', e/cant);
    writeln ('La suma de las edades de los socios es: ', e); 
    informeCreciente (a);       //informo los numeros de socios en forma creciente
    informeParesDecreciente (a);        //informo los numeros de socios pares y en forma decreciente
end.
