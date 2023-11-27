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


//Celda Inicial (Tambien Tipica)
    assign x = ~(|(wordA)) & |(wordB);
    assign y = |(wordA ^ wordB);

//Celda Final
    assign w = ~x & y;
    assign z = ~w;

endmodule // Comparador