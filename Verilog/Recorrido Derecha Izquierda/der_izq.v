/*  Proyecto Final
    Circuitos Digitales I
    ---------------------
    Eduard Alonso Corrales
    Sebastian Rojas
    Kevin Vasquez
*/

//Recorrido Izquierda - Derecha
//Estructural
/*
Se decidio usar un metodo estructural para esta seccion, debido a
que al poseer menos estados, se requieren menos conectivas y cables
*/
//-------------------------------------------------------------------

//Comparador
module Comparador
#(
    parameter N = 8 // Parámetro N bits entrada
)
(
    input wire [N-1:0] wordA, wordB,
    output wire z
);

    // Cables para la celda inicial
    wire x, w;

    // Celda inicial
    not(w, |wordB);
    and(x, |wordA, w);

    // Cables para celda típica
    wire x1, w1, w2;

    // Celda típica
    and(w1, |x, |w);
    and(w2, |x, |wordA);
    or(x1, |x, |w1, |w2);

    // Celda final
    assign z = ~((x1 == 0) && (wordA > wordB));

endmodule // Comparador