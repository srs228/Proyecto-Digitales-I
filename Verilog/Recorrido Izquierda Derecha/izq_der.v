/*  Proyecto Final
    Circuitos Digitales I
    ---------------------
    Eduard Alonso Corrales
    Sebastian Rojas
    Kevin Vasquez
*/

//Recorrido Izquierda - Derecha
//Conductual (Behavioral)
/*
Se decidio usar un metodo conductual para esta seccion, debido a
que al poseer mas estados, se requieren mas conectivas y cables, lo
cual complica el proceso
*/
//-------------------------------------------------------------------

//Comparador
module Comparador
#(parameter N = 8 //parametro N bits entrada
)(
    input wire [N-1:0] wordA, wordB,
    output wire w, z
);

//Cables internos para comunicacion entre celdas
wire x;
wire y;


//Celda Inicial (Tambien Tipica)
    assign x = ~(|(wordA)) & |(wordB);
    assign y = |(wordA ^ wordB);

//Celda Final
    assign w = ~(|x) & |y;
    assign z = ~w;

endmodule // Comparador