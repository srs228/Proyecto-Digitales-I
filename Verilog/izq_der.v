//Recorrido Izquierda - Derecha

//Comparador
module Comparador
(
    input wire [7:0] a, b,
    output wire w, z,
);

wire x;
wire y;

always @(a,b)
    begin
        assign w = ~(~a & b) & (a | b)
        assign z = ~w
    end
endmodule // comparador