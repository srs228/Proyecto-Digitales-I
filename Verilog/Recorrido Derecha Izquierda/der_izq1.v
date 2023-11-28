//Recorrido Derecha Izquierda

module Comparador
#(parameter N = 8 //parametro N bits entrada
)(
    input wire [N-1:0] wordA, wordB,
    output wire z
);

    //Cables para la celda inicial
    wire x, w;

    //Celda inicial
    not(w, wordB);
    and(x, wordA, w);

    //Cables para celda tipica
    wire x1, w1, w2;

    //Celda tipica
    and(w1, x, w);
    and(w2, x, wordA);
    or(x1, x, w1, w2);

    //Celda final
    not(z, x1);

endmodule // Comparador