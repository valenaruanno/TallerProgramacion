program ejercicio3;
type
    lista = ^nodo;

    nodo = record
        elem: integer;
        sig: lista;
    end;

procedure recorrer (pri: lista);
begin
    while (pri <> nil) do begin    
        writeln (pri^.elem);
        pri:= pri^.sig;
    end;
end;

procedure moduloD (pri: lista; valor: integer; var ok: boolean);
begin
    if (pri^.elem = valor) then 
        ok:= true
    else begin
		if (pri^.sig <> nil) then
			moduloD (pri^.sig, valor, ok);   
    end; 
end;

procedure moduloC (pri: lista; var max: integer);
begin
    if (pri^.sig <> nil) then 
        moduloC (pri^.sig, max);
    if (pri^.elem > max) then 
        max:= pri^.elem;    
end;

procedure moduloB (pri: lista; var min: integer);
begin
    if (pri^.sig <> nil) then 
        moduloB (pri^.sig, min);
    if (pri^.elem < min)  then
        min:= pri^.elem;
end;

procedure moduloA (var pri: lista);
var 
    num: integer;
    nue: lista;
begin
    new (nue);
    num:= Random (100);
    if (num <> 0) then 
        moduloA (pri);
    nue^.elem := num;
    nue^.sig:= pri;
    pri:= nue;
end;

var 
    pri: lista;
    min, max, valor: integer;
    ok : boolean;
begin
    pri:= nil;
    min:= 9999;
    max:= -1;
    ok:= false;
    Randomize();
    moduloA (pri);      //Crear la lista terminada en 0
    moduloB (pri, min);     //Encontrar con un metodo recursivo el menor de la lista
    moduloC (pri, max);     //Lo mismo que el anterior pero buscando el maximo
    writeln ('Ingrese un valor que desee buscar en la lista');
    readln (valor);
    moduloD (pri, valor, ok);      //Devuelve si un valor se encuentra 
    writeln ('Minimo: ', min);
    writeln ('Maximo: ', max);
    writeln ('Ok: ', ok);
    writeln ('La siguiente era la lista');
    recorrer (pri);
end.
