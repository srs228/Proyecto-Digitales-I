//Recorrido Derecha - Izquierda
/*
    Proyecto de Circuito Digitales 1

    Kevin Vásquez
    Sebastian Rojas
    Alonso Corrales
*/

/*
    Sentido de recorrido de derecha a izquierda
    Se implementa de forma estructural ya que al necesitarse de dos estados...
    ...se requiere de menor lógica y resulta más fácil alambrar meduiante instancias.
*/


//Módulo para la celda inicial, se establece como X1 y X2 por la Funcion de proximo estado X(x,A,B), no por alguna otra razon

//Se establecen las entradas y las salidas del módulo.

module X1 (
  input A,
  input B,
  output reg x
);

  assign x = A & ~B;

endmodule





//Módulo para la celda típica, la salida de la etapa anterior es entrada de esta.

module X2 (
  input x,
  input A,
  input B,
  output reg X
);


// Implementación de la función lógica que describe el Proximo Estado, la Explicacion de esta ecuación viene en el reporte.
    assign X = (A & ~B) | (x & ~B) | (x & A);

endmodule


// Se establece un módulo que sirve para intercomunicar la celda inicial y la tipica por medio de instancias.

// Como Z se activa en bajo, se requiere negar X, el cual es la salida Z, por tanto se niega.

module principal (
  input A,
  input B,
  output reg Z
);

  wire x_out;

  // Instanciación del primer módulo X1
  X1 x1_inst (
    .A(A),
    .B(B),
    .x(x_out)
  );

  // Instanciación del segundo módulo X2
  X2 x2_inst (
    .A(A),
    .B(B),
    .x(x_out),
    .X(Z)
  );

  // La salida final es la negación de Z
  assign Z = ~Z;

endmodule
