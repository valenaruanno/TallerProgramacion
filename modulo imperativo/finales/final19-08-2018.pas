program pizzeria;
type
    pedido = record 
        dni: integer;
        nombre: string[15];
        fecha: string[10];
        monto: real;
    end;


    e = record 
        fecha: string[10];
        monto: real;
    end;
    lista = ^nodoL;
    nodoL = record 
        elem: e;
        sig: lista;
    end;

    info = record 
        dni: integer;
        nombre : string[15];
        iLista: lista;
    end;

    arbol = ^nodo;
    nodo = record 
        elem: info;
        hI: arbol;
        hD: arbol;
    end;

procedure leerPedido (var p: pedido);
begin
    writeln ('Ingrese el monto del pedido');
    readln (p.monto);
    if (p.monto <> 0) then begin
        writeln ('Ingrese el dni del cliente');
        readln (p.dni);
        writeln ('Ingrese el nombre del cliente');
        readln (p.nombre);
        writeln ('Ingrese la fehca del pedido');
        readln (p.fecha);
    end;    
end;

procedure agregarLista (var pri: lista; el: e);
var 
    nue: lista;
begin
    new (nue);
    nue^.elem:= el;
    nue^.sig:= pri;
    pri:= nue;  
end;

procedure buscar (var a: arbol; p: pedido; var esta: boolean);
var 
    eLista: e;
begin
    if (a <> nil) then begin
        if (a^.elem.dni = p.dni) then begin
            esta:= true;
            eLista.fecha:= p.fecha;
            eLista.monto:= p.monto;
            agregarLista (a^.elem.iLista, eLista);
        end
        else begin
            if (p.dni <= a^.elem.dni) then 
                buscar (a^.hI, p, esta)
            else 
                buscar (a^.hD, p, esta);
        end;
    end;    
end;

procedure agregarArbol (var a: arbol; i: info);
var 
    nue: arbol;
    pri: lista;
begin
    if (a = nil) then begin
        pri:= nil;
        i.iLista:= pri;
        new (nue);
        nue^.elem:= i;
        nue^.hI:= nil;
        nue^.hD:= nil;
        a:= nue;
    end
    else begin
        if (i.dni <= a^.elem.dni) then 
            agregarArbol (a^.hI, i)
        else 
            agregarArbol (a^.hD, i);
    end;
end;

procedure armarArbol (var a: arbol);
var 
    p: pedido;
    esta: boolean;
    i: info;
begin
    leerPedido (p);
    while (p.monto <> 0) do begin
        esta:= false;
        buscar (a, p, esta);
        if (not esta) then begin
            i.dni:= p.dni;
            i.nombre:= p.nombre;
            agregarArbol (a, i);
        end;
        leerPedido (p);
    end;    
end;

function contarPedidos (pri: lista; fecha: string): integer;
var 
    cant: integer;
begin
    cant:= 0;
    while (pri <> nil) do begin
    writeln ('La fecha del pedido es ', pri^.elem.fecha);
        if (pri^.elem.fecha = fecha) then 
            cant:= cant + 1;
        pri:= pri^.sig;
    end;    
    contarPedidos:= cant;
end;

function punto2 (a: arbol; fecha: string): integer;
var 
    cant: integer;
begin
    cant:= 0;
    if (a <> nil) then begin
        cant:= cant + contarPedidos (a^.elem.iLista, fecha);
        cant:= cant + punto2 (a^.hI, fecha);
        cant:= cant + punto2 (a^.hD, fecha);
    end;
    punto2:= cant;    
end;

procedure procesar (pri: lista; var cantAbonado: real; var cantPedido: integer);
begin
    while (pri <> nil) do begin
        writeln ('La cantidad de pedidos hasta el momento es: ', cantPedido);
        cantAbonado:= cantAbonado + pri^.elem.monto;
        cantPedido:= cantPedido + 1;
        pri:= pri^.sig;
    end;    
end;

procedure procesarCliente (a: arbol; dni: integer; var cantAbonado: real; var cantPedido: integer; var listo: boolean);
begin
    if (a <> nil) then begin
        if (a^.elem.dni = dni) then begin
            listo:= true;
            procesar (a^.elem.iLista, cantAbonado, cantPedido);
        end
        else begin
            if (dni <= a^.elem.dni) then 
                procesarCliente (a^.hI, dni, cantAbonado, cantPedido, listo)
            else 
                procesarCliente (a^.hD, dni, cantAbonado, cantPedido, listo);
        end;
    end;    
end;

var 
    a: arbol;
    cantPedidos, dni: integer;
    cantAbonado: real;
    fecha: string[10];
    listo: boolean;
begin
    a:= nil;
    armarArbol (a);     //proceso todos los pedidios
    writeln ('Ingrese una fecha para buscar cuantos pedidos se realizaron durante la misma');
    readln (fecha);
    cantPedidos:= 0;
    cantPedidos:= punto2 (a, fecha);
    writeln ('La cantidad de pedidos ingresados durante la fecha dada es ', cantPedidos);
    writeln ('Ingrese el dni de un cliente al cual se le quiera hacer un reporte');
    readln (dni);
    cantPedidos:= 0;
    cantAbonado:= 0;
    listo:= false;
    procesarCliente (a, dni, cantAbonado, cantPedidos, listo);
    writeln ('La cantidad de pedidos ingresados del cliente dado es ', cantPedidos);
    writeln ('La cantidad abonada por el cliente fue $',cantAbonado:0:2);
end.
