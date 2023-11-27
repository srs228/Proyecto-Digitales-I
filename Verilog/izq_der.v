//Recorrido Izquierda - Derecha

//Comparador
module Comparador
#(parameter N = 8 //parametro N bits entrada
)(
    input wire [N-1:0] wordA, wordB,
    output wire w, z
);

wire x;
wire y;


//Ejecucion en paralelo
    assign x = ~wordA & wordB;
    assign y = wordA ^ wordB;

//Ejecucion en serie
    assign w = ~x & y;
    assign z = ~w;

endmodule // Comparador