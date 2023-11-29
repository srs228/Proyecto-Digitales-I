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
module Comparador #(parameter N = 8) (
  input wire [N-1:0] A, B,
  output wire Z
);

  // Celda Inicial
  wire [N-1:0] X, Y;
  assign X = ~ (A & B);
  assign Y = (A & ~B) | ~ (A & B);

  // Celda Típica
  wire x, y;
  assign x = ~ (|X);
  assign y = |Y;
  wire [N-1:0] X1, Y1;
  assign X1 = x | ~ (y & ~ (A & B));
  assign Y1 = x | ~ (y & (A & ~B)) | ~ (y & ~ (A & B)) | ~ (x & y & ~A) | ~ (x & y & B);

  // Celda Final
  assign Z = (B >= A) | ~(|X1 | Y1);

endmodule // Comparador