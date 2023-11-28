`timescale 1ns/1ps

module der_izq_tb;


    // Definición de señales de entrada
    reg [7:0] A, B;


    // Definición de señales de salida
    reg x_out, X, Z;

    localparam period = 10;

    // Instanciación del módulo principal
    principal uut (.A(A), .B(B), .Z(Z));

  // Instanciación del primer módulo X1
  X1 x1_inst (.A(A), .B(B), .x(x_out));

  // Instanciación del segundo módulo X2
  X2 x2_inst (.A(A), .B(B), .x(x_out), .X(X));

  // Inicialización de señales de entrada
  initial 
  
    begin
        $dumpfile("der_izq_tb.vcd");
        $dumpvars(1, der_izq_tb);


    //Aplicar patrones de entrada y observar las salidas
        A = 8'b00000000;
        B = 8'b00000000;
        #period;

        A = 8'b11011000;
        B = 8'b00100000;
        #period;

        A = 8'b11100000;
        B = 8'b00100000;
        #period;

        A = 8'b00000000;
        B = 8'b00100000;
        #period;

        A = 8'b01100000;
        B = 8'b00000000;
        #period;

        A = 8'b11100111;
        B = 8'b10000001;
        #period;



    // Puedes continuar con más patrones de entrada según sea necesario

    // Finalizar la simulación
  end


endmodule
